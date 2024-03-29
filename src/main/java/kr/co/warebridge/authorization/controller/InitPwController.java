package kr.co.warebridge.authorization.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.company.service.CompanyService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.CompanyVO;
import kr.co.warebridge.vo.EmployeeVO;

@Controller
@RequestMapping("/admin/security/initPw")
public class InitPwController {
	
	@Inject
	CompanyService service;

	@GetMapping
	protected String FormUI(@RealUser EmployeeVO realUser, @ModelAttribute CompanyVO company, Model model) {
		company = service.retrieveCompany(realUser.getEmpCmpId());
		model.addAttribute("company", company);
		return "admin/security/adminInitPw";
	}
	
	@PostMapping
	@ResponseBody
	public int processPw(@RealUser EmployeeVO realUser, String cmpInitPass) {
		CompanyVO cmp = new CompanyVO();
		cmp.setCmpId(realUser.getEmpCmpId());
		cmp.setCmpInitPass(cmpInitPass);
		return service.modifyInitialPw(cmp);
	}
}
