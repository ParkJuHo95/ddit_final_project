package kr.co.warebridge.repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;

import org.apache.commons.io.FileUtils;
import org.apache.commons.net.ftp.FTPFile;

import lombok.Data;

@Data
public class FTPVO extends FTPFile{
	public FTPFile file;
	private String viewSize;
	private String name;
	private String extension;
	private LocalDate time;
	private Long fileSize;
	private int type;
	
	public FTPVO(FTPFile file) {
		this.file = file;
		this.time = LocalDateTime.ofInstant(file.getTimestampInstant(), ZoneId.systemDefault()).toLocalDate();
		this.type = file.getType();
		this.name = file.getName();
		this.fileSize = file.getSize();
		String name = file.getName();
		if(name.contains(".")) {
			String[] nm = name.split("\\.");
			this.extension = nm[nm.length-1];
			this.name = name.replace("."+this.extension,"");
		}else {
			this.name = file.getName();
			this.extension =  "폴더";
		}
	}
	
	public Object getViewSize() {
		Long size = file.getSize();
		this.viewSize = FileUtils.byteCountToDisplaySize(size);
		return viewSize;
	}
	
}
