package kr.co.warebridge.inquiry.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.VisitVO;

@Mapper
public interface VisitDAO {

	public VisitVO selectOne(String id);
	
	public List<VisitVO> selectList(PaginationInfo paging);
	
	public int selectTotalRecord(PaginationInfo paging);
	
	public int insertVisit(VisitVO visit);

	public int updateVisit(VisitVO visit);
	
	public int deleteVisit(String id);
	
}
