package kr.co.warebridge.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= "dptId")
public class DepartmentVO implements Serializable{
	private String dptId;
	private String dptParentdptid;
	private Integer dptOrder;
	private String dptLocalext;
	private String dptName;
	private String dptTftyn;
	private String dptHead;
	private String dptCmpId;
	private String dptOffice;
	
//	private DepartmentVO parentDpt;
	private List<DepartmentVO> childDptList;
	private EmployeeVO emp;
}
