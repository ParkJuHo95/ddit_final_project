package kr.co.warebridge.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.Map;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "admNo")
public class AdminVO implements Serializable{
	private int rnum;
	private String admNo;
	private String admTo;
	private String admToName;
	private String admFrom;
	private String admFromName;
	private String empCmpId;
	private String dptName;
	private String empDptId1;
	private String empDptId2;
	private String empStatus;
	private String empRole;
	private String empMobile;
	private String empCmptelno;
	private String empJobduty;
	private String empJobposition;
	private LocalDate admDat;
}
