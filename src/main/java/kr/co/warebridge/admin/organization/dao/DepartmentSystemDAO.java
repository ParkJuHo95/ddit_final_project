package kr.co.warebridge.admin.organization.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.DepartmentVO;
@Mapper
public interface DepartmentSystemDAO {

	public int insert(DepartmentVO dpt);
	public DepartmentVO selectOne(DepartmentVO dpt);
	public List<DepartmentVO> selectList(PaginationInfo paging);
	public int update(DepartmentVO dpt);
	public int delete(DepartmentVO dpt);
	public List<DepartmentVO> selectTreeList(PaginationInfo paging);
	
	public List<DepartmentVO> selectLineTreeList(PaginationInfo paging);
	
}
