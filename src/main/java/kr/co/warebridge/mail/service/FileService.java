package kr.co.warebridge.mail.service;

import java.io.IOException;

import kr.co.warebridge.vo.MailFileVO;
import kr.co.warebridge.vo.MailVO;

public interface FileService {
	//public void uploadFile(MailVO mail, MultipartHttpServletRequest multiRequest);
	 
	 public void uploadFile(MailVO mail) throws IOException;
	 
	 public MailFileVO downloadFile(String fileName);
	 
	 public String selectFileName(String fileName);
}
