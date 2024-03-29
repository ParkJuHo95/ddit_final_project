package kr.co.warebridge.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "mId")
public class MenuVO implements Serializable{
	
	private Integer mId;
	private String mName;

}
