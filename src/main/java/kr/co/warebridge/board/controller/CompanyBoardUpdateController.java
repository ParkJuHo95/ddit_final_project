package kr.co.warebridge.board.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.warebridge.board.exception.BoardException;
import kr.co.warebridge.board.service.BoardService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.CompanyBoardVO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/board/company")
public class CompanyBoardUpdateController {
	
	@Inject
	private BoardService service;
	
//	@GetMapping("{cbNo}/update")
//	public String form(Model model) {
//		model.containsAttribute(model)) {
//			return "user/board/boardEdit";
//		}
//	}
	
	@GetMapping("{cbNo}/update")
    public String form(Model model, @RealUser EmployeeVO loginUser, @PathVariable int cbNo) {
		String location = "";
		try {
			CompanyBoardVO board = service.retrieveBoard(cbNo);
			if (loginUser.getEmpNo().equals(board.getCbEmpNo())) {
				model.addAttribute("cmdObj", board);
				location = "user/board/boardEdit";
			} else {
				model.addAttribute("errorMessage", "글 작성자만 수정할 수 있습니다.");
				location = "errorPage";  
				log.info(" empNo {} cbempNo: {} ", loginUser.getEmpNo(), board.getCbEmpNo());
			}   
		} catch (BoardException e) {
			model.addAttribute("errorMessage", e.getMessage());
			location = "";
		}
        return location;
    }
	  
    @PostMapping("{cbNo}/update")
    public String update(@ModelAttribute("cmdObj") CompanyBoardVO board, RedirectAttributes redirectAttributes) {
        service.modifyBoard(board);
        return "jsonView";
    }
    
    @PostMapping(value = "{cbNo}/delete")
    @ResponseBody
    public ResponseEntity<String> delete(@RealUser EmployeeVO loginUser, @PathVariable int cbNo, RedirectAttributes redirectAttributes) {
        try {
            CompanyBoardVO board = service.retrieveBoard(cbNo);
            if (loginUser.getEmpRole() != null && "ROLE_ADMIN".equals(loginUser.getEmpRole().get(0))) {
                service.removeBoard(board);
            	return ResponseEntity.ok("게시글 삭제 성공");
            } else {
                // 일반 사용자인 경우에는 작성자와 비교하여 삭제 권한 확인
                if (loginUser.getEmpNo().equals(board.getCbEmpNo())) {
                    service.removeBoard(board);
                    return ResponseEntity.ok("게시글 삭제 성공");
                } else {
                	log.info("loginUser.getEmpRole() : {}", loginUser.getEmpRole());
                    return ResponseEntity.status(HttpStatus.FORBIDDEN).body("게시글 삭제 권한이 없습니다.");
                }
            }
        } catch (BoardException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("게시글 삭제 실패");
		}
	}
}