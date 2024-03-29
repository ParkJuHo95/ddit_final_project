package kr.co.warebridge.inquiry.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.common.paging.BootstrapFormBasePaginationRenderer;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.common.paging.PaginationRenderer;
import kr.co.warebridge.inquiry.service.InquiryService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.InquiryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/inquiry")
public class InquiryController {
	
	@Inject
	private InquiryService service;
	
	@ModelAttribute("paging")
	public PaginationInfo setPaging() {
		return new PaginationInfo();
	}

//	@ModelAttribute("inquiryList")
//	public List<InquiryVO> setPaging() {
//		return new List<InquiryVO>();
//	}
	
	@GetMapping
	public String main(
		Model model,
		@ModelAttribute("paging") PaginationInfo paging,
		@RequestParam(name = "page",required = false,defaultValue = "1") int page,
		@RealUser EmployeeVO realUser 
	) {
		paging.setCurrentPage(page);
		paging.setCmpId(realUser.getEmpCmpId());
		List<InquiryVO> inquiryList = service.retrieveList(paging);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("inquiryList", inquiryList);
		return "admin/inquiry/inquiry";
	}

	@GetMapping("form")
	public String form() {
		return "admin/inquiry/inquiryForm";
	}
	
	
	@PostMapping("form")
	@ResponseBody
	public void updateInquiry(
		Model model,
		@RequestBody InquiryVO insertData,
		@RealUser EmployeeVO realUser
	) {
		insertData.setCmpId(realUser.getEmpCmpId());
		service.createInquiry(insertData);
	}
	
	
	
	@GetMapping("detail/{iNum}")
	public String detailInquiry(
		@PathVariable String iNum,
		Model model
	) {
		InquiryVO inquiryVO = service.retrieveOne(iNum);
		model.addAttribute("inquiryVO",inquiryVO);
		return "admin/inquiry/inquiryDetail";
	}
	
	

	@GetMapping("update/{iNum}")
	public String updateInquiryForm(
		@PathVariable String iNum,
		Model model
	) {
		InquiryVO inquiryVO = service.retrieveOne(iNum);
		model.addAttribute("inquiryVO",inquiryVO);
		return "admin/inquiry/inquiryForm";
	}

	@PostMapping("update/{iNum}")
	@ResponseBody
	public void updateInquiry(
		@PathVariable String iNum,
		Model model,
		@RequestBody InquiryVO updateData,
		@RealUser EmployeeVO realUser
	) {
		updateData.setInqryId(iNum);
		updateData.setCmpId(realUser.getEmpCmpId());
		int cnt = service.modifyInquiry(updateData);
		model.addAttribute("cnt",cnt);
	}
	
	
	
	@PostMapping("delete")
	@ResponseBody
	public void deleteInquiry(
		@RequestBody HashMap<String,String[]> maps,
		Model model
	) {
		String[] number = maps.get("number");
		int cnt = service.removeInquiry(number);
		model.addAttribute("cnt",cnt);
	}


}

