package kr.co.warebridge.vo;

import lombok.Data;

@Data
public class MailReceiverVO {
	private String mailCode;
	private String mailGetter;
	private String mailTitle;
	private String mailDetail;
	private String mailDate;
	private String mailVip;
	private String mailStatus;
}
