package kr.co.warebridge.rental.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonView;

import kr.co.warebridge.rental.service.RoomService;
import kr.co.warebridge.vo.RoomVO;

@Controller
@RequestMapping("/admin/book")
public class AdminRoomChange {
	@Inject
	private RoomService service;

	@GetMapping("room/change/{roomCode}")
	public String list(@PathVariable("roomCode") String roomCode, Model model) {
		RoomVO room = service.selectRoom(roomCode);
		model.addAttribute("roomCode", room.getRoomCode());
		model.addAttribute("roomName", room.getRoomName());
		model.addAttribute("roomSite", room.getRoomSite());
		model.addAttribute("roomDetail", room.getRoomDetail());
		model.addAttribute("roomAble", room.getRoomAble());

		return "admin/menuManagement/book/roomChange";
	}

	@PostMapping("room/change/{roomCode}")
	@ResponseBody
	public void change(@PathVariable String roomCode,RoomVO room, Model model) {
		service.changeRoom(room);
	}
}
