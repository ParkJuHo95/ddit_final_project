package kr.co.warebridge.inquiry.service;

import java.util.List;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.VisitVO;

public interface VisitService {

	public VisitVO retrieveOne(String id);
	
	public List<VisitVO> retrieveList(PaginationInfo paging);
	
	public int createVisit(VisitVO visit);

	public int modifyVisit(VisitVO visit);
	
	public int removeVisit(String[] ids);
}
