package kr.co.warebridge.certificate.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.warebridge.vo.CertificateVO;
import kr.co.warebridge.vo.EmployeeVO;

@Mapper
public interface CertificateDAO {
	
	public List<Map<String, String>> selectCer(EmployeeVO user);
	
	public int insertEmpCer(@Param("bb") EmployeeVO user, @Param("aa") String cer);
	
	
	public int insertCer(String cer);
	
	public Map<String, String> checkDuplicaion(String cer);
}
