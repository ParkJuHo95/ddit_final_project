package kr.co.warebridge.department.service;

import java.util.List;

import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.DepartmentVO;

public interface DeptService {

	public List<DepartmentVO> retriveDeptList();
	
	public DepartmentVO retrieveDept(String dptId, String dptCmpId);
	
	public ServiceResult createDept(DepartmentVO dept);

	public ServiceResult modifyDept(DepartmentVO dept);
	
}
