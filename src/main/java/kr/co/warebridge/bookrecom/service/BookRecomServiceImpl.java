package kr.co.warebridge.bookrecom.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.bookrecom.dao.BookRecomDAO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BookRecomServiceImpl implements BookRecomService{
	@Inject
	private BookRecomDAO brDAO;

	@Override
	public List<Map<String, String>> retrieveBookrecomList(EmployeeVO user) {
		return brDAO.selectBookRecom(user);
	}

	@Override
	public int createBook(Map<String, String> value) {
		return 0;
	}
	
	


}
