package kr.co.warebridge.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.warebridge.chat.service.ChatService;
import kr.co.warebridge.employee.service.EmployeeService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.ChatMessageVO;
import kr.co.warebridge.vo.ChatRoomJoinVO;
import kr.co.warebridge.vo.ChatRoomVO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/user/community")
//@SessionAttributes({"loginMember", "chatRoomNo"})
public class ChatController {
	
	@Inject
	private ChatService service;
	
	@Inject
	private EmployeeService empService;
	
	@GetMapping("chat")
	public String main(
		@RealUser EmployeeVO realUser
		, ModelMap model
		, HttpSession session
	) throws Exception {
		List<EmployeeVO> empList = service.retrieveEmp(realUser);
		model.addAttribute("empList",empList);

		List<ChatRoomVO> chatRoomList = service.retrieveChatRoomList(realUser.getEmpNo());
		model.addAttribute("chatRoomList", chatRoomList);
		
		return "user/community/chat";
	}
	
	
	// 채팅방 만들기
	@PostMapping("/chat/openChatRoom")
	public String openChatRoom(
		@RealUser EmployeeVO realUser,
		@ModelAttribute ChatRoomVO room,
		Model model
	) throws Exception {
		String targetNo = room.getTargetUser();
		EmployeeVO targetVO = empService.retrieveEmployee(targetNo);
		EmployeeVO openerVO = empService.retrieveEmployee(room.getOpenUser());
		
		String targetName = targetVO.getEmpName();
		String targetJobPosition = "";
		String openerName = openerVO.getEmpName();
		String openerJobPosition = "";
		
		if(targetVO.getEmpJobposition() != null) {
			targetJobPosition = targetVO.getEmpJobposition();
		}
		
		if(openerVO.getEmpJobposition() != null) {
			openerJobPosition = openerVO.getEmpJobposition();
		}
		
		String makeTitle = openerName+" "+openerJobPosition+"님, "+ targetName +" "+targetJobPosition+"님";
		room.setTitle(makeTitle);
		int cnt = service.createChatRoom(room);
		String check = "";
		String result = "";
		if(cnt == 999) {
			check = "already";
			result = String.valueOf(room.getChatRoomNo());
		} else if(cnt > 0) {
			check = "success";
			result = String.valueOf(room.getChatRoomNo());
		} else {
			check = "fail";
		}
		model.addAttribute("check",check);
		model.addAttribute("result", result);
		return "jsonView";
	}
	
	
//	@GetMapping("/chat/loadMessages")
//	@PostMapping("/chat/loadMessages")
	@RequestMapping("/chat/loadMessages")
	public String loadMessages(
		@RequestParam(value = "roomNo", required = false) String roomNo,
		@RealUser EmployeeVO realUser,
		Model model
	) {
		List<ChatMessageVO> messages = service.retrieveMessages(roomNo);
		model.addAttribute("messages",messages);
		service.modifyLastCheck(roomNo, realUser.getEmpNo());
		return "jsonView";
	}
	
	
	@PostMapping("/chat/modifyMyTitle")
	public String modifyMyTitle(
		Model model,
		ChatRoomJoinVO joinVO,
		@RealUser EmployeeVO realUser
	) {
		joinVO.setCrjEmpNo(realUser.getEmpNo());
		List<ChatRoomVO> roomList = service.retrieveChatRoomList(realUser.getEmpNo());
		int cnt = service.modifyMyTitle(joinVO);
		model.addAttribute("result",cnt);
		model.addAttribute("updateData",joinVO);
		return "jsonView";
	}

	@PostMapping("/chat/outFromRoom")
	public String outFromRoom(
		Model model,
		ChatRoomJoinVO joinVO
	) {
		int cnt = service.removeEmpFromRoom(joinVO);
		model.addAttribute("result", cnt);
		return "jsonView";
	}
	
	@PostMapping("/chat/loadAllUsers")
	public String loadAllUsers(
		Model model,
		@RequestParam String roomNo,
		@RealUser EmployeeVO realUser
	) throws Exception {
		List<EmployeeVO> finalUsers = new ArrayList<EmployeeVO>();
		List<EmployeeVO> empList = service.retrieveEmp(realUser);
		List<String> inUsers = service.retrieveChatRoomUser(roomNo);
		for(EmployeeVO emp : empList) {
			if(!inUsers.contains(emp.getEmpNo())) {
				finalUsers.add(emp);
			}
		}
		model.addAttribute("finalUsers", finalUsers);
		return "jonsView";
	}

	@PostMapping("/chat/insertUsers")
	public String insertUsers(
		Model model,
//		@RequestParam String roomNo,
//		@RequestParam("empNoList") String[] empNoList
		@RequestBody HashMap<String,Object> map
		) throws Exception {
		ArrayList<String> empNoList = (ArrayList<String>) map.get("empNoList");
		String roomNo = (String) map.get("roomNo");
		int cnt = service.modifyChatRoomPlus(roomNo, empNoList);
		String result = "";
		if(cnt > 0 ) {
			result = "success";
		} else {
			result = "fail";
		}
		model.addAttribute("result",result);
		return "jsonView";
	}
}