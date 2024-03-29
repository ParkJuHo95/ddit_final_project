package kr.co.warebridge.company.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.common.exception.PKNotFoundException;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.company.dao.CompanyDAO;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.CompanyVO;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Inject
	CompanyDAO dao;
	
	@Override
	public CompanyVO retrieveCompany(String cmpId) {
		CompanyVO company = dao.selectCompany(cmpId);
		if(company == null) {
			throw new PKNotFoundException(String.format("%s 에 해당하는 사원 없음.", cmpId));
		}
		return company;
	}

	@Override
	public int selectTotalRecord(PaginationInfo paging) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ServiceResult modifyCompany(CompanyVO company) {
		ServiceResult result = dao.updateCompany(company) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public int modifyInitialPw(CompanyVO company) {
		return dao.updateInitialPw(company);
	}

	@Override
	public int modifyAdminPw(CompanyVO company) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CompanyVO> retrieveCompanyList(PaginationInfo paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int removeCompany(String cmpId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int createCompany(CompanyVO company) {
		// TODO Auto-generated method stub
		return 0;
	}

}
