package kr.co.warebridge.vo;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BookDataVO implements Serializable{
	private String bdAuthor;
	private String bdYear;
	private Integer bdId;
	private String bdName;
}
