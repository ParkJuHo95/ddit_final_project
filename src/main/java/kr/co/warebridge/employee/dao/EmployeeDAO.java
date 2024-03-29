package kr.co.warebridge.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.CompanyVO;
import kr.co.warebridge.vo.EmployeeVO;


@Mapper
public interface EmployeeDAO {
	
	/**
	 * 사원의 마이페이지 조회
	 * @param empNo 조회할 회원의 아이디
	 * @param empCmpId 조회할 회원의 회사아이디
	 * @return 존재하지 않는 경우, null 반환.
	 */
	public EmployeeVO selectEmployee(String empNo);
	
	/**
	 * totalRecord/totalPage 를 결정하기 위한 쿼리
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);
	
	/**
	 * 사원의 마이페이지 수정
	 * @param employee
	 * @return 수정된 레코드수 > 0 ? 성공
	 */
	public int updateEmployee(EmployeeVO employee);
	
	public int updateEmpPassword(EmployeeVO employee);
	
	public EmployeeVO selectEmployeeForLogin(String empNo);
	
	/**
	 * @param empCmpId 조회할 회사 Id
	 * @return
	 */
	public List<EmployeeVO> selectEmployeeList(PaginationInfo paging);
	
//	public int deleteEmployee(String empNo);
	
	public int insertEmployee(EmployeeVO employee);
	
	public List<String> selectEmpNoByTeam(String dtpId);
	public List<String> selectEmpNoByCompany(String cmpId);
}
