package kr.co.warebridge.address.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.PrsnladbkVO;

@Mapper
public interface AdbkDAO {

	public int update(PrsnladbkVO adbk);
	
	/**
	 * 접속한 사람의 사번을 받아서 해당 인원의 주소록 불러옴
	 * @param pabEmpNo
	 * @return
	 */
	public List<PrsnladbkVO> selectList(PaginationInfo paging);
	
	public PrsnladbkVO selectOne(String pabNo);
	
	public int delete(String pabNo);
	
	public int insert(PrsnladbkVO adbk);
}
