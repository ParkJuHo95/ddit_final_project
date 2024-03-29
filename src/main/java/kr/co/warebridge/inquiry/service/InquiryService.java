package kr.co.warebridge.inquiry.service;

import java.util.List;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.InquiryVO;

public interface InquiryService {
	
	public InquiryVO retrieveOne(String id);
	
	public List<InquiryVO> retrieveList(PaginationInfo paging);
	
	public int createInquiry(InquiryVO quiry);

	public int modifyInquiry(InquiryVO quiry);
	
	public int removeInquiry(String[] ids);
	
	public List<InquiryVO> retrieveHomeList(String cmpId);
}
