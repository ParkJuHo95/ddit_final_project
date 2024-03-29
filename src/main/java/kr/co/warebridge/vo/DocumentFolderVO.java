package kr.co.warebridge.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "dfoId")
public class DocumentFolderVO implements Serializable{
	private Integer dfoId;
	private Integer dfoParentId;
	private String dfoDivision;
	private String dfoName;
	private String dfoPath;
	private String dfoDat;
	private String dfoCmpId;
}
