package kr.co.warebridge.eworks.service;

import java.util.List;
import java.util.Map;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.SnctdocumentVO;
import kr.co.warebridge.vo.SnctstatusVO;

public interface SnctdocumentService {

	/**
	 * @param newDoc sdcEmpNo, sdcSfId 들어있음
	 * @return snctformVO, UsedSnctlines List 담은 newDoc
	 */
	public SnctdocumentVO retrieveNewDoc(SnctdocumentVO newDoc);
	
	public SnctdocumentVO retrieveOne(String sdcId);
	
	public List<SnctdocumentVO> retrieveMyList(PaginationInfo paging);
	
	public List<SnctdocumentVO> retrieveWaitingList(PaginationInfo paging);
	
	public ServiceResult create(SnctdocumentVO sdc);
	
	public ServiceResult remove(String sdcId);
	
	public ServiceResult modify(SnctdocumentVO sdc);
	
	/**
	 * @param status : 결재자 한 사람의 결재정보를 담은 VO(O : ssSdcId, ssEmpNo, ssRemark, X: ssSdtOrder, ssType, ssSnctdat, ssStatus는 Service에서 설정, ssSlId 없어도됨)
	 * 					>> ssType : A 일반승인 B 반려 C 전결	D 선결승인 E 선결반려 F 후결
	 * 		String approve : Y는 승인, N은 반려 > 설정하여 실행
	 * 		boolean arbit : true는 전결, false는 일반결재
	 * @return boolean pre : 선결 여부를 반환 > 돌아가는 주소가 결재 예정 문서인지 결재 대기 문서인지 설정함
	 */
	public Map<String, String> approve(SnctstatusVO status, String approve, boolean arbit);
}
