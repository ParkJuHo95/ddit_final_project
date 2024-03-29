package kr.co.warebridge.news.service;

import org.springframework.stereotype.Service;

import kr.co.warebridge.news.dao.NewsDAO;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.NewsVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class NewsServiceImpl implements NewsService {

	private final NewsDAO newsDao;

	@Override
	public NewsVO retrieveNews(@RealUser EmployeeVO emp) {
		try {
			
			
			String address = emp.getEmpAddr();
			String gen = emp.getEmpGen();
			String rrno = emp.getEmpRrno();
	
			String addr = address.substring(0, 2);
			log.info("addr{}",addr);
			String[][] adds = { { "서울", "0" }, { "인천", "1" }, { "강원", "2" }, { "충청", "3" }, { "전라", "4" }, { "경상", "5" },
					{ "대전", "6" }, { "광주", "7" }, { "울산", "8" }, { "부산", "9" }, { "대구", "10" }, { "제주", "11" } };
			
			for (String[] add : adds) {
				if (addr.equals(add[0])) {
					addr = add[1];
					break;
				}
			}
			log.info("addr2{}",addr);
			int birth = Integer.parseInt(rrno.substring(0, 2));
			String age ="";
			if (birth > 96) {
				age = "0";
			} else if (birth > 86) {
				age = "1";
			} else if (birth > 76) {
				age = "2";
			} else {
				age = "3";
			}
	
			String gender = "";
			if (gen.contains("M")) {
				gender = "0";
			} else {
				gender = "1";
			}
			
			return newsDao.selectNews(addr, age, gender);
		} catch (NullPointerException e) {
			return null;
		}
	}

}
