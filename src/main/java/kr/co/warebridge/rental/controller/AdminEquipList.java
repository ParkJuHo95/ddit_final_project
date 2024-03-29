package kr.co.warebridge.rental.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.warebridge.rental.service.EquipService;
import kr.co.warebridge.vo.CarVO;
import kr.co.warebridge.vo.EquipVO;
import kr.co.warebridge.vo.RoomVO;

@Controller
@RequestMapping("/admin/book")
public class AdminEquipList {
	
	@Inject
	private EquipService service;

	
	@GetMapping("equip")
	public String list(@ModelAttribute("equip") EquipVO equip,Model model) {
		
		List<EquipVO> equipList = service.retrieveEquipList();

		model.addAttribute("equipList", equipList);
		
		return "admin/menuManagement/book/equip";
	}
	
	@PostMapping("deleteEquip")
	public String delete(@RequestParam String equipCode, Model model) {
		
		service.removeEquip(equipCode);
		
		return "admin/menuManagement/book/bookList";
		
	}
	
	@PostMapping("equip")
	public String create(@ModelAttribute("equip") EquipVO equip) {
		
		int cnt = service.insertEquip(equip);
		
		return "jsonView";

	}
}
