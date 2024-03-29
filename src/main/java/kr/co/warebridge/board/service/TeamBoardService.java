package kr.co.warebridge.board.service;

import java.util.List;

import kr.co.warebridge.board.exception.BoardException;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.AtchmnflVO;
import kr.co.warebridge.vo.TeamBoardVO;

public interface TeamBoardService {
	/**
	 *  글 목록 조회
	 * @param paging
	 * @return
	 */
	public List<TeamBoardVO> retrieveBoardList(PaginationInfo paging);
	
	/**
	 * 글 상세조회
	 * @param tbNo
	 * @return
	 */
	public TeamBoardVO retrieveBoard(int tbNo) throws BoardException;
	
	/**새글 작성
	 * @param cmdObj
	 */
	public void createBoard(TeamBoardVO cmdObj);

	public void modifyBoard(TeamBoardVO board);

	public void removeBoard(TeamBoardVO board);

	public void registerNotice(int tbNo);

	public void unregisterNotice(int tbNo);

	public AtchmnflVO downloadAttatch(int atchNo);

	public void removeAttatch(int atchNo); 
	
	

	
}
