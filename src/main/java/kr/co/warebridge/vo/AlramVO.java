package kr.co.warebridge.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AlramVO {

	private String alramNo;
	private String empNo;
	private String read;
	private String link;
	private String message;
	
	public AlramVO(String empNo,String link, String message) {
		super();
		this.empNo = empNo;
		this.link = link;
		this.message = message;
	}

	public AlramVO(String empNo,String alramNo) {
		super();
		this.alramNo = alramNo;
		this.empNo = empNo;
	}
	
}
