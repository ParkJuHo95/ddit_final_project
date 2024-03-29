package kr.co.warebridge.rental.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.rental.dao.BookDAO;
import kr.co.warebridge.vo.BookVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookServiceImpl implements BookService {
	
	
	private final BookDAO dao;

	@Override
	public List<BookVO> retrieveBookList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		
		return dao.selectBookList(paging);
	}

	@Override
	public int cancelBook(String bookCode) {
		
		return dao.deleteBook(bookCode);
	}

	@Override
	public int insertBook(BookVO book) {
		return dao.createBook(book);
	}

	@Override
	public int modifyBook(BookVO book) {
		return dao.updateBook(book);
	}

	@Override
	public List<BookVO> checkBook(String BookRental) {
		return dao.BookList(BookRental);
	}

	@Override
	public List<BookVO> retrieveBookList1(String empNo) {
		return dao.userBookList(empNo);
	}

}
