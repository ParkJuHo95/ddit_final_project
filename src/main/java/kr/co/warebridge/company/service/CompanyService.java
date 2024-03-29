package kr.co.warebridge.company.service;

import java.util.List;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.CompanyVO;

public interface CompanyService {

	public CompanyVO retrieveCompany(String cmpId);
	public int selectTotalRecord(PaginationInfo paging);
	public ServiceResult modifyCompany(CompanyVO company);
	
	//초기 비밀번호 변경
	public int modifyInitialPw(CompanyVO company);
	
	
	//최초사내관리자 비밀번호 변경
	public int modifyAdminPw(CompanyVO company);
	
	public List<CompanyVO> retrieveCompanyList(PaginationInfo paging);
	
	public int removeCompany(String cmpId);
	
	public int createCompany(CompanyVO company);
}
