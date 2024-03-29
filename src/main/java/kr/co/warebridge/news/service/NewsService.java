package kr.co.warebridge.news.service;

import org.springframework.stereotype.Service;

import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.NewsVO;

@Service
public interface NewsService {

	
	public NewsVO retrieveNews(EmployeeVO emp);
}
