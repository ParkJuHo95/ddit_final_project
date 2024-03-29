package kr.co.warebridge.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/admin/subscribe")
public class PayRestController {

	@GetMapping("pay")
	protected String menuUI() {
		return "admin/subscribe/payList";
	}
}
