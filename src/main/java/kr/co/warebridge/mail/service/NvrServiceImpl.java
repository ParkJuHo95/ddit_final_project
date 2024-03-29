package kr.co.warebridge.mail.service;

import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.mail.dao.NvrDAO;
import kr.co.warebridge.vo.NvrVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class NvrServiceImpl implements NvrService {
	@Inject
	private final NvrDAO dao;

	@Override
	public NvrVO showNvr(String nvrCode) {
		return dao.selectNvr(nvrCode);
	}

	@Override
	public List<NvrVO> retrieveNvrList(PaginationInfo paging) {
		return dao.selectNvrList(paging);
	}

	@Override
	public int createNvr(NvrVO google) {
		final String username = google.getNvrMail(); // 보내는 사람 이메일
		final String password = google.getNvrPass(); // 보내는 사람 이메일 비밀번호
		String recvEmail = google.getNvrGetter(); // 받는사람
		String sendEmail = username;

		String smtpName = "smtp.naver.com";
		int smtpPort = 587;
		String text = google.getNvrText();
		String subject = google.getNvrTitle();

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", smtpName);
		props.put("mail.smtp.port", smtpPort);

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(sendEmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recvEmail));
			message.setSubject(subject);
			message.setText(text);

			Transport.send(message);

			log.info("=============message : {}", message.toString());

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		return dao.insertNvr(google);
	}

}
