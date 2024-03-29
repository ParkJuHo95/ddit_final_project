package kr.co.warebridge.menu.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.menu.dao.RecomMenuDAO;
import kr.co.warebridge.vo.RecomMenuVO;

@Service
public class RecomMenuServiceImpl implements RecomMenuService {
	@Inject
	RecomMenuDAO mapper;

	@Override
	public RecomMenuVO retrieveRecomMenu(String empNo, String empCmpId) {
		RecomMenuVO recomMenu = mapper.selectRecomMenu(empNo, empCmpId);
		return recomMenu;
	}

}
