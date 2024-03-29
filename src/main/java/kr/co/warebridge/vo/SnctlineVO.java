package kr.co.warebridge.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="slId")
public class SnctlineVO implements Serializable{
	private String slId;
	//insert시 slId가 입력되면 snctdetails의 sdtSlId도 같이 입력되도록..
	public void setSlId(String slId) {
		this.slId = slId;
		if(this.snctdetails != null) {
			for(SnctdetailVO detail : this.snctdetails) {
				detail.setSdtSlId(slId);
			}
		}
	}
	
	public String getSlId() {
		if(this.slId == null) {
			this.slId="";
		}
		return slId;
	}

	
	private String slCmpId;
	private String slEmpNo;
	private String slUseyn;
	
	List<SnctdetailVO> snctdetails;
	
	public List<SnctdetailVO> getSnctdetails() {
		if(this.snctdetails == null) {
			this.snctdetails = new ArrayList<>();
		}
		return snctdetails;
	}
	
	private List<SnctstatusVO> snctstatuses;
	public void setSnctstatuses(List<SnctstatusVO> snctstatuses) {
		this.snctstatuses = snctstatuses;
	}
	public void setSnctstatuses(String ssSdcId) { //문서Id를 넣어줘야한다니
		this.snctstatuses = new ArrayList<>(); //새 List로
		for(SnctdetailVO detail : this.snctdetails) { //detail의 정보 하나하나 입력
			SnctstatusVO status = new SnctstatusVO();
			status.setSsSdcId(ssSdcId);
			status.setSsSlId(this.slId);
			status.setSsSdtOrder(detail.getSdtOrder());
			status.setSsEmpNo(detail.getSdtEmpNo());
			this.snctstatuses.add(status);
		}
	}
}

