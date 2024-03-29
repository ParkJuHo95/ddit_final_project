package kr.co.warebridge.menu.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.menu.service.DietService;
import kr.co.warebridge.menu.service.MenuService;
import kr.co.warebridge.menu.service.RecomMenuService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.DietVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.MenuVO;
import kr.co.warebridge.vo.RecomMenuVO;

@Controller
@RequestMapping("/user/mypage")
public class DietTableController {
	
	@Inject
	private DietService dietService;
	@Inject
	private MenuService menuService;
	@Inject
	private RecomMenuService recomService;
	
	@GetMapping("dietCalendar")
	public String dietUI(@RealUser EmployeeVO employee,Model model) {
		List<MenuVO> menuList = menuService.retrieveMenuList();
		model.addAttribute("menuList", menuList);
		
		RecomMenuVO recomMenu = recomService.retrieveRecomMenu(employee.getEmpNo(), "dreaminfosystem");
		model.addAttribute("recomMenu", recomMenu);
		
//		// 갱신된 데이터를 다시 조회하여 모델에 추가
//	    List<DietVO> updatedDietList = dietService.retrieveDietTable(employee.getEmpNo(), "dreaminfosystem");
//	    model.addAttribute("dietList", updatedDietList);
		
		return "/user/employee/menu";
	}
	
	@GetMapping("dietList")
	@ResponseBody
	public List<DietVO> dietList(@RealUser EmployeeVO employee) {
		List<DietVO> dietList = dietService.retrieveDietTable(employee.getEmpNo(), "dreaminfosystem");
		return dietList;
	}
	
	@PostMapping("dietCalendar")
	@ResponseBody
	public String dietForm(@RequestParam String mId, @RealUser EmployeeVO employee) {
		DietVO diet = new DietVO();
		diet.setMId(Integer.parseInt(mId));
		diet.setEmpNo(employee.getEmpNo());
		
		ServiceResult result = dietService.createDiet(diet);
		
		return result.name();
	}
}
