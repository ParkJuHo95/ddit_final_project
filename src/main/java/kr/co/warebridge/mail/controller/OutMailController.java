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

@Controller
@RequestMapping("/user/mail")
public class OutMailController {
	
	@Inject
	private MailService service;

	@GetMapping("outMail")
	public String mailList(@RealUser EmployeeVO realUser,
	        @ModelAttribute("paging") PaginationInfo paging,
	        @RequestParam(name = "page", required = false, defaultValue = "1") int currentPage, Model model) {
		String mailSender = realUser.getEmpMail();
		model.addAttribute("mailSender",mailSender);
	    paging.setCurrentPage(currentPage);
	    List<MailVO> mailList = service.retrieveSendMailList(mailSender, paging);

	    PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

	    String pagingHTML = renderer.renderPagination(paging);
	    model.addAttribute("mailList", mailList);
	    model.addAttribute("pagingHTML", pagingHTML);

	    return "user/mail/outMail";
	}
	
	@PostMapping("outMail/delete")
	@ResponseBody
	public void mailDelete(@RequestBody String[] mailCodes ,Model model) {
		for(String m:mailCodes) {
			service.outMailToBin(m);
		}
	}
	@PostMapping("outMail/reply")
	public String mailReply(
		@RequestBody Map<String,String> map,
		Model model
	) {
		String selectedMails = map.get("selectedMails");
		MailVO mail = service.showMail(selectedMails);
		model.addAttribute(mail);
		return "user/mail/mailReply";
	}
	@PostMapping("outMail/sMailSend")
	public String sMailSend(
		@RequestBody Map<String,String> map,
		Model model
	) {
		String selectedMails = map.get("selectedMails");
		MailVO mail = service.showMail(selectedMails);
		
		model.addAttribute(mail);
		return "user/mail/mailReply";
	}
	@PostMapping("outMail/forward")
	public String mailForward(
			@RequestBody Map<String,String> map,
			Model model
			) {
		String selectedMails = map.get("selectedMails");
		MailVO mail = service.showMail(selectedMails);
		model.addAttribute(mail);
		return "user/mail/mailForward";
	}
	
	
	
}
