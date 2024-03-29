package kr.co.warebridge.menu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.DietVO;

@Mapper
public interface DietDAO {
	
	public List<DietVO>  selectDietTable(@Param("empNo") String empNo, @Param("cmpId") String cmpId);
	public int insertDiet(DietVO diet);
}
