package kr.co.warebridge.eworks.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.SnctdocumentVO;
import kr.co.warebridge.vo.SnctformVO;

@Mapper
public interface SnctdocumentDAO {
	
	public SnctformVO selectNewForm(String sdcSfId);
	public SnctdocumentVO selectOne(String sdcSfId);
	public int insert(SnctdocumentVO sdc);
	public int update(SnctdocumentVO sdc);
	public int delete(String sdcSfId);
	public int selectTotalRecord(PaginationInfo paging);
	public List<SnctdocumentVO> selectMyList(PaginationInfo paging);
	public List<SnctdocumentVO> selectWaitingList(PaginationInfo paging);
	public int selectWaitingListTotalRecord(PaginationInfo paging);
	public int complete(SnctdocumentVO sdc);
	public int reject(SnctdocumentVO sdc);
	public SnctdocumentVO selectAfter(String sdcId);
	
}
