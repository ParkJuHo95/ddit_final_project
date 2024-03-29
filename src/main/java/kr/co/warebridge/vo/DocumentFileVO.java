package kr.co.warebridge.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="dfiId")
public class DocumentFileVO implements Serializable{
	private Integer dfiId;
	private Integer dfiDfoId;
	private String dfiName;
	private String dfiPath;
	private String dfiExtention;
	private Integer dfiSize;
	private String dfiDat;
	private Integer dfiCount;
	private String dfiUploader;
	private String dfiCmpId;
}
