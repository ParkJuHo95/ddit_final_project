package kr.co.warebridge.mail.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.MailVO;


@Mapper
public interface MailDAO {
	
	public List<MailVO> selectSendMailList(PaginationInfo page);
	
	public List<MailVO> selectGetMailList(PaginationInfo page);

	public List<MailVO> selectSaveMailList(PaginationInfo page);
	
	public List<MailVO> selectVipMailList(PaginationInfo page);
	
	public List<MailVO> selectBinMailList(PaginationInfo page);
	
	public List<MailVO> selectgoogleMailList(PaginationInfo page);
	
	public List<MailVO> selectspamMailList(PaginationInfo page);
	
	public int selectMailCnt(PaginationInfo page);
	
	public int selectTotalRecord(PaginationInfo page);

	public int selectTotalSentRecord(PaginationInfo page);
	
	public MailVO selectMail(String MailCode);
	
	public MailVO selectGetMail(String MailCode);
	
	public int createGetMail(MailVO mail);
	
	public int createMail(MailVO mail);
	
	public int goToBin(String mailCode);
	
	public int rollBack(String mailCode);
	
	public int outMailgoToBin(String mailCode);
	
	public int creatSaveMail(MailVO mail);
	
	public int vipMail(String mailCode);
	
	public int mailRead(String mailCode);

}
