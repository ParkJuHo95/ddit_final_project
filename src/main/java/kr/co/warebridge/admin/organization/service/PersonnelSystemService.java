package kr.co.warebridge.admin.organization.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.DepartmentVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.PersonnelSystemVO;

public interface PersonnelSystemService {
	
	public List<PersonnelSystemVO> retriveJobrankList(String prsCmpId);
	public PersonnelSystemVO retrieveJobrank(String prsCode, String prsCmpId);
	public ServiceResult createJobrank(PersonnelSystemVO jobrank);
	public ServiceResult modifyJobrank(PersonnelSystemVO jobrank);
	public ServiceResult removeJobrank(PersonnelSystemVO jobrank);

	public List<PersonnelSystemVO> retriveJobpositionList(String prsCmpId);
	public PersonnelSystemVO retrieveJobposition(String prsCode, String prsCmpId);
	public ServiceResult createJobposition(PersonnelSystemVO jobposition);
	public ServiceResult modifyJobposition(PersonnelSystemVO jobposition);
	public ServiceResult removeJobposition(PersonnelSystemVO jobposition);
	public Map<String, Object> createBulkPersonnelSystem(EmployeeVO realUser, MultipartFile excelFile);
}
