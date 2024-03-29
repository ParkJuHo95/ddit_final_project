package kr.co.warebridge.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "accCode")
public class AccessTokenVO implements Serializable{
	private String accCode;
	private String empNo;
	private String empCmpId;
	private String accDate;
	private String accFresh;

}
