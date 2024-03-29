package kr.co.warebridge.others.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.warebridge.admin.organization.service.DepartmentSystemService;
import kr.co.warebridge.admin.organization.service.PersonnelSystemService;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.DepartmentVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.PersonnelSystemVO;

@ControllerAdvice(basePackages = {"kr.co.warebridge.employee", "kr.co.warebridge.admin.employee", "kr.co.warebridge.admin.organization"})
public class AdviceContoller {

	@Inject
	DepartmentSystemService dept;
	
	@Inject
	PersonnelSystemService pers;
	
	@ModelAttribute("dptList")
	public List<DepartmentVO> addDeptList(@RealUser EmployeeVO realUser){
		PaginationInfo paging = new PaginationInfo();
		Map<String, Object> detailCondition = new HashedMap<String, Object>();
		detailCondition.put("dptCmpId", realUser.getEmpCmpId());
		paging.setDetailCondition(detailCondition);
		return dept.retrieveDepartmentList(paging);
	}
	
	@ModelAttribute("jobpositionList")
	public List<PersonnelSystemVO> addPersList(@RealUser EmployeeVO realUser){
		return pers.retriveJobpositionList(realUser.getEmpCmpId());
	}
}
