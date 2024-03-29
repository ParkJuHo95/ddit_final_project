package kr.co.warebridge.employee.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.employee.service.EmployeeService;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.validate.UpdateGroup;
import kr.co.warebridge.vo.EmployeeVO;

@Controller
@RequestMapping("/user/mypage/myInfo")
public class MyInfoController {

	@Inject
	private EmployeeService service;
	
//	@Value("#{appInfo.empPicpath}")
//	private String empFolder;
	
	@GetMapping
	protected String mypageUI(@RealUser EmployeeVO realUser,  Model model) throws Exception {
		EmployeeVO employee = service.retrieveEmployee(realUser.getEmpNo());
		model.addAttribute("employee",employee);
		
		return "user/employee/mypage";
	}
	
//	@RequestMapping(value = "/imageView.do", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
//	public @ResponseBody byte[] imageView(
//
//			@RequestParam(name = "empNo", required = false) String empNo
//
//	) throws IOException {
//
//		EmployeeVO employee = service.retrieveEmployee(empNo);
//		
//		String filePath = empFolder + employee.getEmpPicpath() ;
//		return FileUtils.readFileToByteArray(new File(filePath));
//
//	}

	
	@PostMapping
	@ResponseBody
	public String editMypage(
			@Validated(UpdateGroup.class) @RealUser @ModelAttribute("employee") EmployeeVO realUser //검증이 된 사용자객체
			, BindingResult errors
			, Model model
			, HttpSession session
	) throws Exception {
		String PF = null;
		if(! errors.hasErrors()) {
				ServiceResult result = service.modifyEmployee(realUser);
				switch (result) {
				case OK:
					PF = "success";
					break;
					
				default:
					PF = "fail";
					break;
				}
		}
		return PF;
	}
}
