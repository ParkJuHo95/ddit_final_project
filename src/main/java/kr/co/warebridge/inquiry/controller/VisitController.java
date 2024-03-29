package kr.co.warebridge.inquiry.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import kr.co.warebridge.inquiry.service.VisitService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.VisitVO;

@Controller
@RequestMapping("/admin/inquiry/visit")
public class VisitController {
	
	@Inject
	private VisitService service;
	
	@ModelAttribute("paging")
	public PaginationInfo setPaging() {
		return new PaginationInfo();
	}
	
	@GetMapping
	public String visitList(
		Model model,
		@ModelAttribute("paging") PaginationInfo paging,
		@RequestParam(name = "page",required = false,defaultValue = "1") int page,
		@RealUser EmployeeVO realUser
	) {
		paging.setCurrentPage(page);
		paging.setCmpId(realUser.getEmpCmpId());
		List<VisitVO> visitList = service.retrieveList(paging);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("visitList", visitList);

		return "admin/inquiry/visit";
	}

	@GetMapping("form")
	public String visitForm() {
		return "admin/inquiry/visitForm";
	}

	@PostMapping("form")
	@ResponseBody
	public void visitInsertForm(
		Model model,
		@RequestBody VisitVO insertData,
		@RealUser EmployeeVO realUser
	) {
		insertData.setCmpId(realUser.getEmpCmpId());
		service.createVisit(insertData);
	}
	
	@GetMapping("detail/{iNum}")
	public String detailInquiry(
		@PathVariable String iNum,
		Model model
	) {
		VisitVO visitVO = service.retrieveOne(iNum);
		model.addAttribute("visitVO",visitVO);
		return "admin/inquiry/visitDetail";
	}
	
	

	@GetMapping("update/{iNum}")
	public String updateInquiryForm(
		@PathVariable String iNum,
		Model model
	) {
		VisitVO visitVO = service.retrieveOne(iNum);
		model.addAttribute("visitVO",visitVO);
		return "admin/inquiry/visitForm";
	}

	@PostMapping("update/{iNum}")
	@ResponseBody
	public void updateInquiry(
		@PathVariable String iNum,
		Model model,
		@RequestBody VisitVO updateData,
		@RealUser EmployeeVO realUser
	) {
		updateData.setVisitId(iNum);
		updateData.setCmpId(realUser.getEmpCmpId());
		int cnt = service.modifyVisit(updateData);
		model.addAttribute("cnt",cnt);
	}
	
	
	
	@PostMapping("delete")
	@ResponseBody
	public void deleteInquiry(
		@RequestBody HashMap<String,String[]> maps,
		Model model
	) {
		String[] number = maps.get("number");
		int cnt = service.removeVisit(number);
		model.addAttribute("cnt",cnt);
	}
}
