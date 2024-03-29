package kr.co.warebridge.rental.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.rental.service.CarService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.CarVO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/admin/book")
public class AdminCarList {

	@Inject
	private CarService service;

	@GetMapping("car")
	public String list(@ModelAttribute("car") CarVO car, Model model,@RealUser EmployeeVO emp) {
		String empCmpId = emp.getEmpCmpId();
		log.info("empCmpId={}",empCmpId);
		List<CarVO> carList = service.retrieveCarList(empCmpId);

		model.addAttribute("carList", carList);

		return "admin/menuManagement/book/car";
	}

	@PostMapping("deleteCar")
	@ResponseBody
	public void delete(@RequestParam String carCode, Model model) {
		int cnt = service.removeCar(carCode);
	}
	
	

	@PostMapping("car")
	public String create(
			@ModelAttribute("car") CarVO car
			, @RealUser EmployeeVO realUser) {
		car.setEmpCmpId(realUser.getEmpCmpId());
		int cnt = service.insertCar(car);
		
		return "jsonView";

	}
}
