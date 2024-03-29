package kr.co.warebridge.company.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.CompanyVO;

@Mapper
public interface CompanyDAO {

	public CompanyVO selectCompany(String cmpId);
	public int selectTotalRecord(PaginationInfo paging);
	public int updateCompany(CompanyVO company);
	
	//초기 비밀번호 변경
	public int updateInitialPw(CompanyVO company);
	
	
	//최초사내관리자 비밀번호 변경
	public int updateAdminPw(CompanyVO company);
	
	public List<CompanyVO> selectCompanyList(PaginationInfo paging);
	
	public int deleteCompany(String cmpId);
	
	public int insertCompany(CompanyVO company);
	
}
