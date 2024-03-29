package kr.co.warebridge.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= {"biBidno"})
public class BidinfoVO {
	private String biBidno;
	private String biBidname;
	private String biBiddt;
	private String biAdagncs;
	private String biDmdagncs;
	private String biSrvcclsfc;
	private String biBidstartdt;
	private String biBidenddt;
	private String biBidopeningdt;
	private long biBidamout;
	private String biRgnlrstrc;
	private String biIndstrstrc;
	private String biUrl;
}
