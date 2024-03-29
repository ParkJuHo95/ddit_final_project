package kr.co.warebridge.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserSampleController {
	
//	@GetMapping("address")
	public String sample2() {
		return "user/address";
	}
	
	@GetMapping("community")
	public String sample4() {
		return "user/community";
	}
	

	
//	@GetMapping("mypage")
//	public String sample7() {
//		return "user/employee/mypage";
//	}
	

	@GetMapping("reserve")
	public String sample9() {
		return "user/reserve";
	}
	
//	@GetMapping("orgchart")
//	public String sample11() {
//		return "user/orgchart";
//	}
	@GetMapping("repository/upload")
	public String sample12() {
		return "user/repository/repositoryUpload";
	}
}
