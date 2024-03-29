package kr.co.warebridge.admin.organization.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.DepartmentVO;
import kr.co.warebridge.vo.EmployeeVO;

public interface DepartmentSystemService {
	public List<DepartmentVO> retrieveDepartmentList(PaginationInfo paging);
	public List<DepartmentVO> retrieveDepartmentTree(PaginationInfo paging);
	public DepartmentVO retrieveDepartment(DepartmentVO dpt);
	public ServiceResult createDepartment(DepartmentVO dpt);
	public ServiceResult modifyDepartment(DepartmentVO dpt);
	public ServiceResult removeDepartment(DepartmentVO dpt);
	
	public Map<String, Object> createBulkDepartment(EmployeeVO employee, MultipartFile uploadedfile) throws IOException;

}
