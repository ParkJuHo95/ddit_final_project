package kr.co.warebridge.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "cmpId")
public class CompanyVO implements Serializable{
	private String cmpId;
	private String cmpEmpChargerid;
	private String cmpPass;
	private String cmpInitPass;
	private String cmpLogoPath;
	private String cmpFavicon;
	private String cmpWebTitle;
	private String cmpNm;
	private String cmpUrl;
	private String cmpCeo;
	private String cmpNo;
	private String cmpAddr;
	private String cmpIndustry;
	private String cmpTelno;
	private String cmpMail;
	private String cmpStatus;
	private String cmpBsnslcnspath;
	private Integer cmpCptl;
}
