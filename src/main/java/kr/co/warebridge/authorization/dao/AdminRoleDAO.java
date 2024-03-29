package kr.co.warebridge.authorization.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.AdminVO;
import kr.co.warebridge.vo.EmployeeVO;

@Mapper
public interface AdminRoleDAO {

	public int selectTotalRecord(PaginationInfo paging);
	public List<AdminVO> selectAdminList(PaginationInfo paging);
	public int insertAdmin(AdminVO admin);
	public int updateAdmin(EmployeeVO employee);
}
