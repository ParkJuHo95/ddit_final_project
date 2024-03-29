package kr.co.warebridge.vo.schedule;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ScheduleVO implements Serializable, Cloneable {
	private String scheduleId;
	private String scheduleName;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime scheduleStartDat;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime scheduleEndDat;
	private String scheduleContents;
	private String scheduleType;
	private String alarmAlternative;
	private String scheduleParticipant;
	private String empNo;
	private String empDpt;
	private String empCmpId;
	private String repetitionId;
	
	
	private Long repetitionTerm;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate repetitionEndDate;
}
