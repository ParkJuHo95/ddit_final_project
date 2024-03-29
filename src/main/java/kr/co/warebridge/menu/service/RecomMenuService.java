package kr.co.warebridge.menu.service;

import org.apache.ibatis.annotations.Param;

import kr.co.warebridge.vo.RecomMenuVO;

public interface RecomMenuService {

	/**
	 * 점심메뉴 추천테이블 조회
	 * @param empNo
	 * @param empCmpId
	 * @return
	 */
	public RecomMenuVO retrieveRecomMenu(@Param("empNo") String empNo, @Param("empCmpId") String empCmpId);
}
