package kr.co.warebridge.chat.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.chat.dao.ChatDAO;
import kr.co.warebridge.employee.service.EmployeeService;
import kr.co.warebridge.vo.ChatMessageVO;
import kr.co.warebridge.vo.ChatRoomJoinVO;
import kr.co.warebridge.vo.ChatRoomVO;
import kr.co.warebridge.vo.EmployeeVO;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Inject
	private ChatDAO dao;
	
	@Inject
	private EmployeeService service;
	
	@Override
	public List<ChatRoomVO> retrieveChatRoomList(String empNo) {
		List<ChatRoomVO> list = dao.selectChatRoomList(empNo);
		for(ChatRoomVO vo : list) {
			int total = dao.roomTotalMessageCnt(String.valueOf(vo.getChatRoomNo()));
			Integer last = dao.lastCheckMessageCnt(String.valueOf(vo.getChatRoomNo()), empNo);
			if(last == null) {
				last = 0;
			}
			vo.setNotReadMsgCnt(total-last);
		}
		return list; 
	}

	@Override
	public int createChatRoom(ChatRoomVO room) throws Exception {
		
		List<ChatRoomVO> cnts = dao.selectChatRoomCnt(room);
		
		boolean flag = true;
		
		for(ChatRoomVO vo : cnts) {
			String cnt = vo.getCnt();
			if(cnt != null && cnt.equals("2")) {
				flag = false;
				room.setChatRoomNo(vo.getChatRoomNo());
				break;
			}
		}
		
		if(!flag) {
			return 999;
		} else {
			int cnt1 = dao.insertChatRoom(room);
			
			EmployeeVO openUser = service.retrieveEmployee(room.getOpenUser());
			String openUserJob = "";
			if(openUser.getEmpJobposition() != null) {
				openUserJob = openUser.getEmpJobposition();
			}

			String openUserName = openUser.getEmpName()+" "+openUserJob+"님";

			EmployeeVO targetUser = service.retrieveEmployee(room.getTargetUser());
			
			String targetJob = "";
			
			if(targetUser.getEmpJobposition() != null) {
				targetJob = openUser.getEmpJobposition();
			}
			
			String targetUserName = targetUser.getEmpName()+" "+targetJob+"님";
			
			int cnt2 = dao.insertChatRoomJoin(room.getOpenUser(), String.valueOf(room.getChatRoomNo()), targetUserName);
			dao.updateChatRoomCntPlus(String.valueOf(room.getChatRoomNo()));
			int cnt3 = dao.insertChatRoomJoin(room.getTargetUser(), String.valueOf(room.getChatRoomNo()), openUserName);
			dao.updateChatRoomCntPlus(String.valueOf(room.getChatRoomNo()));
			if(cnt1 == 0 || cnt2 == 0 || cnt3 == 0 ) {
				throw new RuntimeException();
			}
		}
		return 1;
	}

	@Override
	public List<EmployeeVO> retrieveEmp(EmployeeVO realUser) throws Exception {
		List<EmployeeVO> empList = dao.selectAllEmp(realUser);
		service.Arraybase64(empList);
		return empList;
	}
	
	@Override
	public int modifyChatRoomPlus(String chatRoomNo, List<String> targets) {
		int result = 1;
		for(String target : targets) {
			int cnt1 = dao.updateChatRoomAdd(target, chatRoomNo);
			int cnt2 = dao.updateChatRoomCntPlus(chatRoomNo);
			if(cnt1 == 0 || cnt2 == 0) {
				result = 0;
			}
		}
		return result;
	}
	
	@Override
	public int modifyChatRoomMinus(ChatRoomVO room) {
		dao.updateChatRoomSub(room.getTargetUser(), String.valueOf(room.getChatRoomNo()));
		dao.updateChatRoomCntMinus(String.valueOf(room.getChatRoomNo()));
		return 0;
	}
	
	
	@Override
	public List<ChatMessageVO> retrieveMessages(String roomNo) {
		return dao.selectMessages(roomNo);
	}
	
	
	@Override
	public int modifyMyTitle(ChatRoomJoinVO joinVO) {
		return dao.updateMyTitle(joinVO);
	}
	
	@Override
	public int removeEmpFromRoom(ChatRoomJoinVO joinVO) {
		int result = 0;
		int cnt1 = dao.deleteEmpFromRoom(joinVO);
		int cnt2 = dao.updateChatRoomCntMinus(String.valueOf(joinVO.getCrjChatRoomNo()));
		if(cnt1 == 1 && cnt2 == 1) {
			result = 1;
		}
		return result;
	}
	
	@Override
	public List<String> retrieveChatRoomUser(String roomNo) {
		return dao.selectUserInRoom(roomNo);
	}
	
	@Override
	public int modifyLastCheck(String roomNO, String empNo) {
		return dao.updateLastCheck(roomNO, empNo);
	}
}
