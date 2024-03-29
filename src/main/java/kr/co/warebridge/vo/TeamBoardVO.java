package kr.co.warebridge.vo;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of= {"tbNo"})
public class TeamBoardVO implements Serializable{
	private Integer tbNo;
	private String tbName;
	private String tbContent;
	private String tbPath;
	private String tbEmpNo;
	private LocalDateTime tbDat;
	private Integer tbViews;
	private String tbNotice;
	private String tbDptId;
	private String empName;
	private String empJobposition;
	
	private int tbSeq;
	
	private int recnt;

	private List<AtchmnflVO> attatchList;
	
	@ToString.Exclude
	@JsonIgnore
	private transient MultipartFile[] boFiles;
}
