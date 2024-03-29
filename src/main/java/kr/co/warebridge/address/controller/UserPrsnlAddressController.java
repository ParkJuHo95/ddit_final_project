package kr.co.warebridge.address.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.address.service.AdbkService;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.employee.service.EmployeeService;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.DepartmentVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.PrsnladbkVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/user/address/prsnl")
public class UserPrsnlAddressController {
	@Inject
	private AdbkService service;
	
	@GetMapping
	public String prsnladdressMain() {
		return "user/address/02prsnladdress";
	}
	
	@GetMapping("insertForm")
	public String addressInsertForm(@ModelAttribute PrsnladbkVO pab) {
		log.info("/user/address/insertForm");
		return "user/address/01insertForm";
	}
	
	@GetMapping(value = "prsnladbkList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<PrsnladbkVO> retriveList(@RealUser EmployeeVO realUser){
		//검색조건을 넣기 위한 paginationInfo 객체 생성
		PaginationInfo paging = new PaginationInfo();

		//detailContidion 생성하고 empCmpId 넣음
		Map<String, Object> detailCondition = new HashMap<>();
		detailCondition.put("pabEmpNo", realUser.getEmpNo());
		detailCondition.put("pabCmpId", realUser.getEmpCmpId());
		paging.setDetailCondition(detailCondition);
		return service.retriveAdbkList(paging);
	}
	
	@PostMapping(value = "prsnlAdbk/modify", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> modify(
			@ModelAttribute("adbk") PrsnladbkVO adbk,
			Model model) {
		ServiceResult result = service.modifyAdbk(adbk);
		if (result == ServiceResult.OK) {
	        return ResponseEntity.ok(ServiceResult.OK.name());
	    } else {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("주소록 수정 실패");
	    }
	}
	
	@PostMapping(value = "prsnlAdbk/create", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> create(
			@RealUser EmployeeVO realUser,
			@ModelAttribute("adbk") PrsnladbkVO adbk,
			Model model) {
		adbk.setPabEmpNo(realUser.getEmpNo());
		adbk.setPabCmpId(realUser.getEmpCmpId());
		ServiceResult result = service.createAdbk(adbk);
		if (result == ServiceResult.OK) {
			return ResponseEntity.ok("OK");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("실패");
		}
	}
	
	
	@PostMapping(value = "prsnlAdbk/remove/{pabNo}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> remove(
			String pabNo,
			Model model) {
		
		ServiceResult result = service.removeAdbk(pabNo);
		
		if (result == ServiceResult.OK) {
			return ResponseEntity.ok("주소록 삭제 성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("주소록 삭제 실패");
		}
	}
}
