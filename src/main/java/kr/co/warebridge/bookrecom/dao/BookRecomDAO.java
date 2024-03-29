package kr.co.warebridge.bookrecom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.EmployeeVO;

@Mapper
public interface BookRecomDAO {
	
	public List<Map<String, String>> selectBookRecom(EmployeeVO user);
	
	public int selectBookrecomList(Map<String, String> value);

	
	
	
}
