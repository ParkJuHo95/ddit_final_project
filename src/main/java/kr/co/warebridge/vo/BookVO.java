package kr.co.warebridge.vo;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "bookCode")
public class BookVO implements Serializable{
	@Size(max=50) 
	private String bookCode;
	@Size(max=10) 
	private String bookRental;
	@Size(max=50) 
	private String empNo;
	@Size(max=11) 
	private String bookDate;
	@Size(max=100) 
	private String bookDetail;
	@Size(max=30) 
	private String empCmpId;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime bookStart;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime bookEnd;
	
	private String strBookStart;
	private String strBookEnd;
	public String getStrBookStart() {
		if(bookStart!=null) {
			strBookStart = bookStart.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
		}
		return strBookStart;
	}
	public String getStrBookEnd() {
		if(bookStart!=null) {
			strBookEnd = bookStart.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
		}
		return strBookEnd;
	}
	
	private String carName;
	private String roomName;
	private String equipName;
	
}
