package kr.co.warebridge.recomMenu;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.warebridge.AbstractRootContextTest;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.menu.dao.DietDAO;
import kr.co.warebridge.vo.DietVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class DietDAOTest extends AbstractRootContextTest{

	@Inject
	DietDAO mapper;
	
//	@Inject
//	DietVO diet;
	
	@Test
	void testSelectDietTable() {
		List<DietVO> diet = mapper.selectDietTable("2019-00003", "dreaminfosystem");
		assertNotNull(diet);
		log.info("diet : {}", diet);
	}

	@Test
	void testInsertDiet() {
		DietVO diet = new DietVO();
		diet.setYmd("20240212");
		diet.setEmpNo("2019-00003");
		diet.setCmpId("dreaminfosystem");
		diet.setMId(0);
		int result = mapper.insertDiet(diet);
		log.info("result : {}", result);
	}
}
