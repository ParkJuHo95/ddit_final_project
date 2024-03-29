package kr.co.warebridge.employee.controller;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.employee.service.EmployeeService;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;

@Controller
@RequestMapping("/user/mypage/changePw")
public class ChangePwController {

	@Inject
	EmployeeService service;
	
	@GetMapping
	protected String changePw() {
		return "user/employee/changePw";
	}
	
	@PostMapping
	@ResponseBody
	public Map<String, Object> isSamePw(@RequestBody  Map<String, Object> jsonObj, @RealUser EmployeeVO employee) throws Exception {
		EmployeeVO vo = service.retrieveEmployee(employee.getEmpNo());
		String empPass = vo.getEmpPass();
		if(empPass.equals(jsonObj.get("currentPwVal"))) {
			jsonObj.put("resultMsg", "비밀번호 일치");
		}else {
			jsonObj.put("resultMsg", "비밀번호 불일치");
		}
		return jsonObj;
	}
	
	@PostMapping("update")
	@ResponseBody
	public String updatePw(
			@RequestBody EmployeeVO inputData
			, @RealUser EmployeeVO realUser
			, BindingResult errors
	){
		inputData.setEmpNo(realUser.getEmpNo());
		ServiceResult result = null;
		if(!errors.hasErrors()) {
			result = service.modifyEmpPassword(inputData);
		}
		return result.name();
	}
}
