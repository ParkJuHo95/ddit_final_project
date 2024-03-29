package kr.co.warebridge.inquiry.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.inquiry.dao.InquiryDAO;
import kr.co.warebridge.vo.InquiryVO;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Inject
	private InquiryDAO dao;
	
	@Override
	public InquiryVO retrieveOne(String id) {
		return dao.selectOne(id);
	}

	@Override
	public List<InquiryVO> retrieveList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}

	@Override
	public int createInquiry(InquiryVO quiry) {
		return dao.insertInquiry(quiry);
	}

	@Override
	public int modifyInquiry(InquiryVO quiry) {
		return dao.updateInquiry(quiry);
	}

	@Override
	public int removeInquiry(String[] ids) {
		int cnt = 0;
		for(String id : ids) {
			cnt = dao.deleteInquiry(id);
			if(cnt == 0 ) {
				throw new RuntimeException();
			}
		}
		return cnt;
	}
	
	@Override
	public List<InquiryVO> retrieveHomeList(String cmpId) {
		return dao.selectHomeList(cmpId);
	}

}
