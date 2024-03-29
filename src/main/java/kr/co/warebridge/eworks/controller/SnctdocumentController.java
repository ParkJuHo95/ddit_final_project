package kr.co.warebridge.eworks.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.warebridge.admin.organization.dao.DepartmentSystemDAO;
import kr.co.warebridge.common.paging.BootstrapFormBasePaginationRenderer;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.common.paging.PaginationRenderer;
import kr.co.warebridge.employee.service.EmployeeService;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.eworks.service.SnctdocumentService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.DepartmentVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.SnctdocumentVO;
import kr.co.warebridge.vo.SnctstatusVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/eworks")
public class SnctdocumentController {

	@Inject
	SnctdocumentService service;
	
	@Inject
	DepartmentSystemDAO dDao;
	
	//새 문서 작성
	@GetMapping("newDoc/{sdcSfId}")
	public String newDoc(
			@ModelAttribute("sdc") SnctdocumentVO sdc
			, @RealUser EmployeeVO realUser
//			, @PathVariable String sdcSfId
			, Model model
			) {
		//접속한 사용자의 empNo 가져옴
		String empNo = realUser.getEmpNo();
		sdc.setSdcEmpNo(empNo);
		//empNo, sdcSfId >> snctform, List<SnctlineVO> usedSnctlines 들어감
		sdc = service.retrieveNewDoc(sdc);
		
		PaginationInfo paging = new PaginationInfo();
		paging.setDetailCondition(Collections.singletonMap("dptCmpId", realUser.getEmpCmpId()));
		List<DepartmentVO> snctLineDpt = dDao.selectLineTreeList(paging);
		model.addAttribute("snctLineDpt", snctLineDpt);
		model.addAttribute("sdc", sdc);
		return "user/eworks/06newDoc";
	}
	
	//문서 저장(임시저장 또는 상신)
	@PostMapping("saveDoc/{sdcTempyn}")
	public String saveDoc(
			@ModelAttribute("sdc") SnctdocumentVO sdc
			, @RealUser EmployeeVO realUser
	        , Model model
			) {
		log.info("saveDoc에 들어올 때 : {}",sdc.toString());
	    
	    sdc.setSdcEmpNo(realUser.getEmpNo());
	    sdc.setSdcCmpId(realUser.getEmpCmpId());
	    
	    //DB insert
	    ServiceResult result = service.create(sdc);
	    log.info("저장 후 sdc: {}",sdc.toString());
	    if(result == ServiceResult.OK) {
	    	String location = "/user/eworks/docDetail/"+sdc.getSdcId(); //요청보낼주소
	    	model.addAttribute("location", location);
	    	
	    	//첫번째 결재자에게 메시지 보내주기
	    	String message = "결재할 문서가 도착했습니다";
	    	String receiver = sdc.getSnctline().getSnctdetails().get(0).getSdtEmpNo();
	    	model.addAttribute("message", message);
	    	model.addAttribute("receiver", receiver);
	    	model.addAttribute("link", location);
	    } 
		return "jsonView";
	}
	
	//문서 상세내용 조회
	@GetMapping("docDetail/{sdcId}")
	public String docDetail(
			@PathVariable String sdcId
			, Model model
			) {
		//sdcId로 문서 가져오기
		SnctdocumentVO sdc = service.retrieveOne(sdcId);
		model.addAttribute("sdc", sdc);
		return "user/eworks/01zdocDetail";
	}
	
	//임시저장 문서 상세내용 조회
	@GetMapping("tempSaved/{sdcId}")
	public String tempSaved(
			@PathVariable String sdcId
			, Model model
			) {
		//sdcId로 문서 가져오기
		SnctdocumentVO sdc = service.retrieveOne(sdcId);
		model.addAttribute("sdc", sdc);
		return "user/eworks/01ztempSaved";
	}
	

	
	//문서 결재 > approve여부와 문서ID가 같이 넘어옴
	@PostMapping("atrz/{approve}/{ssSdcId}")
	public String approve(
			@RealUser EmployeeVO realUser
			, Model model
			, @PathVariable(name = "approve") String approve
			, SnctstatusVO status
			, @RequestParam(name = "arbit", defaultValue = "false") boolean arbit
			) {
		boolean pre = false; //선결여부(true : 앞 결재자보다 먼저 결재함)
		log.info("approve value: "+ approve);
		log.info(status.toString());
		log.info("arbit value: "+ arbit);
		//Controller로 넘어올 때
		//ssSdcId O , ssSlId=X(없어도됨), ssSdtOrder=null(service에서 조회), ssEmpNo X 바로 realUser로 세팅
		//ssType=null X service에서 로직에 따라 설정 A 일반승인 B 반려 C 전결	D 선결승인 E 선결반려 F 후결
		//ssSnctdat X insert시 현재시각으로 넣음, ssStatus X 0 : 결재대기(현재순서)	, 1: 결재대기(이후순서), 2: 결재완료(승인/반려 상관없음)
		//ssRemark O 받아온 결재의견
		status.setSsEmpNo(realUser.getEmpNo());

		Map<String, String> snctResult = service.approve(status, approve, arbit);
		String location = "";
    	
		if(pre) {
			location = "/user/eworks/pendingList";
		}else {
			location = "/user/eworks/waitingList";
		}
		
		model.addAttribute("location", location);
		if(snctResult.containsKey("message")) {
	    	model.addAttribute("message", snctResult.get("message"));
	    	model.addAttribute("receiver", snctResult.get("receiver"));
	    	model.addAttribute("link", "/user/eworks/docDetail/"+snctResult.get("sdcId"));
		}
		
		return "jsonView";
	}
	
}
