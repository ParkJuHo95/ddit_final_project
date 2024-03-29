package kr.co.warebridge.menu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.menu.dao.MenuDAO;
import kr.co.warebridge.vo.MenuVO;

@Service
public class MenuServiceImpl implements MenuService {

	@Inject
	MenuDAO mapper;
	
	@Override
	public List<MenuVO> retrieveMenuList() {
		
		return mapper.selectMenuList();
	}

}
