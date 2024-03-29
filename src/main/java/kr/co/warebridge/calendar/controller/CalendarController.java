package kr.co.warebridge.calendar.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.calendar.AbstractEvent;
import kr.co.warebridge.calendar.ScheduleVOEvent;
import kr.co.warebridge.calendar.service.CalendarService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.schedule.ScheduleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/calendar")
public class CalendarController {
	
	private List<String> dptList;
	private EmployeeVO realUser;
	
	@Inject
	private CalendarService service;
	
	
	@GetMapping
	public String main(
		Model model,
		@RealUser EmployeeVO realUser
	) {
		dptList = service.selectDPTName(realUser);
		model.addAttribute("dptList",dptList);
		model.addAttribute("realUser",realUser);
		return "user/calendar/calendar";
	}

	@GetMapping("getData")
	@ResponseBody
	public List<AbstractEvent<?>> getData(
		@RealUser EmployeeVO realUser,
		@RequestParam String who,
		Model model
	) {
		List<ScheduleVO> scheduleList = service.retrieveScheduleList(realUser, who);
		return scheduleList.stream()
					.filter(s->s != null)
					.map(ScheduleVOEvent::new)
					.collect(Collectors.toList());
	}
	
	@GetMapping("detail")
	@ResponseBody
	public ScheduleVO getDetail(
		@RequestParam String scheduleId,
		Model model
	) {
		return service.retrieveSchedule(scheduleId);
	}
	
	
}
