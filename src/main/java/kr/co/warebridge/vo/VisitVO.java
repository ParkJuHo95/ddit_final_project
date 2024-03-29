package kr.co.warebridge.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of = "visitId")
public class VisitVO implements Serializable{
	private String visitId;
	private LocalDate requestDate;
	private String visitSubject;
	private String visitStatus;
	private String cmpId;
	private String visitContents;
	private LocalDateTime visitDat;
	private String visitAnswer;
	private String visitAnswerWriter;
	private LocalDate visitAnswerDat;
}
