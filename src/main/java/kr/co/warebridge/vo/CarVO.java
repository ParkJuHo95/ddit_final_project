package kr.co.warebridge.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class CarVO {
	@NotBlank
	@Size(max=10) 
	private String carCode;
	@Size(max=50) 
	private String carName;
	@Size(max=100) 
	private String carDetail;
	@Size(max=1) 
	private String carAble;
	@NotBlank
	@Size(max=30) 
	private String empCmpId;

}

