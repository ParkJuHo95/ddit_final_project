package kr.co.warebridge.vo;

import java.time.LocalDate;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "subsCmp")
public class SubscriptionVO {

	
	String subsNo;
	String subsPpl;
	LocalDate subsStr;
	LocalDate subsEnd;
	String prodNo;
	String subsCmp;
}
