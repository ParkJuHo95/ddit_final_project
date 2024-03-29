package kr.co.warebridge.menu.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.menu.dao.DietDAO;
import kr.co.warebridge.vo.DietVO;

@Service
public class DietServiceImpl implements DietService {

	@Inject
	DietDAO mapper;
	
	@Override
	public List<DietVO> retrieveDietTable(@Param("empNo") String empNo, @Param("cmpId") String cmpId) {
		List<DietVO> dietList = mapper.selectDietTable(empNo, cmpId);
		return dietList;
	}

	@Override
	public ServiceResult createDiet(DietVO diet) {
		ServiceResult result = null;
		result = mapper.insertDiet(diet) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

}
