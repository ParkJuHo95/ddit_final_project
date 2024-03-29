package kr.co.warebridge.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"ymd", "empNo", "cmpId"})
public class RecomMenuVO {

	private String ymd;
	private String empNo;
	private String cmpId;
	private Integer mId;
	private String mName;
	
}
