package kr.co.warebridge.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "equipCode")
public class EquipVO implements Serializable{
	@NotBlank
	@Size(max=10)
	private String equipCode;
	@Size(max=50) 
	private String equipName;
	@Size(max=100) 
	private String equipDetail;
	@NotBlank
	@Size(max=1) 
	private String equipAble;
	@NotBlank
	@Size(max=30) 
	private String empCmpId;
}
