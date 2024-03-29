package kr.co.warebridge.chat.service;

import java.util.List;

import kr.co.warebridge.vo.ChatMessageVO;
import kr.co.warebridge.vo.ChatRoomJoinVO;
import kr.co.warebridge.vo.ChatRoomVO;
import kr.co.warebridge.vo.EmployeeVO;

public interface ChatService {

	public List<ChatRoomVO> retrieveChatRoomList(String empNo);
	
	public List<EmployeeVO> retrieveEmp(EmployeeVO realUser) throws Exception;

	public List<ChatMessageVO> retrieveMessages(String roomNo);
	
	public int createChatRoom(ChatRoomVO room) throws Exception;
	
	public int modifyChatRoomPlus(String chatRoomNo, List<String> target);

	public int modifyChatRoomMinus(ChatRoomVO room);
	
	public int modifyMyTitle(ChatRoomJoinVO joinVO);
	
	public int modifyLastCheck(String roomNO, String empNo);
	
	public int removeEmpFromRoom(ChatRoomJoinVO joinVO);
	
	public List<String> retrieveChatRoomUser(String roomNo);
}
