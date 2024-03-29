package kr.co.warebridge.menu.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.warebridge.vo.RecomMenuVO;

@Mapper
public interface RecomMenuDAO {

	public RecomMenuVO selectRecomMenu(@Param("empNo") String empNo, @Param("empCmpId") String empCmpId);
}
