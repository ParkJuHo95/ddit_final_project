package kr.co.warebridge.admin.organization.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.admin.organization.service.DepartmentSystemService;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.DepartmentVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.PersonnelSystemVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/organization")
public class AdminDeptController {
	
	@Inject
	private DepartmentSystemService service;
	
	@RequestMapping
	public String organization(@ModelAttribute("dpt") DepartmentVO dpt
			, @RealUser EmployeeVO realUser
			, Model model
			) {
		Map<String, Object> detailCondition = new HashedMap<String, Object>();
		detailCondition.put("dptCmpId", realUser.getEmpCmpId());
		PaginationInfo paging = new PaginationInfo();
		paging.setDetailCondition(detailCondition);
		List<DepartmentVO> deptSystemList = service.retrieveDepartmentTree(paging);
		model.addAttribute("deptSystemList", deptSystemList);
		
		
		return "admin/organization/departmentSystem";
	}
	
	@GetMapping(value = "departmentList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<DepartmentVO> retrieveList(@RealUser EmployeeVO realUser
			, Model model
			) {
		Map<String, Object> detailCondition = new HashedMap<String, Object>();
		detailCondition.put("dptCmpId", realUser.getEmpCmpId());
		PaginationInfo paging = new PaginationInfo();
		paging.setDetailCondition(detailCondition);
		return service.retrieveDepartmentList(paging);
	}

	@GetMapping(value = "department/{dptId}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public DepartmentVO retrieve(DepartmentVO dpt
			,@RealUser EmployeeVO realUser){
		dpt.setDptCmpId(realUser.getEmpCmpId());
		return service.retrieveDepartment(dpt);
	}
	
	@PostMapping(value = "department/modify", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> modify(
			@ModelAttribute("dpt") DepartmentVO dpt
			,@RealUser EmployeeVO realUser){
		dpt.setDptCmpId(realUser.getEmpCmpId());
		
		ServiceResult result = service.modifyDepartment(dpt);
		if (result == ServiceResult.OK) {
	        return ResponseEntity.ok("부서정보 수정 성공");
	    } else {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("부서정보 수정 실패");
	    }
	}
	
	@PostMapping(value = "department/create", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> create(
			@ModelAttribute("dpt") DepartmentVO dpt
			, @RealUser EmployeeVO realUser){
		log.info("dpt =========== {}", dpt);
		dpt.setDptCmpId(realUser.getEmpCmpId());
		ServiceResult result = service.createDepartment(dpt);
		if (result == ServiceResult.OK) {
			return ResponseEntity.ok("부서 등록 성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("부서 등록 실패");
		}
	}
	
	
	@PostMapping(value = "department/remove", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> remove(
			@ModelAttribute("dpt") DepartmentVO dpt
			, @RealUser EmployeeVO realUser){
		
		dpt.setDptCmpId(realUser.getEmpCmpId());
		ServiceResult result = service.removeDepartment(dpt);
		
		if (result == ServiceResult.OK) {
			return ResponseEntity.ok("부서 삭제 성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("부서 삭제 실패");
		}
	}
}
