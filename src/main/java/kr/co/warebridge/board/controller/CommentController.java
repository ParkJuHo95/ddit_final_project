package kr.co.warebridge.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.warebridge.board.service.CommentService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.CommentVO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/reply")
public class CommentController {
	
	@Inject
	private CommentService commentservice;
	
	

	@PostMapping("/write")
	public String insert(
			CommentVO vo, 
			@RequestParam("cmtCbNo") int cmtCbNo,
			@RealUser EmployeeVO authMember
	) {
		vo.setCmtCbNo(cmtCbNo);
		String username = authMember.getEmpNo();
		vo.setCmtEmpNo(username);
		commentservice.createComment(vo);
		return "jsonView";
	}
	@PostMapping("/write/team")
	public String insert2(
			CommentVO vo, 
			@RequestParam("cmtTbNo") int cmtTbNo,
			@RealUser EmployeeVO authMember
	) {
		vo.setCmtTbNo(cmtTbNo);
		String username = authMember.getEmpNo();
		vo.setCmtEmpNo(username);
		commentservice.createComment(vo);
		return "jsonView";
	}
}
