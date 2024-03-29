package kr.co.warebridge.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= {"chatRoomNo"})
public class ChatRoomVO {
	private int chatRoomNo;
	private String title;
	private String cnt;
	private String openUser;
	private String targetUser;
	private String myTitle;
	private int notReadMsgCnt;
}
