package kr.co.warebridge.alram.service;

import java.util.List;

import kr.co.warebridge.vo.AlramVO;

public interface AlramService {
	public List<AlramVO> retrieveAlrams(String empNo);
	public int createAlram(AlramVO vo);
	public int modifyAlram(AlramVO vo);
}
