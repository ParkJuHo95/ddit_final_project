package kr.co.warebridge.inquiry.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.inquiry.dao.VisitDAO;
import kr.co.warebridge.vo.InquiryVO;
import kr.co.warebridge.vo.VisitVO;

@Service
public class VisitServiceImpl implements VisitService {
	
	@Inject
	private VisitDAO dao;
	
	@Override
	public VisitVO retrieveOne(String id) {
		return dao.selectOne(id);
	}

	@Override
	public List<VisitVO> retrieveList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}

	@Override
	public int createVisit(VisitVO visit) {
		return dao.insertVisit(visit);
	}

	@Override
	public int modifyVisit(VisitVO visit) {
		return dao.updateVisit(visit);
	}

	@Override
	public int removeVisit(String[] ids) {
		int cnt = 0;
		for(String id : ids) {
			cnt = dao.deleteVisit(id);
			if(cnt == 0 ) {
				throw new RuntimeException();
			}
		}
		return cnt;
	}

}
