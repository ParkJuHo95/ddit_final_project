package kr.co.warebridge.board.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.board.service.BoardService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.CompanyBoardVO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/board/company/insert")
public class CompanyBoardInsertController {
	
	@Inject
	private BoardService service;
	
	@ModelAttribute
	public CompanyBoardVO newBoard() {
		return new CompanyBoardVO();
	}
	
	@GetMapping
	public String form(Model model) {
		model.addAttribute("cmdObj", new CompanyBoardVO());
		return "user/board/boardwrite";
	}
	

	@PostMapping
//	@ResponseBody
	public String insert(
		@ModelAttribute("cmdObj") CompanyBoardVO cmdObj,
		Principal principal,
		@RealUser EmployeeVO authMember,
		Model model
	) {
//		String username = principal.getName(); // memId;
		cmdObj.setCbEmpNo(authMember.getEmpNo());
		cmdObj.setCbCmpId(authMember.getEmpCmpId());
		service.createBoard(cmdObj);
		log.info("-------------------------------------cnt:"+cmdObj);
		model.addAttribute("newBoard", cmdObj);
		return "jsonView";
	}

}
