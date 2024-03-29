package kr.co.warebridge.vo;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ChatMessageVO implements Serializable{
	private String cmMessage;
	private LocalDateTime createDate;
	private int cmChatRoomNo;
	private String cmEmpNo;
	private String empName;
}
