package kr.co.warebridge.employee.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.EmployeeVO;

public interface EmployeeService {
	/**
	 * 사원의 마이페이지 조회
	 * @param empNo 조회할 회원의 아이디
	 * @param empCmpId 조회할 회원의 회사아이디
	 * @return 존재하지 않는 경우, null 반환.
	 * @throws Exception 
	 * @throws IOException 
	 */
	public EmployeeVO retrieveEmployee(@Param("empNo") String empNo) throws Exception;
	
	/**
	 * 사원의 마이페이지 수정
	 * @param employee
	 * @return 성공 시 ServiceResult.OK : 실패 시 ServiceResult.FAIL
	 * @throws Exception 
	 */
	public ServiceResult modifyEmployee(EmployeeVO employee) throws Exception;
	
	public ServiceResult modifyEmpPassword(EmployeeVO employee);
	
	/**
	 * cmpId로 조회해서 
	 * @param PaginationInfo // empCmpId, 부서....
	 * @return
	 */
	public List<EmployeeVO> retriveEmployeeList(PaginationInfo paging);

	public ServiceResult createEmployee(EmployeeVO employee) throws Exception;
	
	public Map<String, Object> createBulkEmployee(EmployeeVO employee, MultipartFile uploadedfile) throws IOException, Exception;
	
	public void processProfileImage(EmployeeVO employee) throws Exception;
	
	public void base64(EmployeeVO employee) throws Exception;

	public void Arraybase64(List<EmployeeVO> employees) throws Exception;
	
	

//	public ServiceResult removeEmployee(EmployeeVO employee);
}
