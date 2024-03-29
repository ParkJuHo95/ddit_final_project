package kr.co.warebridge.eworks.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections4.map.HashedMap;
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
import kr.co.warebridge.eworks.dao.SnctdocumentDAO;
import kr.co.warebridge.eworks.service.SnctdocumentService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.SnctdocumentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/eworks")
public class SnctlistController {
	
	@Inject
	SnctdocumentService service;
	
	@Inject
	SnctdocumentDAO dao;
	
	@GetMapping
	public String sample5(
			@RealUser EmployeeVO realUser
	        , Model model
	        , @ModelAttribute("paging") PaginationInfo paging
	        , @RequestParam(name = "page",required = false,defaultValue = "1") int page
	        ) {
		paging.setCurrentPage(page);
		Map<String, Object> detailCondition = new HashedMap();
		
		//waitingList(결재대기문서 건수 및 문서 조회)
		detailCondition.put("ssEmpNo", realUser.getEmpNo());
		detailCondition.put("ssStatus", "0"); //내 결재순서 도래
		paging.setDetailCondition(detailCondition);
		int waitingNum = dao.selectWaitingListTotalRecord(paging); //내 결재 차례가 된 문서
		List<SnctdocumentVO> waitingSdcList = dao.selectWaitingList(paging);
		model.addAttribute("waitingNum", waitingNum);
		model.addAttribute("waitingSdcList", waitingSdcList);
		
		detailCondition.put("ssStatus", "1");//내 결재순서 미도래
		int pendingNum = dao.selectWaitingListTotalRecord(paging); //내 결재순서가 도래하지 않은 문서
		model.addAttribute("pendingNum", pendingNum);
		
		detailCondition = new HashedMap();// 검색조건 초기화
		//임시저장 여부, 접속자 Id, 문서 상태를 검색조건으로 
		detailCondition.put("sdcEmpNo", realUser.getEmpNo());
		detailCondition.put("sdcResult", "1"); //임시저장 0, 상신 1
		paging.setDetailCondition(detailCondition);
		int sendedNum = dao.selectTotalRecord(paging); //내가 상신한 결재 대기 문서
		model.addAttribute("sendedNum", sendedNum);
		
		
		return "user/eworks/00eworks";
	}
	

	@GetMapping("receivedList")
	public String receivedList() {
		return "user/eworks/04receivedList";
	}

	//상신문서 리스트 조회
	@GetMapping("sendedList")
	public String snctList(
			@RealUser EmployeeVO realUser
	        , Model model
	        , @ModelAttribute("paging") PaginationInfo paging
			, @RequestParam(name = "page",required = false,defaultValue = "1") int page
	        ) {
		paging.setCurrentPage(page);
		Map<String, Object> detailCondition = new HashedMap();// 새 맵을 만들어서 넘겨줌..
		//임시저장 여부, 접속자 Id를 검색조건으로 설정
		detailCondition.put("sdcTempyn", "N");
		detailCondition.put("sdcEmpNo", realUser.getEmpNo());
		//detailCondition을 paging에 설정
		paging.setDetailCondition(detailCondition);
		
		List<SnctdocumentVO> sdcList = service.retrieveMyList(paging);
		model.addAttribute("sdcList", sdcList);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "user/eworks/01sendedList";
	}
	
	//임시저장문서 리스트 조회
	@GetMapping("savedList")
	public String savedList(
			@RealUser EmployeeVO realUser
	        , Model model
	        , @ModelAttribute("paging") PaginationInfo paging
			, @RequestParam(name = "page",required = false,defaultValue = "1") int page
	        ) {
		paging.setCurrentPage(page);
		Map<String, Object> detailCondition = new HashedMap();
		//임시저장 여부, 접속자 Id를 검색조건으로 설정
		detailCondition.put("sdcTempyn", "Y");
		detailCondition.put("sdcEmpNo", realUser.getEmpNo());
		//detailCondition을 paging에 설정
		paging.setDetailCondition(detailCondition);
		
		List<SnctdocumentVO> sdcList = service.retrieveMyList(paging);
		model.addAttribute("sdcList", sdcList);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		return "user/eworks/02savedList";
	}
	
	//결재대기문서 조회(현재 결재순서 도래 문서)
	@GetMapping("waitingList")
	public String waitingList(
			@RealUser EmployeeVO realUser
	        , Model model
	        , @ModelAttribute("paging") PaginationInfo paging
			, @RequestParam(name = "page",required = false,defaultValue = "1") int page
			) {
		paging.setCurrentPage(page);
		Map<String, Object> detailCondition = new HashedMap();
		//접속자 Id와 결재상태도래(ssStatus) 검색조건으로 설정
		detailCondition.put("ssEmpNo", realUser.getEmpNo());
		detailCondition.put("ssStatus", "0");
		paging.setDetailCondition(detailCondition);
		List<SnctdocumentVO> sdcList = service.retrieveWaitingList(paging);
		model.addAttribute("sdcList", sdcList);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "user/eworks/03waitingList";
	}
	
	//결재예정문서 조회(결재순서 미도래 문서)
	@GetMapping("pendingList")
	public String pendingList(
			@RealUser EmployeeVO realUser
			, Model model
			, @ModelAttribute("paging") PaginationInfo paging
			, @RequestParam(name = "page",required = false,defaultValue = "1") int page
			) {
		paging.setCurrentPage(page);
		Map<String, Object> detailCondition = new HashedMap();
		//접속자 Id와 결재상태도래(ssStatus) 검색조건으로 설정
		detailCondition.put("ssEmpNo", realUser.getEmpNo());
		detailCondition.put("ssStatus", "1");
		paging.setDetailCondition(detailCondition);
		List<SnctdocumentVO> sdcList = service.retrieveWaitingList(paging);
		model.addAttribute("sdcList", sdcList);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "user/eworks/05pendingList";
	}
	
	@GetMapping("completedList")
	public String completedList(
			@RealUser EmployeeVO realUser
			, Model model
			, @ModelAttribute("paging") PaginationInfo paging
			, @RequestParam(name = "page",required = false,defaultValue = "1") int page
			) {
		paging.setCurrentPage(page);
		Map<String, Object> detailCondition = new HashedMap();
		//접속자 Id와 결재상태도래(ssStatus) 검색조건으로 설정
		detailCondition.put("ssEmpNo", realUser.getEmpNo());
		detailCondition.put("ssStatus", "2");
		paging.setDetailCondition(detailCondition);
		List<SnctdocumentVO> sdcList = service.retrieveWaitingList(paging);
		model.addAttribute("sdcList", sdcList);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "user/eworks/07completedList";
	}
}
