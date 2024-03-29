package kr.co.warebridge.authorization.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/security")
public class LogListController {

	@GetMapping("logList")
	protected String getUI() {
		return "admin/security/logList";
	}
}
