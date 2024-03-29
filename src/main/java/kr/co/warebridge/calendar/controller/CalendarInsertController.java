package kr.co.warebridge.calendar.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.warebridge.calendar.service.CalendarService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.schedule.ScheduleVO;

@Controller
@RequestMapping("/user/calendar")
public class CalendarInsertController {
	
	@Inject
	private CalendarService service;
	
	@ModelAttribute("schedule")
	public ScheduleVO schedule() {
		return new ScheduleVO();
	}
	
	
	@GetMapping("input")
	public String inputForm(
		@RealUser EmployeeVO realUser,
		@ModelAttribute("schedule") ScheduleVO schedule,
		Model model
	) {
		List<String> dptList = service.selectDPTName(realUser);
		model.addAttribute("realUser",realUser);
		model.addAttribute("dptList",dptList);
		return "user/calendar/inputCalendar";
	}

	@PostMapping("input")
	public String input(
		Model model,
		@RealUser EmployeeVO realUser,
		@ModelAttribute ScheduleVO schedule
	) {
		int result = service.createSchedule(schedule, realUser);
		model.addAttribute("result",result);
		return "jsonView";
	}

	@PostMapping("update")
	public String update(
			Model model,
			@RealUser EmployeeVO realUser,
			@ModelAttribute ScheduleVO schedule
			) {
		int result = service.modifySchedule(schedule, realUser);
		model.addAttribute("result",result);
		return "jsonView";
	}

	@PostMapping("delete/{scheduleId}")
	public String delete(
			Model model,
			@RealUser EmployeeVO realUser,
			@PathVariable String scheduleId
			) {
		int result = service.removeSchedule(scheduleId);
		model.addAttribute("result",result);
		return "jsonView";
	}
}
