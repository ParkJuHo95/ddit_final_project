package kr.co.warebridge.inquiry.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.InquiryVO;

@Mapper
public interface InquiryDAO {
	
	public InquiryVO selectOne(String id);
	
	public List<InquiryVO> selectList(PaginationInfo paging);
	
	public int selectTotalRecord(PaginationInfo paging);
	
	public int insertInquiry(InquiryVO quiry);

	public int updateInquiry(InquiryVO quiry);
	
	public int deleteInquiry(String id);
	
	public List<InquiryVO> selectHomeList(String cmpId);
	
}
