package kr.co.warebridge.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="sdcId")
public class SnctdocumentVO implements Serializable{
	private String sdcId;
	private String sdcSfId;
	private String sdcSfcId;
	private String sdcTitle;
	private String sdcEmpNo;
	public void setSdcEmpNo(String sdcEmpNo) {
		this.sdcEmpNo = sdcEmpNo;
		if (this.snctline != null) {
			this.snctline.setSlEmpNo(sdcEmpNo);
	    }
	}
	
	private String sdcContent;
	private String sdcAttchpath;
	
	private String sdcEmrgcyyn;
	public void setSdcEmrgcyyn(String sdcEmrgcyyn) {
		if ("Y".equals(sdcEmrgcyyn)) {
	        this.sdcEmrgcyyn = "Y";
	    } else {
	        this.sdcEmrgcyyn = "N";
	    }
    }

	private String sdcReportdat;
	private String sdcTempyn;
	private String sdcResult;
	private String sdcDocno;
	private String sdcSlId;
	public void setSdcSlId(String sdcSlId) { //String으로 들어올때는 넣어줌
		this.sdcSlId = sdcSlId;
	}
	public void setSdcSlId() {//parameter 없을때는 snctline에서 가져옴
	   this.sdcSlId = this.snctline.getSlId();
	}
	
	private String sdcCmpId;
	public void setSdcCmpId(String sdcCmpId) {
		this.sdcCmpId = sdcCmpId;
		if (this.snctline != null) {
			this.snctline.setSlCmpId(sdcCmpId);
		}
	}
	
	private SnctformVO snctform;
	
	//문서 작성자 정보를 가지고 있는 empVO
	private EmployeeVO docWriter;
	
	//상신or임시저장된 문서의 결재선 정보를 가지고 있는 VO
	private SnctlineVO snctline;
	public SnctlineVO getSnctline() {
		if(this.snctline == null) {
			this.snctline = new SnctlineVO();
		}
		return snctline;
	}

	//새 문서 작성 또는 임시저장 문서를 계속 작성할 때 접속한 사람이 기존에 사용했던 결재선 정보를 가지고 있는 List
	private List<SnctlineVO> usedSnctlines;
	public List<SnctlineVO> getUsedSnctlines() {
		if(this.usedSnctlines == null) {
			this.usedSnctlines = new ArrayList<>();
		}
		return usedSnctlines;
	}
}
