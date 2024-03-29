package kr.co.warebridge.authorization.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/security")
public class AdminChangePwController {

	@GetMapping("changePw")
	protected String formUI() {
		return "admin/security/adminChangePw";
	}
}
