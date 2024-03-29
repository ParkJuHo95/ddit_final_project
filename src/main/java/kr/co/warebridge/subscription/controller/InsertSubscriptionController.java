package kr.co.warebridge.subscription.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/admin/subscribe")
public class InsertSubscriptionController {

	@GetMapping("insertSubs")
	protected String menuUI() {
		return "admin/subscribe/insertSubs";
	}
}
