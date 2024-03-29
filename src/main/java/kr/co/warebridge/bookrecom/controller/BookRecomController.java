package kr.co.warebridge.bookrecom.controller;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.warebridge.bookrecom.service.BookRecomService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/mypage")
public class BookRecomController {
	
	@Inject
	public BookRecomService service;
	
	@GetMapping("bookrecom")
	public String bookrecom( 
		@RealUser EmployeeVO realUser
		, Model model
	) {
		List<Map<String, String>> bookrecom = service.retrieveBookrecomList(realUser);
		model.addAttribute("bookrecom",bookrecom);
		model.addAttribute("user", realUser);
		return "user/bookrecom/bookrecom";
	}
}
