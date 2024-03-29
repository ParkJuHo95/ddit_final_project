package kr.co.warebridge.admin.organization.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.admin.organization.service.PersonnelSystemService;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.PersonnelSystemVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/organization/personnelSystem")
public class AdminPersonnelSystemController {
	
	@Inject
	PersonnelSystemService service;
	
	@GetMapping
	public String personnelSystem(
			@ModelAttribute("psa") PersonnelSystemVO psa,
			@ModelAttribute("psb") PersonnelSystemVO psb,
			Model model) {
		return "admin/organization/personnelSystem";
	}
	
	@GetMapping(value = "jobrankList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<PersonnelSystemVO> retrieveJobrankList(@RealUser EmployeeVO realUser){
		return service.retriveJobrankList(realUser.getEmpCmpId());
	}

	@GetMapping(value = "jobrank/{prsCode}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public PersonnelSystemVO retrieveJobrank(@PathVariable String prsCode
			, @RealUser EmployeeVO realUser
			){
		return service.retrieveJobrank(prsCode, realUser.getEmpCmpId());
	}
	
	@GetMapping(value = "jobpositionList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<PersonnelSystemVO> retrieveJobposition(@RealUser EmployeeVO realUser){
		return service.retriveJobpositionList(realUser.getEmpCmpId());
	}
	
	
	@GetMapping(value = "jobposition/{prsCode}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public PersonnelSystemVO retrieveJobposition(@PathVariable String prsCode
			, @RealUser EmployeeVO realUser){
		return service.retrieveJobposition(prsCode, realUser.getEmpCmpId());
	}
	
	@PostMapping(value = "jobrank/modify", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> modifyJobrank(
			@ModelAttribute("psa") PersonnelSystemVO psa
			, @RealUser EmployeeVO realUser
			, Model model) {
		psa.setPrsEmpChangerid(realUser.getEmpNo());
		psa.setPrsCmpId(realUser.getEmpCmpId());
		
		ServiceResult result = service.modifyJobrank(psa);
		
		if (result == ServiceResult.OK) {
	        return ResponseEntity.ok("직위 수정 성공");
	    } else {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("직위 수정 실패");
	    }
	}
	@PostMapping(value = "jobposition/modify", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> modifyJobposition(
			@ModelAttribute("psb") PersonnelSystemVO psb
			, @RealUser EmployeeVO realUser
			, Model model) {
		psb.setPrsEmpChangerid(realUser.getEmpNo());
		psb.setPrsCmpId(realUser.getEmpCmpId());
		
		ServiceResult result = service.modifyJobposition(psb);
		
		if (result == ServiceResult.OK) {
			return ResponseEntity.ok("직책 수정 성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("직책 수정 실패");
		}
	}
	
	@PostMapping(value = "jobrank/create", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> createJobrank(
			@ModelAttribute("psa") PersonnelSystemVO psa
			, @RealUser EmployeeVO realUser
			, Model model) {
		
		psa.setPrsCmpId(realUser.getEmpCmpId());
		String prsEmpChangerid = realUser.getEmpNo();
		psa.setPrsEmpChangerid(prsEmpChangerid);
		psa.setPrsEmpRegisterid(prsEmpChangerid);
		
		ServiceResult result = service.createJobrank(psa);
		
		if (result == ServiceResult.OK) {
			return ResponseEntity.ok("직위 등록 성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("직위 등록 실패");
		}
	}
	
	@PostMapping(value = "jobposition/create", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> createJobposition(
			@ModelAttribute("psb") PersonnelSystemVO psb
			, @RealUser EmployeeVO realUser
			, Model model) {
		
		psb.setPrsCmpId(realUser.getEmpCmpId());
		String prsEmpChangerid = realUser.getEmpNo();
		log.info("=======prsEmpChangerId:{}=",prsEmpChangerid);
		psb.setPrsEmpChangerid(prsEmpChangerid);
		psb.setPrsEmpRegisterid(prsEmpChangerid);
		
		ServiceResult result = service.createJobposition(psb);
		
		if (result == ServiceResult.OK) {
			return ResponseEntity.ok("직책 등록 성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("직책 등록 실패");
		}
	}
	
	
	@PostMapping(value = "jobrank/remove", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> removeJobrank(
			@ModelAttribute("psa") PersonnelSystemVO psa
			, @RealUser EmployeeVO realUser
			, Model model) {
		psa.setPrsCmpId(realUser.getEmpCmpId());
		String prsEmpChangerid = realUser.getEmpNo();
		log.info("=======prsEmpChangerId:{}=",prsEmpChangerid);
		psa.setPrsEmpChangerid(prsEmpChangerid);
		
		ServiceResult result = service.removeJobrank(psa);
		
		if (result == ServiceResult.OK) {
			return ResponseEntity.ok("직위 삭제 성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("직위 삭제 실패");
		}
	}
	
	@PostMapping(value = "jobposition/remove", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> removeJobposition(
			@ModelAttribute("psb") PersonnelSystemVO psb
			, @RealUser EmployeeVO realUser
			, Model model) {
		
		psb.setPrsCmpId(realUser.getEmpCmpId());
		String prsEmpChangerid = realUser.getEmpNo();
		psb.setPrsEmpChangerid(prsEmpChangerid);
		
		ServiceResult result = service.removeJobposition(psb);
		
		if (result == ServiceResult.OK) {
			return ResponseEntity.ok("직책 삭제 성공");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("직책 삭제 실패");
		}
	}
	
}
