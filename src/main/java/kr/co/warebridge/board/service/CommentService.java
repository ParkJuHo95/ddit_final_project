package kr.co.warebridge.board.service;

import java.util.List;

import kr.co.warebridge.vo.CommentVO;

public interface CommentService {
	
	public List<CommentVO> retrieveCommentList(int cmpCbNo);
	
	public void createComment(CommentVO vo);
	
	public List<CommentVO> retrieveCommentList2(int cmpTbNo);
	

	
}
