package kr.co.warebridge.chat.controller;

import java.io.IOException;
import java.io.StringReader;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Component;

import kr.co.warebridge.alram.service.AlramService;
import kr.co.warebridge.chat.dao.ChatDAO;
import kr.co.warebridge.common.msg.config.MessageServerAppConfig;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.employee.dao.EmployeeDAO;
import kr.co.warebridge.eworks.dao.SnctdocumentDAO;
import kr.co.warebridge.mail.dao.MailDAO;
import kr.co.warebridge.vo.AlramVO;
import kr.co.warebridge.vo.ChatMessageVO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
@ServerEndpoint(value = "/messageServerEndpoint", configurator = MessageServerAppConfig.class)
public class MessageServerEndpoint {

	@Inject
	private EmployeeDAO dao;
	
	@Inject
	private ChatDAO Cdao;
	
	@Inject
	private AlramService Aservice;

	@Inject
	private SnctdocumentDAO sdcDao;
	
	@Inject
	private MailDAO mDao;
	
	private static Set<Session> msgAllUsers = Collections.synchronizedSet(new HashSet<Session>());

	// Spring bean과 연동하기 위해서는 ServerAppConfig를 configurator로 등록해주면 된다.
	/*
	 * @Resource(name="TestService") TestService testService;
	 */

	/**
	 * Handshaking 함수
	 *
	 * @param userSession 사용자 session
	 */
	@OnOpen
	public void handleOpen(Session userSession) {
		msgAllUsers.add(userSession);
	}

	/**
	 * Message전달 함수
	 *
	 * @param message     메시지
	 * @param userSession 사용자 session
	 * @throws IOException
	 * @throws EncodeException
	 */
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException, EncodeException {
		String username = (String) userSession.getUserProperties().get("username");
		
		JsonObject jsonObject = Json.createReader(new StringReader(message)).readObject();
		String connectionType = jsonObject.getString("connectionType");

		log.info("username : {}", username);
		log.debug("jsonObject : {}", jsonObject);
		log.debug("connectionType : {}", connectionType);
		log.debug("message : {}", message);
		
		
		if ("firstConnection".equals(connectionType) && username == null) {
			// 맨 처음 접속 시,
			// 사용자의 이름을 가져옴
			username = jsonObject.getString("username");

			log.info("{} is entered.", username);

			if (username != null) {
				userSession.getUserProperties().put("username", username);

				for (Session session : msgAllUsers) {
					session.getBasicRemote().sendText(buildJsonUserData(getUsers()));
				}
			}

		} else if ("msgCheck".equals(connectionType)) {
			String roomNo = jsonObject.getString("roomNo");
			Cdao.updateLastCheck(roomNo, username);
		} else if ("msgConnection".equals(connectionType)) {
			String KR_Name = dao.selectEmployee(username).getEmpName();
			String textMessage = jsonObject.getString("message");
			String roomNo = jsonObject.getString("roomNo");
			List<String> empList = Cdao.selectUserInRoom(roomNo);
			ChatMessageVO messageVO = new ChatMessageVO();
			LocalDateTime now = LocalDateTime.now();
			messageVO.setCmEmpNo(username);
			messageVO.setCmMessage(textMessage);
			messageVO.setCreateDate(now);
			try {
				messageVO.setCmChatRoomNo(Integer.valueOf(roomNo));
			} catch(NumberFormatException e) {
				return;
			}
			
			Cdao.insertMessages(messageVO);
			
			for (Session session : msgAllUsers) {
				if(empList.contains(session.getUserProperties().get("username"))) {
					if(session.getUserProperties().get("username").equals(username)) {
						continue;
					}
					String msg = Json.createObjectBuilder().add("connectionType", connectionType).add("roomNo", roomNo).add("time", now.toString()).add("message", textMessage).add("sender", KR_Name).build().toString();
					session.getBasicRemote().sendText(msg);
				}
			}
			
		} else if ("alramConnection".equals(connectionType)) {
			EmployeeVO realUser =dao.selectEmployee(username);
			String KR_Name = realUser.getEmpName();
			String alramMessage = jsonObject.getString("message");
			String link = jsonObject.getString("link");
			JsonArray receiver = jsonObject.getJsonArray("receiver");
			String classification = jsonObject.getString("classification");
			if(classification.equals("E")) {
				for (Session session : msgAllUsers) {
					for(int i=0;i<receiver.size();i++) {
						AlramVO vo = new AlramVO(receiver.getString(i),link,alramMessage);
						Aservice.createAlram(vo);
						String target = (String) session.getUserProperties().get("username");
						if(!target.equals(receiver.getString(i))) continue;
						String msg = Json.createObjectBuilder().add("alramNo", vo.getAlramNo()).add("connectionType", connectionType).add("sender", KR_Name).add("link", link).add("message", alramMessage).build().toString();
						session.getBasicRemote().sendText(msg);
					}
				}
			}
			
			if(classification.equals("D")) {
				String targetDPT = "";
				if(receiver.getString(0).equals("D1")) {
					targetDPT = realUser.getEmpDptId1();
				} else if (receiver.getString(0).equals("D2")) {
					targetDPT = realUser.getEmpDptId2();
				} else {
					targetDPT = receiver.getString(0);
				}
				List<String> empList = dao.selectEmpNoByTeam(targetDPT);
				for(String empNo : empList) {
					if(empNo.equals(username)) continue;
					AlramVO vo = new AlramVO(empNo,link,alramMessage);
					Aservice.createAlram(vo);
				}
				
				for (Session session : msgAllUsers) {
					String target = (String) session.getUserProperties().get("username");
					if(target.equals(username)) continue;
					if(!empList.contains(target)) continue;
					String msg = Json.createObjectBuilder().add("connectionType", connectionType).add("sender", KR_Name).add("link", link).add("message", alramMessage).build().toString();
					session.getBasicRemote().sendText(msg);
				}
			}
			
			if(classification.equals("C")) {
				List<String> empList = dao.selectEmpNoByCompany(receiver.getString(0));
				for(String empNo : empList) {
					if(empNo.equals(username)) continue;
					AlramVO vo = new AlramVO(empNo,link,alramMessage);
					Aservice.createAlram(vo);
				}
				for (Session session : msgAllUsers) {
					String target = (String) session.getUserProperties().get("username");
					if(target.equals(username)) continue;
					if(!empList.contains(target)) continue;
					String msg = Json.createObjectBuilder().add("connectionType", connectionType).add("sender", KR_Name).add("link", link).add("message", alramMessage).build().toString();
					session.getBasicRemote().sendText(msg);
				}
			}
			
		}
		
		PaginationInfo paging = new PaginationInfo();
		Map<String, Object> detailCondition = new HashedMap<String, Object>();
		detailCondition.put("ssEmpNo", username);
		detailCondition.put("ssStatus", "0");
		paging.setDetailCondition(detailCondition);
		int sdcNum = sdcDao.selectWaitingListTotalRecord(paging);
		
		//안읽은 메일 수
		detailCondition = new HashedMap<String, Object>();
		detailCondition.put("mailGetter", dao.selectEmployee(username).getEmpMail());
		paging.setDetailCondition(detailCondition);
		int mailCnt = mDao.selectMailCnt(paging);
		
		
		//뒤에다가 추가
		String pills = Json.createObjectBuilder().add("connectionType", "pill").add("sdcNum", sdcNum).add("mailCnt", mailCnt).build().toString();
		userSession.getBasicRemote().sendText(pills);
	}

