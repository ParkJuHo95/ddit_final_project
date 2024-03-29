package kr.co.warebridge.certificate.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.certificate.service.CertificateService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/mypage")
public class CertificateController {
	
	@Inject
	private CertificateService service;
	
	@GetMapping("certificate")
	public String certificate(
		@RealUser EmployeeVO realUser,
		Model model
	) {
		List<Map<String, String>> recom = service.retrieveCer(realUser);
		model.addAttribute("recom",recom);
		return "user/certificate/certificateList";
	}
	
	@PostMapping(value = "certificate/insert")
	@ResponseBody
	public void insertCer(
		@RealUser EmployeeVO realUser,
		@ModelAttribute("value") String cerName,
		Model model
	) {
		int result = service.insertEmpCer(realUser, cerName);
		model.addAttribute("result",result);
	}
}
