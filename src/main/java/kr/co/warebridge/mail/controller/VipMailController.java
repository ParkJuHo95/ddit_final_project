package kr.co.warebridge.mail.controller;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.warebridge.common.paging.BootstrapFormBasePaginationRenderer;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.common.paging.PaginationRenderer;
import kr.co.warebridge.mail.service.MailService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.MailVO;

@Controller
@RequestMapping("/user")
public class VipMailController {
	
	@Inject
	private MailService service;

	@GetMapping("VipMail")
	public String mailList(@RealUser EmployeeVO realUser,
	        @ModelAttribute("paging") PaginationInfo paging,
	        @RequestParam(name = "page", required = false, defaultValue = "1") int currentPage, Model model) {
		String mailGetter = realUser.getEmpMail();
		model.addAttribute("mailGetter",mailGetter);
	    paging.setCurrentPage(currentPage);
	    List<MailVO> mailList = service.retrieveVipMailList(mailGetter, paging);

	    PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

	    String pagingHTML = renderer.renderPagination(paging);
	    model.addAttribute("mailList", mailList);
	    model.addAttribute("pagingHTML", pagingHTML);

	    return "user/mail/VipMail";
	}

}
