package kr.co.warebridge.vo;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Component
@Data
@EqualsAndHashCode(of = {"pabNo", "pabEmpNo", "pabCmpId"})
public class PrsnladbkVO implements Serializable {
	
	private String pabNo;
	private String pabEmpNo;
	private String pabCmpId;
	private String pabName;
	private String pabPicpath;
	private String pabMail;
	private String pabMobile;
	private String pabGroup;
	private String pabCompany;
	private String pabDptmnt;
	private String pabPosition;
	private String pabTask;
	private String pabCmptel;
	private String pabCmpaddr;
	private LocalDate pabBirthday;
	private String pabHometel;
	private String pabCmpfax;
	private String pabRemark;
}
