package kr.co.warebridge.recomMenu;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.co.warebridge.AbstractRootContextTest;
import kr.co.warebridge.menu.dao.RecomMenuDAO;
import kr.co.warebridge.vo.RecomMenuVO;

class RecomMenuDAOTest extends AbstractRootContextTest{

	@Inject
	RecomMenuDAO RecomMenuMapper;
	
	@Test
	void test() {
		RecomMenuVO recomMenu = RecomMenuMapper.selectRecomMenu("2019-00003", "dreaminfosystem");
		assertNotNull(recomMenu);
		
	}

}
