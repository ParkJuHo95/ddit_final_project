package kr.co.warebridge.mail.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.MailFileVO;

@Mapper
public interface MailFileDAO {
	
	public int insertFile(MailFileVO file);
	
	
	public MailFileVO downFile(String mailCode);
	
	
	public String showFile(String fileName);

}
