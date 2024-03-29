package kr.co.warebridge.certificate.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.certificate.dao.CertificateDAO;
import kr.co.warebridge.vo.CertificateVO;
import kr.co.warebridge.vo.EmployeeVO;

@Service
public class CertificateServiceImpl implements CertificateService{
	
	@Inject
	private CertificateDAO dao;
	
	@Override
	public List<Map<String, String>> retrieveCer(EmployeeVO user) {
		return dao.selectCer(user);
	}

	@Override
	public int insertEmpCer(EmployeeVO user, String cer) {
		Map<String, String> check = dao.checkDuplicaion(cer);
		if(check == null) {
			dao.insertCer(cer);
		}
		dao.insertEmpCer(user, cer);
		return 0;
	}
}
