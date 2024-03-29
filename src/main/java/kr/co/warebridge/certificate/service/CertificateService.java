package kr.co.warebridge.certificate.service;

import java.util.List;
import java.util.Map;

import kr.co.warebridge.vo.CertificateVO;
import kr.co.warebridge.vo.EmployeeVO;

public interface CertificateService {
	public List<Map<String, String>> retrieveCer(EmployeeVO user);
	
	public int insertEmpCer(EmployeeVO user, String cer);
}
