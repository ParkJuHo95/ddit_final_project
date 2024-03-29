package kr.co.warebridge.repository.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.apache.commons.net.PrintCommandListener;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.warebridge.employee.dao.EmployeeDAO;
import kr.co.warebridge.repository.FTPVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.dogfoot.hwplib.object.HWPFile;
import kr.dogfoot.hwplib.reader.HWPReader;
import kr.dogfoot.hwplib.tool.textextractor.TextExtractMethod;
import kr.dogfoot.hwplib.tool.textextractor.TextExtractOption;
import kr.dogfoot.hwplib.tool.textextractor.TextExtractor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RepositoryServiceImpl implements RepositoryService{
	
	@Value("#{appInfo.ftpHost}")
    private String server;
    
    @Value("#{appInfo.ftpPort}")
    private int port;
    
    @Value("#{appInfo.ftpUser}")
    private String username;
    
    @Value("#{appInfo.ftpPassword}")
    private String password;
    
    @Value("#{appInfo.tempFolder}")
	private File tempFolder;
	
    private static final String PREFIX = "FTP_";
    
    private FTPClient ftp;
    
    @Inject
    private EmployeeDAO dao;
    
    @PostConstruct
    private void init() throws IOException {
    	ftp = new FTPClient();
		ftp.setControlEncoding("UTF-8");
		ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));
    	ftp.connect(server,port);
    	ftp.login(username, password);
    	ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
    }
    
	@Override
	public List<FTPVO> retrieveList(EmployeeVO user,String who,Map<String,String[]> map) throws IOException {
		String path = "";
		String now = ftp.printWorkingDirectory();

		if (who.equals("D1")){
			path = "/teams/"+user.getEmpDptId1();
		} else if (who.equals("D2")){
			path = "/teams/"+user.getEmpDptId2();
		} else if (who.equals("C")) {
			path = "/company/"+user.getEmpCmpId();
		} else if(who.equals("E")) {
			path = "/individual/"+user.getEmpNo();
		} else {
			path = now;
		}
		
		if(ftp.mlistFile(path) == null) {
			ftp.mkd(path);
		}
		
		ftp.changeWorkingDirectory(path);
		FTPFile[] fileList = ftp.listFiles();
		List<FTPVO> list = getFileList(fileList);
		
		String[] pathList = path.split("/");
		
		map.put("path", pathList);
		return list;
	}

	@Override
	public List<FTPVO> retrieveSelectList(String path,Map<String,String[]> map) throws IOException {
		String now = ftp.printWorkingDirectory();
		String dir = "";
		if(path.equals("sync")) {
			dir = now;
		} else {
			if(path.equals("back")) {
				path = "..";
			}
			if(now == "/") {
				dir = path;
			} else {
				if(path.equals("..")) {
					String[] paths = now.split("/");
					for(int i=0;i<paths.length-1;i++) {
						dir +=paths[i]+"/";
					}
				} else {
					dir = now+"/"+path;
				}
			}
		}
		ftp.changeWorkingDirectory(dir);
		FTPFile[] fileList = ftp.listFiles();
		List<FTPVO> list = getFileList(fileList);
		
		String[] pathList = dir.split("/");
		map.put("path", pathList);
		return list;
	}
	

	@Override
	public boolean createRemoveFolder(String name) throws IOException {
		String folderName = concatPathName(name);
		boolean result = ftp.makeDirectory(folderName);
		return result;
	}

	@Override
	public boolean insertFiles(MultipartFile[] files) throws IOException {
		
		boolean result = true;
		for(MultipartFile file : files) {
			String fileName = concatPathName(file.getOriginalFilename());
			InputStream is = file.getInputStream();
			result = ftp.storeFile(fileName, is);
			if(result == false) {
				return result;
			}
		}
		return result;
	}

	@Override
	public boolean removeFiles(ArrayList<String> files) throws IOException {
		boolean result = true;
		for(String name : files) {
			String pathName = concatPathName(name);
			if(ftp.mlistFile(pathName).isDirectory()) {
				result = removeFilesInFolder(pathName);
			} else {
				result = ftp.deleteFile(pathName);
			}
		}
		return result;
	}
	
	
	@Override
	public Map<String,ByteArrayResource> downloadFile(ArrayList<String> files) throws Exception {
		String now = ftp.printWorkingDirectory();
		String pathName = "";
		Map<String,ByteArrayResource> resources = new HashMap<String, ByteArrayResource>();
		for(String name : files) {
			
			if("/".equals(now)) {
				pathName = now+name;
			} else {
				pathName = now +"/"+name;
			}
			try {
				InputStream is = ftp.retrieveFileStream(pathName);
				byte[] fileByte = IOUtils.toByteArray(is);
				ByteArrayResource resource = new ByteArrayResource(fileByte);
				resources.put(name,resource);
				ftp.completePendingCommand();
			} catch(IOException e) {
				throw new RuntimeException(e);
			} finally {
			}
		}
		return resources;
	}
	
	@Override
	public String retrieveContents(String fileName) throws Exception {
		String now = ftp.printWorkingDirectory(); // 현재주소 포트...?열기
		String pathName = "";
		if("/".equals(now)) {
			pathName = now+fileName;
		} else {
			pathName = now +"/"+fileName;
		}
		
		log.info("pathName===================={}",pathName);
		// 파일명을 마지막 .을 기준으로 분할하여 배열에 저장
		String[] parts = fileName.split("\\.");
		String extension = "";
		String content = "";
        // 배열의 길이가 2 이상이고 마지막 요소가 있는지 확인, 확장자 추출
        if (parts.length >= 2 && !parts[parts.length - 1].isEmpty()) {
           extension = parts[parts.length - 1].toLowerCase();
        }
		try(InputStream is = ftp.retrieveFileStream(pathName)) {
            if ("pdf".equals(extension)) {
    			PDDocument document = PDDocument.load(is);
    			PDFTextStripper pdfStripper = new PDFTextStripper();
    			content = pdfStripper.getText(document);
    			document.close();
            } else if ("txt".equals(extension)) {
    			content = new BufferedReader(new InputStreamReader(is))
    			                      .lines().collect(Collectors.joining("\n"));
            } else if ("hwp".equals(extension)) {
            	 HWPFile hwpFile = HWPReader.fromInputStream(is);
            	 TextExtractOption option = new TextExtractOption();
                 option.setMethod(TextExtractMethod.OnlyMainParagraph);
                 option.setWithControlChar(false);
                 option.setAppendEndingLF(true);
                 content = TextExtractor.extract(hwpFile, option);
            }else {
                log.info("확인할 수 없는 확장자입니다.");
            }
		} catch(IOException e) {
			throw new RuntimeException(e);
		}
		ftp.completePendingCommand(); // dataPort? 닫기
		return content;
	}
	
	
	@Override
	public File downloadZipFile(ArrayList<String> files) throws Exception {
		File tempDir = Files.createTempDirectory(tempFolder.toPath(), PREFIX).toFile();
		
		for(String path : files) {
			String realPath = concatPathName(path);
			FTPFile ftpFile = ftp.mlistFile(realPath);
			
			if(ftpFile==null) {
				throw new IOException(String.format("%s 파일이 없음.", realPath));
			}else {
				saveToTempFolder(realPath, ftpFile, ftp, tempDir);
			}
		}
		
		return tempDir;
	}
	
	
	
	
	
	//============================================================================================
	
	
	public boolean fileSizeCheck(ArrayList<String> files) throws IOException {
		boolean flag = true;
		long totalSize = 0l;
		String now = ftp.printWorkingDirectory();
		String pathName = "";
		for(String name : files) {
			if("/".equals(now)) {
				pathName = now+name;
			} else {
				pathName = now +"/"+name;
			}
			totalSize += ftp.mlistFile(pathName).getSize();
		}
		if(totalSize > 52428799l) flag = false;
		return flag;
	}
	
	private File saveToTempFolder(String path, FTPFile ftpFile, FTPClient ftpClient, File parent) throws Exception{
		
		File newFile = new File(parent, ftpFile.getName());
		newFile.getParentFile().mkdirs();
		
		if(ftpFile.isDirectory()){
			newFile.mkdirs();
			FTPFile[] files = ftpClient.mlistDir(path);
			
			for(FTPFile curFile : files) {
				String curPath = String.format("%s/%s", path, curFile.getName());
				saveToTempFolder(curPath, curFile, ftpClient, newFile);
			}
			
		} else if(ftpFile.isFile()) {
			if(newFile.createNewFile()) {
				try(
					FileOutputStream fos = new FileOutputStream(newFile);	
				){
					ftpClient.retrieveFile(path, fos);			
				}
			}
		} else {
			return null;
		}
		return newFile;
	}
	
	public boolean removeFilesInFolder(String pathName){
		boolean result = true;
		try {
			FTPFile[] files = ftp.listFiles(pathName);
			if(files.length != 0) {
				for(FTPFile file : files) {
					String path = pathName+"/"+file.getName();
					if(file.isDirectory()) {
						result = removeFilesInFolder(path);
					} else {
						result = ftp.deleteFile(path);
					}
				}
			}
			result = ftp.removeDirectory(pathName);
		} catch(IOException e) {
			result = false;
		}
		return result;
	}
	
	
	public String concatPathName(String name) throws IOException {
		String now = ftp.printWorkingDirectory();
		String pathName = "";
		if("/".equals(now)) {
			pathName = now+name;
		} else {
			pathName = now +"/"+name;
		}
		return pathName;
	}
	
	
	public class FolderFirstComparator implements Comparator<FTPVO> {
	    @Override
	    public int compare(FTPVO file1, FTPVO file2) {
	        if (file1.file.isDirectory() && !file2.file.isDirectory()) {
	            return -1;
	        } else if (!file1.file.isDirectory() && file2.file.isDirectory()) {
	            return 1; 
	        } else {
	            return file1.getName().compareToIgnoreCase(file2.getName());
	        }
	    }
	}

	
	public List<FTPVO> getFileList(FTPFile[] fileList){
		List<FTPVO> list = Arrays.stream(fileList)
								.map(f -> new FTPVO(f))
								.collect(Collectors.toList());
		list.sort(new FolderFirstComparator());
		return list;
	}
	
//	public String pathArrange(String path) {
//		String result = "";
//		
//		
//		
//		return result;
//	}
	
}
