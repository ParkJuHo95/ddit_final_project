package kr.co.warebridge.vo;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoorRecomVO implements Serializable{
	private String brEmpInterest;
	private String brRank;
	private Integer brBdId;
	private String brDptId;
}
