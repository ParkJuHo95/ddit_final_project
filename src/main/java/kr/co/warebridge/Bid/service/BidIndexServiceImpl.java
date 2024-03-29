package kr.co.warebridge.Bid.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.warebridge.Bid.dao.BidDAO;
import kr.co.warebridge.company.dao.CompanyDAO;
import kr.co.warebridge.vo.BidhstryVO;
import kr.co.warebridge.vo.BidinfoVO;
import kr.co.warebridge.vo.BidrcmdVO;
import kr.co.warebridge.vo.CompanyVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class BidIndexServiceImpl implements BidIndexService {

	private final BidDAO bidDao;

	private final CompanyDAO cmpDao;
	
	@Override
	public List<BidinfoVO> retrieveBidinfoList() {
		
		return bidDao.selectBidinfoList();
	}

	@Override
	public int createBidhsrty(BidhstryVO bidhstry) {
		
		String cmpId = bidhstry.getBhCmpId();
		log.info("==========bidhstry cmpId======== : {}", cmpId);
		CompanyVO cmp = bidDao.selectCmpInfo(cmpId);
		bidhstry.setBhCmpIndustry(cmp.getCmpIndustry()); 
		log.info("==========BhCmpIndustry======== : {}", cmp.getCmpIndustry());
		bidhstry.setBhCmpCptl(cmp.getCmpCptl().toString()); 
		log.info("==========BhCmpCptl======== : {}", cmp.getCmpCptl().toString());
		return bidDao.insertBidhstry(bidhstry);
		
	}

	@Override
	public List<BidrcmdVO> retrieveBidrcmdList(String cmpId) {
		
		CompanyVO company = bidDao.selectCmpInfo(cmpId);
		return bidDao.selectBidrcmdList(company);
		
	}


}
