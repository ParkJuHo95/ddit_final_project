package kr.co.warebridge.repository.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.web.multipart.MultipartFile;

import kr.co.warebridge.repository.FTPVO;
import kr.co.warebridge.vo.EmployeeVO;

public interface RepositoryService {
	
	public List<FTPVO> retrieveList(EmployeeVO user,String who,Map<String,String[]> map) throws IOException;
	public List<FTPVO> retrieveSelectList(String path,Map<String,String[]> map) throws IOException;
	public boolean createRemoveFolder(String name) throws IOException;
	public boolean insertFiles(MultipartFile[] files) throws IOException;
	public boolean removeFiles(ArrayList<String> files) throws IOException;
	public Map<String,ByteArrayResource> downloadFile(ArrayList<String> files) throws IOException, Exception;
	public File downloadZipFile(ArrayList<String> files) throws IOException, Exception;
	String retrieveContents(String fileName) throws Exception;
	public boolean fileSizeCheck(ArrayList<String> files) throws IOException;
}
