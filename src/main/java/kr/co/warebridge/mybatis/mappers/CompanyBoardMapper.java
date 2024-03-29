package kr.co.warebridge.mybatis.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.CompanyBoardVO;
import kr.co.warebridge.vo.EmployeeVO;
@Mapper
public interface CompanyBoardMapper extends AbstractCommonMapper<CompanyBoardVO, Integer>{
	public void boardView(int cbNo);
	
	public List<CompanyBoardVO> selectNoticeList(EmployeeVO realUser);
}
