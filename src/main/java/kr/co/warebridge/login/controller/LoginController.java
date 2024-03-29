package kr.co.warebridge.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping
public class LoginController {
	
	@GetMapping("/login")
	public String login() {
		return "login/login";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest sr) {
		sr.getSession().removeAttribute("realUser");
		return "/";
	}
	
}
