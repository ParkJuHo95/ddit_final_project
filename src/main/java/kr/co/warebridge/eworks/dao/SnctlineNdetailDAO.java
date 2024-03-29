package kr.co.warebridge.eworks.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.SnctdetailVO;
import kr.co.warebridge.vo.SnctlineVO;

@Mapper
public interface SnctlineNdetailDAO {

	public int insertDetail(SnctdetailVO snctdetail);
	
	public int insertLine(SnctlineVO snctline);
	
	/**
	 * @param snctlineVO : slId로 가져옴
	 * @return SnctlineVO : lineId, List<SnctdetailVO>를 가진 SnctlineVO
	 * 
	 * snctDocument에 lineVO가 있으니 필요없을듯...?
	 */
//	public SnctlineVO selectLine(String slId);
	
	
	/**
	 * @param 해당 사용자의 Snctlines 조회
	 * @return List<SnctlineVO> 해당 사용자가 사용했던 SnctlineVO List
	 * 
	 * 처음 문서를 작성할 때 Snctdocument에 UsedSnctlines와 Snctform을 각각 담아준다
	 */
	public List<SnctlineVO> selectUsedSnctlines(String slEmpNo);
}
