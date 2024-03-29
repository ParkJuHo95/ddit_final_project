package kr.co.warebridge.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminSampleController {
	
//	@GetMapping("company")
//	public String company() {
//		return "admin/company/company";
//	}

	@GetMapping("menuManagement")
	public String menuManagement() {
		return "admin/menuManagement/menuManagement";
	}

//	@GetMapping("security")
//	public String security() {
//		return "admin/security/security";
//	}
	@GetMapping("subscribe")
	public String subscribe() {
		return "admin/subscribe/subscribe";
	}
}
