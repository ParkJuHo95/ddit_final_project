package kr.co.warebridge.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class NewsRecomVO {
	private String nBirth;
	private String nGen;
	private String nAddr;
	private String nCode;
	
	private NewsVO news;
	
	
}
