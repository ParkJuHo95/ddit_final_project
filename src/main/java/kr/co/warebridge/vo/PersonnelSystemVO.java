package kr.co.warebridge.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "prsCode")
public class PersonnelSystemVO implements Serializable{
	private String prsCode;
	private String prsCmpId;
	private String prsClscd;
	private String prsName;
	private String prsEmpRegisterid;
	private String prsRegistdat;
	private String prsEmpChangerid;
	private String prsChangedat;
	private String prsUseyn;
}
