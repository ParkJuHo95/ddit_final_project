package kr.co.warebridge.mail.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.NvrVO;

@Service
public interface NvrService {
	
	public NvrVO showNvr(String nvrCode);
	
	public List<NvrVO> retrieveNvrList(PaginationInfo page);

	public int createNvr(NvrVO nvr); 
}
