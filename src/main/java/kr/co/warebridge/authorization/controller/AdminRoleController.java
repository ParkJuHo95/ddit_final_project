package kr.co.warebridge.authorization.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.authorization.service.AdminRoleService;
import kr.co.warebridge.common.paging.BootstrapFormBasePaginationRenderer;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.common.paging.PaginationRenderer;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.AdminVO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/security")
public class AdminRoleController {
	
	@Inject
	AdminRoleService service;
	
	@GetMapping
	protected String roleUI(
			@RealUser EmployeeVO realUser,
			@RequestParam Map<String, Object> detailCondition,
			Model model,
			@ModelAttribute("paging") PaginationInfo paging,
			@RequestParam(name = "page",required = false, defaultValue = "1") int currentPage
	) {
		paging.setCurrentPage(currentPage);
		
		//detailContidion 생성하고 empCmpId 넣음
		detailCondition.put("empCmpId", realUser.getEmpCmpId());
		paging.setDetailCondition(detailCondition);
		
		List<AdminVO> adminList = service.retrieveAdminList(paging);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#searchForm");
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("adminList", adminList);
		model.addAttribute("condition", detailCondition);
		
		return "admin/security/security";
	}
	
	@PostMapping
	@ResponseBody
	public int insertRole(
			@RequestBody AdminVO admin,
			@RealUser EmployeeVO realUser
	) {
		log.info("받은데이텅 {}", admin);
		admin.setAdmFrom(realUser.getEmpNo());
		admin.setEmpCmpId(realUser.getEmpCmpId());
		
		return service.createAdmin(admin);
	}
//	@PostMapping
//	protected String deleteRole() {
//		return "admin/security/security";
//	}
	
}
