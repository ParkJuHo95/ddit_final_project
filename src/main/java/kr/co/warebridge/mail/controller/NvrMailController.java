package kr.co.warebridge.mail.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.warebridge.common.paging.BootstrapFormBasePaginationRenderer;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.common.paging.PaginationRenderer;
import kr.co.warebridge.mail.service.NvrService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.NvrVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/mail")
public class NvrMailController {
	@Inject
	private 
     NvrService service;
	@GetMapping("nvrMail")
	public String mailList(
	        @ModelAttribute("paging") PaginationInfo paging,
	        @RealUser EmployeeVO emp,
	        @RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
	        Model model) {
		String empNo = emp.getEmpNo();
	    paging.setCurrentPage(currentPage);
	    List<NvrVO> naverList = service.retrieveNvrList(paging);
	    PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
	    String pagingHTML = renderer.renderPagination(paging);
	    log.info("naverList ==> {}", naverList);
	    model.addAttribute("naverList", naverList);
	    model.addAttribute("pagingHTML", pagingHTML);
	    return "user/mail/nvrMail";
	}
	
	@GetMapping("nvrmailDetail/{nvrCode}")
	public String mailDetail(@PathVariable String nvrCode, Model model) {
		NvrVO mail = service.showNvr(nvrCode);
		model.addAttribute("mail", mail);
		return "user/mail/nvrmailDetail";
	}
}
