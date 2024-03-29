package kr.co.warebridge.bookrecom.service;

import java.util.List;
import java.util.Map;

import kr.co.warebridge.vo.EmployeeVO;

public interface BookRecomService {
	
	/**
	 * 책추천 추천테이블 조회
	 * @param user
	 * @return
	 */
	public List<Map<String, String>> retrieveBookrecomList(EmployeeVO user);
	/**
	 * 등록되어있는 전체 Bookdata를 List로 받아옴
	 * @return
	 */
	public int createBook(Map<String, String> value);
	
}
