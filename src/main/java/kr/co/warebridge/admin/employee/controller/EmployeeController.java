package kr.co.warebridge.admin.employee.controller;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.warebridge.common.paging.BootstrapFormBasePaginationRenderer;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.common.paging.PaginationRenderer;
import kr.co.warebridge.company.service.CompanyService;
import kr.co.warebridge.department.service.DeptService;
import kr.co.warebridge.employee.service.EmployeeService;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.validate.UpdateGroup;
import kr.co.warebridge.vo.CompanyVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.InquiryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/organization")
public class EmployeeController {

	@Inject
	EmployeeService service;
	@Inject
	CompanyService cmpService;
	
	@GetMapping("employeeList")
	protected String employeeList(
			@RealUser EmployeeVO realUser,
			@RequestParam Map<String, Object> detailCondition,
			Model model,
			@ModelAttribute("paging") PaginationInfo paging,
			@RequestParam(name = "page",required = false, defaultValue = "1") int currentPage
	) {
		log.info("detailCondition : {}", detailCondition);
		paging.setCurrentPage(currentPage);
		
		//detailContidion 생성하고 empCmpId 넣음
		detailCondition.put("empCmpId", realUser.getEmpCmpId());
//		detailCondition.put("empName", realUser.getEmpName());
		paging.setDetailCondition(detailCondition);
		
		List<EmployeeVO> empList = service.retriveEmployeeList(paging);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#searchForm");
		String pagingHTML = renderer.renderPagination(paging);
		
		
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("empList", empList);
		model.addAttribute("condition", detailCondition);
		
		return "admin/organization/employeeList";
	}
	
	//상단 navbar 
	@GetMapping("orgEmployeeList/{dptId}")
	@ResponseBody
	protected List<EmployeeVO> deptEmployeeList(
			@RealUser EmployeeVO realUser,
			@PathVariable String dptId,
			@RequestParam Map<String, Object> detailCondition,
			Model model,
			@ModelAttribute("paging") PaginationInfo paging
			) {
		log.info("detailCondition input : {}", detailCondition);
		
		if(dptId.startsWith("TF")) {
			detailCondition.put("empDptId2", dptId);
			log.info("TF detailCondition input : {}", detailCondition);
		}else {
			detailCondition.put("empDptId1", dptId);
			log.info("일반 team detailCondition input : {}", detailCondition);
		}
		
		//detailContidion에 empCmpId 넣음
		detailCondition.put("empCmpId", realUser.getEmpCmpId());
		paging.setDetailCondition(detailCondition);
		
		List<EmployeeVO> empList = service.retriveEmployeeList(paging);
		
		empList.sort(Comparator.comparing(EmployeeVO::getEmpDptId1)
                .thenComparing((e1, e2) -> {
                    if ("팀장".equals(e1.getEmpJobposition()) && !"팀장".equals(e2.getEmpJobposition())) {
                        return -1;
                    } else if (!"팀장".equals(e1.getEmpJobposition()) && "팀장".equals(e2.getEmpJobposition())) {
                        return 1;
                    } else {
                        return 0;
                    }
                }));
		return empList;
	}
	
	//사원 상세조회 & 수정 핸들러
	@RequestMapping(value = "employeeInfo", method = {RequestMethod.GET, RequestMethod.POST})
	protected String employeeDetailView(
			HttpServletRequest req
			, String who
			, @ModelAttribute EmployeeVO formData
			, @RealUser EmployeeVO realUser
			,  Model model
	) throws Exception {
		String reqMethod = req.getMethod();
		log.info("reqMethod ==========> {}",reqMethod);
		log.info("formData ==========> {}",formData);
		if (RequestMethod.POST.name().equals(reqMethod)) {
			
			service.modifyEmployee(formData);
		}
		EmployeeVO employee = service.retrieveEmployee(who);
		model.addAttribute("employee",employee);
		
		return "admin/organization/employeeView";
	}
	
	
	//사원 개별등록 핸들러
	@PostMapping("regiEmployee")
	@ResponseBody
	public String regiEmployee(
			@Validated(UpdateGroup.class) @RealUser EmployeeVO  realUser //로그인된 사내관리자
			, @ModelAttribute("employee") EmployeeVO formData //폼에서 입력받은 사원정보
			, BindingResult errors
			, RedirectAttributes redirectAttributes
	) throws Exception {
		log.info("realUser : {}", realUser);
		//새로 등록할 사원정보에 로그인된 사내관리자와 같은 cmpId를 주기위함.
		String empCmpId = realUser.getEmpCmpId();
		formData.setEmpCmpId(empCmpId);
		CompanyVO cmp = cmpService.retrieveCompany(empCmpId);
		formData.setEmpPass(cmp.getCmpInitPass()); //초기비밀번호
		ServiceResult result = service.createEmployee(formData);
		switch (result) {
		case OK:
			return result.name();
			
		default:
			return result.name();
		}
	}
}
