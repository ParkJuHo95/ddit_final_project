package kr.co.warebridge.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"ymd", "empNo", "cmpId"})
public class DietVO  implements Serializable{

	private String start;
	private String end;
	private String title;
	
	private String ymd;
	private String empNo;
	private String cmpId;
	private Integer mId;
	
//	private MenuVO menu;
}
