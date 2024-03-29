package kr.co.warebridge.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class NewsVO implements Serializable{
	@NotBlank@Size(max=100) 
	private String newsId;
	@NotBlank@Size(max=3000) 
	private String newsTitle;
	@NotBlank@Size(max=1000) 
	private String newsCom;
	@NotBlank@Size(max=50) 
	private String newsField;
	@NotBlank@Size(max=500) 
	private String newsLink;
}
