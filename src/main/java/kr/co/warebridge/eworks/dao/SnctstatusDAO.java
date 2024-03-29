package kr.co.warebridge.eworks.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.SnctstatusVO;

@Mapper
public interface SnctstatusDAO {
	public int insert(SnctstatusVO status);
	
	/**
	 * 전자결재 승인/반려 처리를 위한 결재상태 확인
	 * @param status ssSdcId, ssEmpNo를 가지고 있는 statusVO
	 * @return ssSlId, ssSdtOrder, ssStatus를 불러온 statusVO
	 */
	public SnctstatusVO selectForAtrz(SnctstatusVO status);
	
	public SnctstatusVO selectNextAtrz(SnctstatusVO status);
	
	public int approve(SnctstatusVO status);
	
	public int setNextAtrz(SnctstatusVO next);
	
	public int setNextAtrzForArbit(SnctstatusVO statusBefore);
	public int setNextAtrzN(SnctstatusVO statusBefore);
	
	public int setBeforeAtrzY(SnctstatusVO status);
	public int setBeforeAtrzN(SnctstatusVO status);
	
}