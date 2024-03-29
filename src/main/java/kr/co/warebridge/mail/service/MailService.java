package kr.co.warebridge.mail.service;

import java.util.List;


import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.MailVO;

public interface MailService {

public List<MailVO> retrieveGetMailList(String mailGetter,PaginationInfo paging);

public List<MailVO> retrieveSendMailList(String mailSender,PaginationInfo paging);

public List<MailVO> retrieveSaveMailList(String mailSender,PaginationInfo paging);

public List<MailVO> retrieveVipMailList(String mailGetter,PaginationInfo paging);

public List<MailVO> retrieveBinMailList(String mailGetter,PaginationInfo paging);

public List<MailVO> retrievegoogleMailList(String mailSender,PaginationInfo paging);

public List<MailVO> retrievespamMailList(String mailSender,PaginationInfo paging);

	
public int insertMail(MailVO mail);

public int insertGetMail(MailVO mail);

public int insertSaveMail(MailVO mail);
	
public MailVO showMail(String mailCode);

public int mailToBin(String mailCode);

public int mailrollBack(String mailCode);

public int outMailToBin(String mailCode);

public int makeVip(String mailCode);

public int makeRead(String mailCode);
	
}
