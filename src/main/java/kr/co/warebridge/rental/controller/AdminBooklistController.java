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

import kr.co.warebridge.common.paging.BootstrapFormBasePaginationRenderer;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.common.paging.PaginationRenderer;
import kr.co.warebridge.rental.service.BookService;
import kr.co.warebridge.vo.BookVO;

@Controller
@RequestMapping("/admin/book")
public class AdminBooklistController {

	@Inject
	private BookService service;

	@GetMapping("bookList")
	public String list(@ModelAttribute("paging") PaginationInfo paging,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage, Model model) {

		paging.setCurrentPage(currentPage);
		List<BookVO> bookList = service.retrieveBookList(paging);
		
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("pagingHTML", pagingHTML);

		return "admin/menuManagement/book/bookList";
	}
	
	@PostMapping("bookList")
	public String cancel(@RequestParam("bookCode") String bookCode, Model model) {
		
		service.cancelBook(bookCode);
		
		return "admin/menuManagement/book/bookList";
		
	}
}
