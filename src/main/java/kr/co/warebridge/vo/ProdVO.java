package kr.co.warebridge.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "prodNo")
public class ProdVO {
	String prodNo;
	String prodName;
	int prodMin;
	int prodMax;
	int prodPrice;
}
