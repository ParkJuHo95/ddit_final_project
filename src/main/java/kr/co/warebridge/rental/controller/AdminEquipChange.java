package kr.co.warebridge.rental.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.rental.service.EquipService;
import kr.co.warebridge.vo.EquipVO;
import kr.co.warebridge.vo.RoomVO;

@Controller
@RequestMapping("/admin/book")
public class AdminEquipChange {
	
	@Inject
	private EquipService service;
	
	@GetMapping("equip/change/{equipCode}")
	public String list(@PathVariable("equipCode") String equipCode, Model model) {
		
		EquipVO equip = service.selectEquip(equipCode);
		
		model.addAttribute("equipCode",equip.getEquipCode());
		model.addAttribute("equipName",equip.getEquipName());
		model.addAttribute("equipDetail",equip.getEquipDetail());
		model.addAttribute("equipAble",equip.getEquipAble());
		
		return "admin/menuManagement/book/equipChange";
	}
	
	@PostMapping("equip/change/{equipCode}")
	@ResponseBody
	public void change(@PathVariable String equipCode, EquipVO equip, Model model) {
		service.modifyEquip(equip);
	}
}
