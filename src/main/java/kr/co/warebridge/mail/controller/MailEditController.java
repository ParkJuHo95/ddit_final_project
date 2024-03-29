package kr.co.warebridge.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MailEditController {
	
	@GetMapping
	public String editMail (Model mode) {
		
		return "user/mail/mailEdit";
	}
	

}
