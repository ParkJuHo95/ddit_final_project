package kr.co.warebridge.rental.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.BookVO;

@Mapper
public interface BookDAO {
	
public List<BookVO> selectBookList(PaginationInfo paging);

public List<BookVO> userBookList(String empNo);


public int deleteBook(String bookCode);

public int selectTotalRecord(PaginationInfo paging);

public List<BookVO> BookList(String BookRental);


public int updateBook(BookVO book);

public int createBook(BookVO book);


}
