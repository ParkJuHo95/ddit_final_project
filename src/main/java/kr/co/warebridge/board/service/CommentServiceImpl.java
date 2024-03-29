package kr.co.warebridge.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.board.dao.CommentDAO;
import kr.co.warebridge.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Inject
	CommentDAO dao;

	@Override
	public List<CommentVO> retrieveCommentList(int cmpCbNo) {
		return dao.selectList(cmpCbNo);
	}
	
	@Override
	public List<CommentVO> retrieveCommentList2(int cmpTbNo) {
		return dao.selectList(cmpTbNo);
	}

	@Override
	public void createComment(CommentVO vo) {
		dao.insertComment(vo);
	}
}
