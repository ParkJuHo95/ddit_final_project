package kr.co.warebridge.recomMenu;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.co.warebridge.AbstractRootContextTest;
import kr.co.warebridge.menu.dao.MenuDAO;
import kr.co.warebridge.vo.MenuVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class MenuDAOTest extends AbstractRootContextTest {

	@Inject
	MenuDAO mapper;
	
	@Test
	void test() {
		List<MenuVO> menuList = mapper.selectMenuList();
		log.info("메뉴리스트 : {}", menuList);
	}

}
