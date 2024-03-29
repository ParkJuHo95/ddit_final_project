package kr.co.warebridge.alram.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.alram.dao.AlramDAO;
import kr.co.warebridge.vo.AlramVO;

@Service
public class AlramServiceImpl implements AlramService {
	
	@Inject
	private AlramDAO dao;
	
	@Override
	public List<AlramVO> retrieveAlrams(String empNo) {
		return dao.selectAlrams(empNo);
	}

	@Override
	public int createAlram(AlramVO vo) {
		return dao.insertAlram(vo);
	}

	@Override
	public int modifyAlram(AlramVO vo) {
		return dao.updateAlram(vo);
	}

}
