package kr.co.warebridge.vo;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"pcYmd", "pcEmpNo", "pcCmpId"})
public class PersonnelChangesVO implements Serializable{
	private LocalDate pcYmd;
	private String pcEmpNo;
	private String pcCmpId;
	private LocalDate pcStartdate;
	private LocalDate pcEnddate;
	private String pcPrsCode;
	private Integer pcClsfcode;
	private String pcDptId;
}
