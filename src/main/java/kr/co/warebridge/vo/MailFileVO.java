package kr.co.warebridge.vo;

import java.io.Serializable;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MailFileVO implements Serializable {
	private MultipartFile attachment;

	private String fileName;
	private String filePath;
	private String mailCode;
	private String fileOutname;

	public MailFileVO(MultipartFile attachment) {
		super();
		this.attachment = attachment;
		this.fileName = UUID.randomUUID().toString();
	}

}
