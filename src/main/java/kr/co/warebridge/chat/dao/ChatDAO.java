package kr.co.warebridge.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.warebridge.vo.ChatMessageVO;
import kr.co.warebridge.vo.ChatRoomJoinVO;
import kr.co.warebridge.vo.ChatRoomVO;
import kr.co.warebridge.vo.EmployeeVO;
@Mapper
public interface ChatDAO {

	public List<EmployeeVO> selectAllEmp(EmployeeVO realUser);
	
	public List<ChatRoomVO> selectChatRoomList(String empNo);
	
	public List<ChatRoomVO> selectChatRoomCnt(ChatRoomVO room);
	
	public List<String> selectUserInRoom(String roomNo);
	
	public int insertChatRoom(ChatRoomVO room);
	
	public int insertChatRoomJoin(@Param("user") String user,@Param("roomNo") String chatRoomNo, @Param("myTitle") String myTitle);
	
	public int updateChatRoomAdd(@Param("user") String user,@Param("roomNo") String chatRoomNo);

	public int updateChatRoomSub(@Param("user") String user,@Param("roomNo") String chatRoomNo);
	
	public int updateChatRoomCntPlus(String chatRoomNo);

	public int updateChatRoomCntMinus(String chatRoomNo);
	
	public int updateLastCheck(@Param("roomNo") String roomNo, @Param("empNo") String empNo);
	
	public List<ChatMessageVO> selectMessages(String roomNo);
	
	public int insertMessages(ChatMessageVO message);
	
	public int updateMyTitle(ChatRoomJoinVO joinVO);
	
	public int deleteEmpFromRoom(ChatRoomJoinVO joinVO);
	
	public int roomTotalMessageCnt(String roomNo);
	
	public Integer lastCheckMessageCnt(@Param("roomNo") String roomNo, @Param("empNo") String empNo);
	
}
