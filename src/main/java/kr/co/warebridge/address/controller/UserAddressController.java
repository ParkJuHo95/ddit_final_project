package kr.co.warebridge.address.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Mapper;
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

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.employee.service.EmployeeService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.PrsnladbkVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/user/address")
public class UserAddressController {

	@Inject
	private EmployeeService service;
	
	@GetMapping
	public String addressMain() {
		return "user/address/00address";
	}
	
	@GetMapping(value = "adbkList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<EmployeeVO> retriveList(@RealUser EmployeeVO realUser ){
		//검색조건을 넣기 위한 paginationInfo 객체 생성
		PaginationInfo paging = new PaginationInfo();
		log.info(realUser.toString());
		//detailContidion 생성하고 empCmpId 넣음
		Map<String, Object> detailCondition = new HashMap<>();
		detailCondition.put("empCmpId", realUser.getEmpCmpId());
		paging.setDetailCondition(detailCondition);
		return service.retriveEmployeeList(paging);
	}

	@GetMapping(value = "adbkListnNot", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<EmployeeVO> retriveListNot(@RealUser EmployeeVO realUser){
		//검색조건을 넣기 위한 paginationInfo 객체 생성
		PaginationInfo paging = new PaginationInfo();
		log.info(realUser.toString());
		//detailContidion 생성하고 empCmpId 넣음
		Map<String, Object> detailCondition = new HashMap<>();
		detailCondition.put("empCmpId", realUser.getEmpCmpId());
		detailCondition.put("empRole", "ROLE_ADMIN");
		paging.setDetailCondition(detailCondition);
		return service.retriveEmployeeList(paging);
	}
	
	@GetMapping(value = "adbkList/{empNo}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public EmployeeVO retrieve(@PathVariable String empNo) throws Exception{
		return service.retrieveEmployee(empNo);
	}
	
}
