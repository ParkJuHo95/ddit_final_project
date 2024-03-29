package kr.co.warebridge.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"sdtSlId", "sdtOrder"})
public class SnctdetailVO implements Serializable{
	private String sdtSlId;
	private Integer sdtOrder;
	private String sdtEmpNo;
	
	private EmployeeVO authorizer;
	private SnctstatusVO atrzstatus;
}
