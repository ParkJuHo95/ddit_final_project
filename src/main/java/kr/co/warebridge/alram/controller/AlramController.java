package kr.co.warebridge.alram.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.warebridge.alram.service.AlramService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.AlramVO;
import kr.co.warebridge.vo.EmployeeVO;

@Controller
@RequestMapping("/user/alram")
public class AlramController {
	
	@Inject
	private AlramService service;
	
	@GetMapping
	public String alramList(
		@RealUser EmployeeVO realUser,
		Model model
	) {
		List<AlramVO> alramList = service.retrieveAlrams(realUser.getEmpNo());
		model.addAttribute("alramList", alramList);
		return "jsonView";
	}
	
	@PostMapping("/update")
	public String updateAlram(
		@RequestParam String alramNo,
		@RealUser EmployeeVO realUser
	) {
		service.modifyAlram(new AlramVO(realUser.getEmpNo(),alramNo));
		return "jsonView";
	}
}
