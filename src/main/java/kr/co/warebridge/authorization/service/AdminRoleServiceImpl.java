package kr.co.warebridge.authorization.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.authorization.dao.AdminRoleDAO;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.employee.dao.EmployeeDAO;
import kr.co.warebridge.vo.AdminVO;
import kr.co.warebridge.vo.EmployeeVO;

@Service
public class AdminRoleServiceImpl implements AdminRoleService {

	@Inject
	AdminRoleDAO dao;
	@Inject
	EmployeeDAO empDao;

	@Override
	public List<AdminVO> retrieveAdminList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectAdminList(paging);
	}

	@Override
	public int createAdmin(AdminVO admin) {
		EmployeeVO employee = empDao.selectEmployee(admin.getAdmTo());
		int cnt = 0;
		if( dao.insertAdmin(admin) > 0 && dao.updateAdmin(employee) > 0) {
			
			return cnt = 1;
		}else {
			return  cnt = 0;
		}
	}



}
