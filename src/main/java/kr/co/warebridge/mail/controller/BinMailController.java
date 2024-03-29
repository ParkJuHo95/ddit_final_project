package kr.co.warebridge.mail.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.warebridge.common.paging.BootstrapFormBasePaginationRenderer;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.common.paging.PaginationRenderer;
import kr.co.warebridge.mail.service.MailService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.MailVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author PC-20 메일 휴지통 구현
 */
@Slf4j
@Controller
@RequestMapping("/user")
public class BinMailController {

	@Inject
	private MailService service;

	/**
	 * 휴지통 메일 목록
	 * 
	 * @param realUser
	 * @param paging
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@GetMapping("binMail")
	public String mailList(@RealUser EmployeeVO realUser, @ModelAttribute("paging") PaginationInfo paging,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage, Model model) {
		String mailGetter = realUser.getEmpMail();
		model.addAttribute("mailGetter", mailGetter);
		paging.setCurrentPage(currentPage);
		List<MailVO> mailList = service.retrieveBinMailList(mailGetter, paging);

		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("mailList", mailList);
		model.addAttribute("pagingHTML", pagingHTML);
		return "user/mail/binMail";
	}

	@PostMapping("binMail/rollBack")
	@ResponseBody
	public String rollBack(@RequestBody String[] mailCodes ,Model model){
		for(String m:mailCodes) {
			service.mailrollBack(m);
		}
		return "/user/binMail";
	}
}