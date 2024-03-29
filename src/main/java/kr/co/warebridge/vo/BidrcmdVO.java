package kr.co.warebridge.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class BidrcmdVO {
	private Integer brRank;
	private String brCmpIndustry;
	private String brCmpCptl;
	private LocalDate brRcmdymd;
	private String brBiBidno;
	
	private BidinfoVO bidinfo;
}
