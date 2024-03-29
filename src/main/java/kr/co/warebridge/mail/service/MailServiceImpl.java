package kr.co.warebridge.mail.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.mail.dao.MailDAO;
import kr.co.warebridge.vo.MailVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailServiceImpl implements MailService {
	@Inject
	private final MailDAO dao;

	@Override
	public int insertMail(MailVO mail) {
//		0. 첨부파일 아이디 미리 생성
//		1. 메일테이블에 인서트
//		2. 파일테이블에 인서트 
//		3. 파일 저장
		return dao.createMail(mail);
	}

	@Override
	public MailVO showMail(String mailCode) {
		return dao.selectMail(mailCode);
	}

	@Override
	public List<MailVO> retrieveGetMailList(String mailGetter, PaginationInfo paging) {
		paging.addDetailCondition("mailGetter", mailGetter);
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectGetMailList(paging);
	}

	@Override
	public List<MailVO> retrieveSendMailList(String mailSender, PaginationInfo paging) {
		paging.addDetailCondition("mailSender", mailSender);
		int totalRecord = dao.selectTotalSentRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectSendMailList(paging);
	}

	@Override
	public int insertGetMail(MailVO mail) {
		return dao.createGetMail(mail);
	}
	
	@Override
	public int insertSaveMail(MailVO mail) {
		return dao.creatSaveMail(mail);
	}

	@Override
	public List<MailVO> retrieveSaveMailList(String mailSender, PaginationInfo paging) {
		paging.addDetailCondition("mailSender", mailSender);
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectSaveMailList(paging);
	}

	@Override
	public List<MailVO> retrieveVipMailList(String mailGetter, PaginationInfo paging) {
		paging.addDetailCondition("mailGetter", mailGetter);
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectVipMailList(paging);
	}

	@Override
	public List<MailVO> retrieveBinMailList(String mailGetter, PaginationInfo paging) {
		paging.addDetailCondition("mailGetter", mailGetter);
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectBinMailList(paging);
	}

	@Override
	public int mailToBin(String mailCode) {
		
		return dao.goToBin(mailCode);
	}
	
	@Override
	public int outMailToBin(String mailCode) {
		
		return dao.outMailgoToBin(mailCode);
	}

	@Override
	public int mailrollBack(String mailCode) {
		return dao.rollBack(mailCode);
	}
	@Override
	public List<MailVO> retrievegoogleMailList(String mailSender, PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectgoogleMailList(paging);
	}

	@Override
	public List<MailVO> retrievespamMailList(String mailSender, PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectspamMailList(paging);
	}

	@Override
	public int makeVip(String mailCode) {
		return dao.vipMail(mailCode);
	}

	@Override
	public int makeRead(String mailCode) {
		return dao.mailRead(mailCode);
	}

}