	/**
	 * 연결을 끊기 직전에 호출되는 함수
	 *
	 * @param userSession
	 * @throws IOException
	 * @throws EncodeException
	 */
	// 예외처리 필요!
	@OnClose
	public void handleClose(Session userSession) throws IOException, EncodeException {

		String disconnectedUser = (String) userSession.getUserProperties().get("username");
		msgAllUsers.remove(userSession);

		if (disconnectedUser != null) {
			Json.createObjectBuilder().add("disconnectedUser", disconnectedUser).build().toString();

			for (Session session : msgAllUsers) {
				session.getBasicRemote().sendText( Json.createObjectBuilder().add("disconnectedUser", disconnectedUser).build().toString());
			}
		}
	}

	/**
	 * 연결되어있는 user정보를 가져오는 함수
	 *
	 * @return user set
	 */
	private Set<String> getUsers() {
		HashSet<String> returnSet = new HashSet<String>();

		for (Session session : msgAllUsers) {
			if (session.getUserProperties().get("username") != null) {
				returnSet.add(session.getUserProperties().get("username").toString());
			}
		}
		return returnSet;
	}

	/**
	 * 유저 정보가 담긴 Set<String>을 json으로 변환해주는 함수
	 *
	 * @param set
	 * @return jsondata
	 */
	private String buildJsonUserData(Set<String> set) {

		JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();

		for (String user : set) {
			jsonArrayBuilder.add(user);
		}
		return Json.createObjectBuilder().add("allUsers", jsonArrayBuilder).build().toString();
	}

}
