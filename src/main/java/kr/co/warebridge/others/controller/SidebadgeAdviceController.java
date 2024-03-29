package kr.co.warebridge.others.controller;

import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.eworks.dao.SnctdocumentDAO;
import kr.co.warebridge.index.IndexController;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice(basePackageClasses = IndexController.class)
public class SidebadgeAdviceController {

	@Inject
	SnctdocumentDAO sdcDao;
	
	@ModelAttribute("sdcNum")
	public int addSdcNum(@RealUser EmployeeVO realUser) {
		PaginationInfo paging = new PaginationInfo();
		Map<String, Object> detailCondition = new HashedMap<>();
		detailCondition.put("ssEmpNo", realUser.getEmpNo());
		detailCondition.put("ssStatus", "0");
		paging.setDetailCondition(detailCondition);
		log.info("=============sdcNum메소드 실행:");
		return sdcDao.selectWaitingListTotalRecord(paging);
	}
}
