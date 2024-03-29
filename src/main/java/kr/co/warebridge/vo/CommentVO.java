package kr.co.warebridge.vo;

import java.time.LocalDate;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "cmtId")
public class CommentVO {
	private String cmtEmpNo;
	private Integer cmtId;
	private Integer cmtCbNo;
	private Integer cmtTbNo;
	private String cmtContent;
	private LocalDate cmtDat;
	
	private String empName;
}
