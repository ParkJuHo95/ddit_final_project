package kr.co.warebridge.rental.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.warebridge.rental.service.EquipService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.BookVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.EquipVO;

@Controller
@RequestMapping("/user")
public class EquipController {
	
	@Inject
	EquipService service;

	@GetMapping("book/equipCalendar")
	public String index() {
		return "user/book/equipCalendar";
	}
	
	@GetMapping("book/equipCalendar/{equipCode}")
	public String index(
			@RealUser EmployeeVO emp,
			@PathVariable String equipCode,
			Model model,
			@ModelAttribute("book") BookVO book) {
		String name = emp.getEmpName();
		EquipVO equip = service.selectEquip(equipCode);
		model.addAttribute("equip",equip);
		model.addAttribute("name",name);
		
		return "user/book/equipCalendar";
	}

}
