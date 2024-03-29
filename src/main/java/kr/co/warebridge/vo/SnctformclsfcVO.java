package kr.co.warebridge.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "sfcId")
public class SnctformclsfcVO implements Serializable{
	private String sfcId;
	private String sfcName;
	private String sfcFldrpath;
	private String sfcCmpId;
}
