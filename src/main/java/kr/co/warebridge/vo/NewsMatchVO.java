package kr.co.warebridge.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class NewsMatchVO implements Serializable{
	@NotBlank
	@Size(max=50) 
	private String empNo;
	@NotBlank
	@Size(max=100)
	private String newsId;
}
