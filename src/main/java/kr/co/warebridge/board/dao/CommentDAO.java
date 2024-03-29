package kr.co.warebridge.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.CommentVO;

@Mapper
public interface CommentDAO{
	
	public List<CommentVO> selectList(int cmpCbNo);
	
	public List<CommentVO> selectList2(int cmpTbNo);
	
	public int insertComment(CommentVO vo);

}
