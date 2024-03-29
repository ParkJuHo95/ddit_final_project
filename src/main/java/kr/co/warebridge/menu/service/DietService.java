package kr.co.warebridge.menu.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.DietVO;

public interface DietService {

	public List<DietVO> retrieveDietTable(@Param("empNo") String empNo, @Param("cmpId") String cmpId);
	public ServiceResult createDiet(DietVO diet);
}
