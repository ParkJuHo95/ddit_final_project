package kr.co.warebridge.Bid.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.BidhstryVO;
import kr.co.warebridge.vo.BidinfoVO;
import kr.co.warebridge.vo.BidrcmdVO;
import kr.co.warebridge.vo.CompanyVO;

@Mapper
public interface BidDAO {

	public CompanyVO selectCmpInfo(String cmpId);

	public List<BidrcmdVO> selectBidrcmdList(CompanyVO company);
	
	public List<BidinfoVO> selectBidinfoList();
	
	public int insertBidhstry(BidhstryVO bidhisrty);
	
	
}
