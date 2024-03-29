package kr.co.warebridge.rental.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.warebridge.rental.service.CarService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.BookVO;
import kr.co.warebridge.vo.CarVO;
import kr.co.warebridge.vo.EmployeeVO;

@Controller
@RequestMapping("/user")
public class CarController {

	@Inject
	CarService service;

	@GetMapping("book/carCalendar{carCode}")
	public String index() {
		return "user/book/carCalendar";
	}

	@GetMapping("book/carCalendar/{carCode}")
	public String carBook(
			@RealUser EmployeeVO emp,
			@PathVariable String carCode, 
			Model model,
			@ModelAttribute("book") BookVO book) {
		String name = emp.getEmpName();
		CarVO car = service.selectCar(carCode);
		model.addAttribute("name", name);
		model.addAttribute("car", car);

		return "user/book/carCalendar";
	}

}
