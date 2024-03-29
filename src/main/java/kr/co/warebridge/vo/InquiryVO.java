package kr.co.warebridge.vo;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of = "inqryId")
public class InquiryVO implements Serializable {
	
	private String inqryId;
	private String cmpId;
	private LocalDate inqryDat;
	private String inqrySubject;
	private String inqryContents;
	private String errorAt;
	private String inqryAnswer;
	private LocalDate inqryAnswerDat;
	private String inqryAnswerWriter;
	
}
