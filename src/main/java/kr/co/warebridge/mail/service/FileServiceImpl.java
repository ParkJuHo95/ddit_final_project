package kr.co.warebridge.mail.service;

import java.io.File;
import java.io.IOException;
import java.io.UncheckedIOException;
import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.warebridge.mail.dao.MailDAO;
import kr.co.warebridge.mail.dao.MailFileDAO;
import kr.co.warebridge.vo.MailFileVO;
import kr.co.warebridge.vo.MailVO;

@Service
public class FileServiceImpl implements FileService {
	@Inject
	private MailFileDAO dao;
	
	@Value("#{appInfo.mailfileFolder}")
	private Resource mailPath;

	@PostConstruct
	public void init() throws IOException {
		mailPath.getFile().mkdirs();
	}
//  1. file VO list 꺼내기
//	2. 반복문으로 리스트에서 데이터 꺼내기
//	3.멀티파트 파일
	public void uploadFile(MailVO mail) {
		MultipartFile[] mFiles = mail.getAttachments();
		
		if (mFiles == null) return;
		
		for (MultipartFile mFile : mFiles) {
			
			if (mFile.isEmpty()) continue;
			
			MailFileVO mf = new MailFileVO(mFile);
			
			mf.setFileOutname(mFile.getOriginalFilename());
			mf.setMailCode(mail.getMailCode());
			mf.setFilePath(mailPath.toString());
			dao.insertFile(mf);
			
			String saveName = mf.getFileName();
			try {
				File saveFile = mailPath.createRelative(saveName).getFile();
				FileUtils.copyInputStreamToFile(mFile.getInputStream(), saveFile);
			}catch (IOException e) {
				throw new UncheckedIOException(e);
			}
		}
	}
	@Override
	public String selectFileName(String fileOutname) {
		return dao.showFile(fileOutname);
		
	}
	@Override
	public MailFileVO downloadFile(String fileName) {
		return null;
	}
}















