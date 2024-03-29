package kr.co.warebridge.address.service;

import java.util.List;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.PrsnladbkVO;

public interface AdbkService {

	public List<PrsnladbkVO> retriveAdbkList(PaginationInfo paging);
	public PrsnladbkVO retrieveAdbk(String pabNo);
	public ServiceResult createAdbk(PrsnladbkVO adbk);
	public ServiceResult modifyAdbk(PrsnladbkVO adbk);
	public ServiceResult removeAdbk(String pabNo);
}
