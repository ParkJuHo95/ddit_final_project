package kr.co.warebridge.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= {"sfId", "sfSfcId"})
public class SnctformVO implements Serializable {
	private String sfId;
	private String sfSfcId;
	private String sfName;
	private String sfForm;
	private String sfUsearbityn;
	private String sfPublicyn;
	private String sfWrtrslctyn;
	private String sfUsepresnctyn;
	private String sfEmpReceiverid;
	private String sfRegistdat;
	private String sfEmpRegisterid;
	private String sfChangedat;
	private String sfEmpChangerid;
	private String sfUseyn;
	private String sfCmpId;
}
