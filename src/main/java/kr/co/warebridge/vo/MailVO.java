package kr.co.warebridge.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "mailCode")
public class MailVO implements Serializable {

	private String url;
	
	@NotBlank
	@Size(max = 10)
	private String mailCode;
	@NotBlank
	@Size(max = 100)
	private String mailSender;
	@NotBlank
	@Size(max = 50)
	private String mailTitle;
	@Size(max = 1000)
	private String mailDetail;
	@NotBlank
	@Size(max = 100)
	private String mailGetter;
	@Size(max = 100)
	private String mailRefer;
	@Size(max = 1)
	private String mailVip;
	@Size(max = 100)
	private String mailNum;
	@Size(max = 11)
	private String mailDate;
	
	private String mailRead;
	
	private List<MailFileVO> filesVO;

	@ToString.Exclude
	@JsonIgnore
	private transient MultipartFile[] attachments;

	public void setAttachments(MultipartFile[] attachment) {

		this.attachments = attachment;
		filesVO = new ArrayList<MailFileVO>();
		for (MultipartFile attach : attachment) {
			MailFileVO mf = new MailFileVO(attach);
			filesVO.add(mf);
		}
	}

}
