package kr.co.warebridge.mail.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.MailVO;

@Mapper
public interface MailReceiverDAO {
     
public List<MailVO> selectSendMailList(PaginationInfo page);
	
	public List<MailVO> selectGetMailList(PaginationInfo page);
	
	public int selectTotalRecord(PaginationInfo page);
	
	public MailVO selectMail(String MailCode);
	
	public int updateMail(MailVO mail);
	
	public int deleteMail(String MailCode);
	
	public int createMail(MailVO mail);
}
