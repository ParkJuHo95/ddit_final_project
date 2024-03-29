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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.rental.service.RoomService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.RoomVO;
@Controller
@RequestMapping("/admin/book")
public class AdminRoomList {

	@Inject
	private RoomService service;

	@GetMapping("room")
	public String list(@ModelAttribute("room") RoomVO room,Model model,@RealUser EmployeeVO emp) {
		String empCmpId = emp.getEmpCmpId();
		List<RoomVO> roomList = service.retrieveRoomList(empCmpId);

		model.addAttribute("roomList", roomList);

		return "admin/menuManagement/book/room";
	}

	@PostMapping("room")
	public String create(@ModelAttribute("room") RoomVO room,@RealUser EmployeeVO emp) {
		room.setEmpCmpId(emp.getEmpCmpId());
		int cnt = service.insertRoom(room);
		
		return "jsonView";

	}
	
	
	@PostMapping("deleteRoom")
	@ResponseBody
	public void delete(@RequestParam String roomCode, Model model) {
		int cnt = service.removeRoom(roomCode);
		model.addAttribute("cnt",cnt);
	}
}
