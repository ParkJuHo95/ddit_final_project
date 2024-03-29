package kr.co.warebridge.authorization.service;

import java.util.List;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.AdminVO;
import kr.co.warebridge.vo.EmployeeVO;

public interface AdminRoleService {
	public List<AdminVO> retrieveAdminList(PaginationInfo paging);
	public int createAdmin(AdminVO admin);
}
