package kr.co.warebridge.employee.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LogoutController {

	@PostMapping("/login/logOut")
	protected String logOut(HttpServletRequest req){
		req.getSession().invalidate();
		return "redirect:/";
	}
}
