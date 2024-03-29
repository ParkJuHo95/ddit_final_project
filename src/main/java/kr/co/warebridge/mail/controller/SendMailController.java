package kr.co.warebridge.mail.controller;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.warebridge.mail.service.FileService;
import kr.co.warebridge.mail.service.MailService;
import kr.co.warebridge.mail.service.NvrService;
import kr.co.warebridge.mail.trans.Trans;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.MailVO;
import kr.co.warebridge.vo.NvrVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class SendMailController {

	@Inject
	private MailService service;

	@Inject
	private FileService fService;
	
	@Inject
	private Trans trs;
	
	@Inject
	private NvrService gService;

	@GetMapping("mail/sendMail")
	public String show(MailVO mail) {
		return "user/mail/sendMail";
	}

	@PostMapping("mail/sendMail")
	public String send(@RealUser EmployeeVO realUser, MailVO mail, Model model,
			@RequestParam("attachment") MultipartFile[] files) throws IOException {
		String userMail = realUser.getEmpMail();
		//mail.setMailGetter(mail.getMailSender());
		mail.setMailSender(userMail);
//		1. 메일 인서트
//		2. 메일 코드 파일VO 에 넣기
//		3. 이진데이터 저장 파일 테이블 인서트
		service.insertMail(mail);
		service.insertGetMail(mail);
		mail.setAttachments(files);
		fService.uploadFile(mail);
		return "user/mail/sendMail";
	}
	@PostMapping("mail/saveSendMail")
	public String saveSend(@RealUser EmployeeVO realUser, MailVO mail, Model model,
			@RequestParam("attachment") MultipartFile[] files) throws IOException {
		String userMail = realUser.getEmpMail();
		//mail.setMailGetter(mail.getMailSender());
		mail.setMailSender(userMail);
//		1. 메일 인서트
//		2. 메일 코드 파일VO 에 넣기
//		3. 이진데이터 저장 파일 테이블 인서트
		service.insertSaveMail(mail);
		mail.setAttachments(files);
		fService.uploadFile(mail);
		return "user/mail/sendMail";
	}
	@PostMapping("mail/replyMail")
	public String reply(@RealUser EmployeeVO realUser, MailVO mail, Model model,
			@RequestParam("attachment") MultipartFile[] files) throws IOException {
		mail.setMailGetter(mail.getMailSender());
		String userMail = realUser.getEmpMail();
		mail.setMailSender(userMail);
//		1. 메일 인서트
//		2. 메일 코드 파일VO 에 넣기
//		3. 이진데이터 저장 파일 테이블 인서트
		service.insertMail(mail);
		service.insertGetMail(mail);
		mail.setAttachments(files);
		fService.uploadFile(mail);
		return "user/mail/sendMail";
	}

	@PostMapping(value="mail/transMail", produces = "application/json;charset=UTF-8")
	public String transMail(String text,String lg,Model model) {
		log.info("==========text:{}, lg:{}", text, lg);
		String mailTrans = trs.trans(text,lg);
		model.addAttribute("mt",mailTrans);
		return "jsonView";
	}
	@GetMapping("mail/sendMail/nvr")
	public String showGoogle(@ModelAttribute("nvr") NvrVO nvr, Model model) {
		model.addAttribute("nvr", nvr);
		return "user/mail/sendNvrMail";
	}
	
	@PostMapping("mail/sendMail/nvr")
	public String sendGoogle(
			@ModelAttribute("nvr") NvrVO nvr, Model model) {
		gService.createNvr(nvr);
		return "user/mail/sendNvrMail";
	}
}
