package kr.co.warebridge.mail.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.NvrVO;

@Mapper
public interface NvrDAO {
	
	public NvrVO selectNvr(String nvrCode);
	
	public List<NvrVO> selectNvrList(PaginationInfo page);
	
	public int insertNvr(NvrVO nvr);
	
	public int selectTotalRecord(PaginationInfo page);
}
