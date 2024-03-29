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
@EqualsAndHashCode(of= {"cbNo"})
public class CompanyBoardVO implements Serializable{
	private Integer cbNo;
	private String cbName;
	private String cbContent;
	private String cbPath;
	private String cbEmpNo;
	private LocalDateTime cbDat;
	private Integer cbViews;
	private Integer cbLikes;
	private String cbNotice;
	private String cbCmpId;
	
	private String empName;
	
	private String empJobposition;
	
	private int cbSeq;
	
	private int recnt;

	private List<AtchmnflVO> attatchList;
	
	@ToString.Exclude
	@JsonIgnore
	private transient MultipartFile[] boFiles;
}
