package kr.co.warebridge.admin.organization.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.PersonnelSystemVO;

@Mapper
public interface PersonnelSyetemDAO {
	public int insertJobrank(PersonnelSystemVO jobrank);
	public PersonnelSystemVO selectJobrank(@Param("prsCode") String prsCode, @Param("prsCmpId") String prsCmpId);
	public List<PersonnelSystemVO> selectJobrankList(String prsCmpId);
	public int updateJobrank(PersonnelSystemVO jobrank);
	public int deleteJobrank(PersonnelSystemVO jobrank);

	public int insertJobposition(PersonnelSystemVO jobposition);
	public PersonnelSystemVO selectJobposition(@Param("prsCode") String prsCode, @Param("prsCmpId") String prsCmpId);
	public List<PersonnelSystemVO> selectJobpositionList(String prsCmpId);
	public int updateJobposition(PersonnelSystemVO jobposition);
	public int deleteJobposition(PersonnelSystemVO jobposition);
}
