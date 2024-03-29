package kr.co.warebridge.company.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.warebridge.authorization.service.AdminRoleService;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.company.service.CompanyService;
import kr.co.warebridge.employee.dao.EmployeeDAO;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.inquiry.dao.VisitDAO;
import kr.co.warebridge.inquiry.service.InquiryService;
import kr.co.warebridge.inquiry.service.VisitService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.validate.UpdateGroup;
import kr.co.warebridge.vo.AdminVO;
import kr.co.warebridge.vo.CompanyVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.InquiryVO;

@Controller
@RequestMapping("admin")
public class CompanyController {
	@Inject
	private AdminRoleService adminService;
	@Inject
	private CompanyService service;
	@Inject
	private EmployeeDAO empDao;
	@Inject
	private InquiryService iService;
	
	@GetMapping("company")
	public String companyViewUI(@RealUser EmployeeVO realUser,  Model model) {
		CompanyVO company = service.retrieveCompany(realUser.getEmpCmpId());
		
		PaginationInfo paging = new PaginationInfo();
		Map<String, Object> detailCondition = new HashMap<>();
		//detailContidion 생성하고 empCmpId 넣음
		detailCondition.put("empCmpId", realUser.getEmpCmpId());
		paging.setDetailCondition(detailCondition);
		
		int cnt = empDao.selectTotalRecord(paging);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("company", company);
		
		return "admin/company/company";
	}
	
	
	@PostMapping("company")
	public String editCompanyInfo(
			@Validated(UpdateGroup.class) @RealUser EmployeeVO realUser //검증이 된 사용자객체
			, Model model
			, @RequestBody @ModelAttribute("company") CompanyVO company
			, BindingResult errors
	){
		String logicalViewName = null;
		if(! errors.hasErrors()) {
			ServiceResult result = service.modifyCompany(company);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/admin/company";
				break;
				
			default:
				logicalViewName = "";
				break;
			}
		}
		return logicalViewName;
	}
	
	@GetMapping("home")
	public String adminHomeUI(
			@RealUser EmployeeVO realUser,
			Model model,
			@ModelAttribute("paging") PaginationInfo paging
			) {
		CompanyVO company = service.retrieveCompany(realUser.getEmpCmpId());
		List<AdminVO> adminList = adminService.retrieveAdminList(paging);
		List<InquiryVO> inquiryList = iService.retrieveHomeList(realUser.getEmpCmpId());
		model.addAttribute("adminList", adminList);
		model.addAttribute("company", company);
		model.addAttribute("inquiryList", inquiryList);
		
		return "admin/nonesubside";
	}
}
