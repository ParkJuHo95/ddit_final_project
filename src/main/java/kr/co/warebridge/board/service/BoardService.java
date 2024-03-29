package kr.co.warebridge.board.service;

import java.util.List;

import kr.co.warebridge.board.exception.BoardException;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.AtchmnflVO;
import kr.co.warebridge.vo.CompanyBoardVO;
import kr.co.warebridge.vo.EmployeeVO;

public interface BoardService {
	/**
	 *  글 목록 조회
	 * @param paging
	 * @return
	 */
	public List<CompanyBoardVO> retrieveBoardList(PaginationInfo paging);
	
	/**
	 * 글 상세조회
	 * @param cbNo
	 * @return
	 */
	public CompanyBoardVO retrieveBoard(int cbNo) throws BoardException;
	
	/**새글 작성
	 * @param cmdObj
	 */
	public void createBoard(CompanyBoardVO cmdObj);

	public void modifyBoard(CompanyBoardVO board);

	public void removeBoard(CompanyBoardVO board);

	public void registerNotice(int cbNo);

	public void unregisterNotice(int cbNo);

	public AtchmnflVO downloadAttatch(int atchNo);

	public void removeAttatch(int atchNo); 
	
	public List<CompanyBoardVO> retrieveNoticeList(EmployeeVO realUser);
	

	
}
