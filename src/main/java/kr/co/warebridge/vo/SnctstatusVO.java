package kr.co.warebridge.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of={"ssSdcId", "ssSdtOrder"})
public class SnctstatusVO {
	private String ssSdcId; //문서Id
	private String ssSlId;  //결재선Id
	private Integer ssSdtOrder; //결재선 세부 > 결재순서
	private String ssEmpNo; //해당 결재 순서의 결재권자
	private String ssType; //결재종류 0
	private String ssSnctdat; //결재일시
	private Integer ssStatus; //결재결과 > 0 대기중 1 승인 2 반려
	private String ssRemark; //결재의견
	
}
