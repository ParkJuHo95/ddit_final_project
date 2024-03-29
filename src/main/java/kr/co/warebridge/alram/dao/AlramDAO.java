package kr.co.warebridge.alram.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.AlramVO;

@Mapper
public interface AlramDAO {
	public List<AlramVO> selectAlrams(String empNo);
	public int insertAlram(AlramVO vo);
	public int updateAlram(AlramVO vo);
}
