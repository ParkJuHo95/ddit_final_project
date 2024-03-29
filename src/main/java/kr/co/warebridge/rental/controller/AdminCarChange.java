package kr.co.warebridge.rental.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.rental.service.CarService;
import kr.co.warebridge.vo.CarVO;
import kr.co.warebridge.vo.RoomVO;

@Controller
@RequestMapping("/admin/book")
public class AdminCarChange {
	
	@Inject
	private CarService service;
	
	@GetMapping("car/change/{carCode}")
	public String list(@PathVariable("carCode") String carCode, Model model) {
		CarVO car = service.selectCar(carCode);
		
		model.addAttribute("carCode",car.getCarCode());
		model.addAttribute("carName",car.getCarName());
		model.addAttribute("carDetail",car.getCarDetail());
		model.addAttribute("carAble",car.getCarAble());
		
		return "admin/menuManagement/book/carChange";
	}
	
	@PostMapping("car/change/{carCode}")
	@ResponseBody
	public void change(@PathVariable String carCode,CarVO car, Model model) {
		service.modifyCar(car);
	}
	
}
