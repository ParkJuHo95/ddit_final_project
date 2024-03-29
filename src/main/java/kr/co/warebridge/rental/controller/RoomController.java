package kr.co.warebridge.rental.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.rental.service.BookService;
import kr.co.warebridge.rental.service.RoomService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.BookVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.RoomVO;

@Controller
@RequestMapping("/user")
public class RoomController {
	
	@Inject
	RoomService service;
	
	@Inject
	BookService bService;
	
	@PostConstruct
	@ModelAttribute("book")
	private BookVO book() {
		return new BookVO();
	}

	@GetMapping("book/roomCalendar/{roomCode}")
	public String index(
		@RealUser EmployeeVO emp,
		@PathVariable String roomCode, 
		Model model, 
		@ModelAttribute("book") BookVO book) {
		String name = emp.getEmpName();
		RoomVO room = service.selectRoom(roomCode);
		model.addAttribute("name",name);
		model.addAttribute("room",room);
		return "user/book/roomCalendar";
	}

	@GetMapping("book/roomCalendar/retrieve/{roomCode}")
	@ResponseBody
	public  List<BookVOEvent> book(@PathVariable String roomCode, Model model) {
		
		 List<BookVO> bookList = bService.checkBook(roomCode);
		 model.addAttribute(bookList);
		 return bookList.stream()
						.filter(p->p.getBookStart()!=null)
						.map(BookVOEvent::new)
						.collect(Collectors.toList());
	}
}
