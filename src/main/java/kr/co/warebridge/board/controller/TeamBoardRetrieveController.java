package kr.co.warebridge.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.warebridge.board.service.CommentService;
import kr.co.warebridge.board.service.TeamBoardService;
import kr.co.warebridge.calendar.service.CalendarService;
import kr.co.warebridge.common.paging.BootstrapFormBasePaginationRenderer;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.common.paging.PaginationRenderer;
import kr.co.warebridge.employee.dao.EmployeeDAO;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.CommentVO;
import kr.co.warebridge.vo.CompanyBoardVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.TeamBoardVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/user/board/team")
public class TeamBoardRetrieveController {
	
	@Inject
	private TeamBoardService service;
	@Inject
	private CommentService commentservice;
	@Inject
	private EmployeeDAO dao;
	@Inject
	private CalendarService Cservice;
	
	@ModelAttribute("boardList")
	public List<CompanyBoardVO> board(){
//		CompanyBoardVO vo = new CompanyBoardVO();
//		vo.setCbNotice("dummy");
//		List<CompanyBoardVO> dummy = new ArrayList<CompanyBoardVO>();
		return new ArrayList<CompanyBoardVO>();
	}
	
	@ModelAttribute("paging")
	public PaginationInfo paging(){
		return new PaginationInfo();
	}
	
	@ModelAttribute("dptList")
	public List<String> dptList(){
		return new ArrayList<String>(); 
	}

	@ModelAttribute("board")
	public TeamBoardVO dummyBoard(){
		return new TeamBoardVO(); 
	}
	
	@GetMapping
	public String list(@RequestParam(name = "page",required = false,defaultValue = "1") int page
			, Model model
			, @ModelAttribute("paging") PaginationInfo paging
			, @RealUser EmployeeVO realUser
			
	) {
		paging.setCurrentPage(page);
		List<TeamBoardVO> boardList = service.retrieveBoardList(paging);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		String pagingHTML = renderer.renderPagination(paging);
		List<String> dptList = Cservice.selectDPTName(realUser);
		model.addAttribute("dptList", dptList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagingHTML", pagingHTML);
		return "user/board/teamboard";
	}

	@GetMapping("{tbNo}")
	public String detail(@PathVariable int tbNo, Model model, CommentVO commentVO) {
		TeamBoardVO board = service.retrieveBoard(tbNo);
		model.addAttribute("board", board);
		
		List<CommentVO> comment = null;
		comment = commentservice.retrieveCommentList(tbNo);
		model.addAttribute("comment", comment);
//		model.addAttribute("commentVO", commentservice.retrieveCommentList(cbNo));
//		List<CommentVO> comment = commentservice.retrieveCommentList(cmpCbNo);
		return "user/board/teamboardDetail";
	}

	@PostMapping("{tbNo}/notice")
	@ResponseBody
	public ResponseEntity<String> registerNotice(@RealUser EmployeeVO loginUser, @PathVariable int tbNo, RedirectAttributes redirectAttributes) {
	    try {
	        service.registerNotice(tbNo);
	        // 성공 시
	        return ResponseEntity.ok("공지 등록 성공");
	    } catch (Exception e) {
	        // 실패 시
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("공지 등록 실패");
	    }
	}
	@PostMapping("{tbNo}/unnotice")
	@ResponseBody
	public ResponseEntity<String> unregisterNotice(@RealUser EmployeeVO loginUser, @PathVariable int tbNo, RedirectAttributes redirectAttributes) {
	    try {
	        service.unregisterNotice(tbNo);
	        // 성공 시
	        return ResponseEntity.ok("공지에서 내림");
	    } catch (Exception e) {
	        // 실패 시
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("공지 내리기 실패");
	    }
	}
	
}
