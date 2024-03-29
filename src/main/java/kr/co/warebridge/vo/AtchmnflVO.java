package kr.co.warebridge.vo;

import java.io.Serializable;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of= {"atchNo"})
@NoArgsConstructor
public class AtchmnflVO implements Serializable{
	@ToStringExclude
	@JsonIgnore
	private transient MultipartFile boFile;
	
	public AtchmnflVO(MultipartFile boFile) {
		super();
		this.boFile = boFile;
		atchName = boFile.getOriginalFilename();
		atchSavename = UUID.randomUUID().toString();
		atchMime = boFile.getContentType();
		atchSize = boFile.getSize();
		atchFancysize = FileUtils.byteCountToDisplaySize(atchSize);
	}
	private Integer atchNo;
	private Integer atchCbNo;
	private Integer atchTbNo;
	private String atchDptId;
	private String atchCmpId;
	private String atchName;
	private String atchPath;
	private long atchSize;
	private String atchExtension;
	private String atchSavename;
	private String atchFancysize;
	private Integer atchDownload;
	private String atchMime;

	
}
