package kr.co.warebridge.board.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.warebridge.board.service.TeamBoardService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.TeamBoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/board/team/insert")
public class TeamBoardInsertController {
	
	@Inject
	private TeamBoardService service;
	
	@ModelAttribute
	public TeamBoardVO newBoard() {
		return new TeamBoardVO();
	}
	
	@GetMapping
	public String form(Model model) {
		model.addAttribute("cmdObj", new TeamBoardVO());
		return "user/board/teamboardwrite";
	}
	

	@PostMapping
	public String insert(
		@ModelAttribute("cmdObj") TeamBoardVO cmdObj,
		Principal principal,
		@RealUser EmployeeVO authMember,
		Model model
	) {
//		String username = principal.getName(); // memId;
		cmdObj.setTbEmpNo(authMember.getEmpNo());
		cmdObj.setTbDptId(authMember.getEmpDptId1());
		service.createBoard(cmdObj);
		log.info("-------------------------------------cnt:"+cmdObj);
		model.addAttribute("newBoard", cmdObj);
		return "jsonView";
	}

}
