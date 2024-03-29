package kr.co.warebridge.rental.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.warebridge.common.paging.BootstrapFormBasePaginationRenderer;
import kr.co.warebridge.common.paging.PaginationRenderer;
import kr.co.warebridge.rental.service.BookService;
import kr.co.warebridge.rental.service.CarService;
import kr.co.warebridge.rental.service.EquipService;
import kr.co.warebridge.rental.service.RoomService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.BookVO;
import kr.co.warebridge.vo.CarVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.EquipVO;
import kr.co.warebridge.vo.RoomVO;

@Controller
@RequestMapping("/user")
public class BookSubController {

	@Inject
	private RoomService service1;
	@Inject
	private CarService service2;
	@Inject
	private EquipService service3;
	@Inject
	private BookService service4;

	@GetMapping("book/bookSub")
	public String index(
			@RealUser EmployeeVO emp,
			Model model, 
			@ModelAttribute BookVO book) {
		String name = emp.getEmpName();
		String empCmpId = emp.getEmpCmpId();
		List<RoomVO> room = service1.retrieveRoomList(empCmpId);
		List<CarVO> car = service2.retrieveCarList(empCmpId);
		List<EquipVO> equip = service3.retrieveEquipList();
		model.addAttribute("name", name);
		model.addAttribute("room", room);
		model.addAttribute("car", car);
		model.addAttribute("equip", equip);
		model.addAttribute("book", book);

		return "user/book/bookSub";
	}

	@PostMapping("book/makeBook")
	public String makeBook(BookVO book, Model model) {
		service4.insertBook(book);
		model.addAttribute("location", "/user/book/roomCalendar"+book.getBookRental());
		return "jsonView";
	}
	
	@GetMapping("book/userBookList")
	public String userBookList(@RealUser EmployeeVO emp, @ModelAttribute(name = "book") BookVO book, Model model ) {
		String name = emp.getEmpName();
		List<BookVO> bookList = service4.retrieveBookList1(name);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		
		model.addAttribute("bookList", bookList);

		 return "user/book/userBookList";
	}
	
	@PostMapping("book/userBookList/modi")
	@ResponseBody
	public int bookModi(BookVO book, Model model) {
	    return service4.modifyBook(book);
	}
	
}
