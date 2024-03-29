package kr.co.warebridge.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;

@Controller
@RequestMapping("/user/mypage")
public class FaceLoginController {

	@GetMapping("faceLogin")
	protected String faceLoginUI(
		@RealUser EmployeeVO realUser,
		Model model
	) {
		model.addAttribute("realUser",realUser);
		return "user/employee/faceLogin";
	}
}
