package kr.co.warebridge.mybatis.mappers;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.TeamBoardVO;
@Mapper
public interface TeamBoardMapper extends AbstractCommonMapper<TeamBoardVO, Integer>{
	public void boardView(int tbNo);
}
