package kr.co.warebridge.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login/lostPw")
public class LostPwController {
	
	@GetMapping
	protected String lostPwForm() {
		return "login/lostPw";
	}
	
	@PostMapping
	protected String lostPwProcess() {
		return "login/lostPw";
	}

}
