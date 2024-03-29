package kr.co.warebridge.rental.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.BookVO;

@Service
public interface BookService {
	
	public List<BookVO> retrieveBookList(PaginationInfo paging);
	public List<BookVO> retrieveBookList1(String empNo);
	
	public int cancelBook(String bookCode);
	
	public int insertBook(BookVO book);
	
	public int modifyBook(BookVO book);
	
	public List<BookVO> checkBook(String BookRental);

}
