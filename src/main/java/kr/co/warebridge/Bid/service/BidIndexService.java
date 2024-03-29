package kr.co.warebridge.Bid.service;

import java.util.List;

import kr.co.warebridge.vo.BidhstryVO;
import kr.co.warebridge.vo.BidinfoVO;
import kr.co.warebridge.vo.BidrcmdVO;

public interface BidIndexService {
	
	/**
	 * input 회사ID를 가지고 회사 industry, cptl을 불러옴 > bidrcmd에서 bidNo 받음 > 
	 * @return List<BidinfoVO> 회사ID에 해당하는 bidInfoList를 가져옴
	 */
	public List<BidrcmdVO> retrieveBidrcmdList(String cmpId);
	
	/**
	 * 공고를 클릭할 때 클릭한 history가 저장됨
	 * @return 
	 */
	public int createBidhsrty(BidhstryVO bidhstry);
	
	/**
	 * 등록되어있는 전체 Bidinfo를 List로 받아옴
	 * @return
	 */
	public List<BidinfoVO> retrieveBidinfoList();
	
}
