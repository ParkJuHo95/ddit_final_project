package kr.co.warebridge.address.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.warebridge.address.dao.AdbkDAO;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.PrsnladbkVO;
import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class AdbkServiceImpl implements AdbkService {

	private final AdbkDAO dao;
	
	@Override
	public List<PrsnladbkVO> retriveAdbkList(PaginationInfo paging) {
		return dao.selectList(paging);
	}

	@Override
	public PrsnladbkVO retrieveAdbk(String pabNo) {
		return dao.selectOne(pabNo);
	}

	@Override
	public ServiceResult createAdbk(PrsnladbkVO adbk) {
		return dao.insert(adbk) > 0? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyAdbk(PrsnladbkVO adbk) {
		return dao.update(adbk) > 0? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeAdbk(String pabNo) {
		return dao.delete(pabNo) > 0? ServiceResult.OK : ServiceResult.FAIL;
	}

}
