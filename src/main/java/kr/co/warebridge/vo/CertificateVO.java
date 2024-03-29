package kr.co.warebridge.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CertificateVO implements Serializable{
	private String dptId;
	private String age;
	private String rank;
	private String cerName;
}
