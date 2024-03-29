package kr.co.warebridge.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= {"crjEmpNo"})
public class ChatRoomJoinVO {
	private String crjEmpNo;
	private int crjChatRoomNo;
	private String myTitle;
}
