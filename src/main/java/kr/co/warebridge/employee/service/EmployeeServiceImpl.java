package kr.co.warebridge.employee.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UncheckedIOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.net.MalformedServerReplyException;
import org.apache.commons.net.PrintCommandListener;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.pool2.ObjectPool;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import kr.co.warebridge.common.exception.PKNotFoundException;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.company.dao.CompanyDAO;
import kr.co.warebridge.employee.dao.EmployeeDAO;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.CompanyVO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmployeeServiceImpl implements EmployeeService {

	
	@Inject
	@Named("ftpSystemPool")
	private ObjectPool<FTPClient> ftpClientPool;
	
	@Inject
	EmployeeDAO dao;
	@Inject
	CompanyDAO cmpDao;
	
//	@Value("#{appInfo.ftpHost}")
//    private String server;
//    
//    @Value("#{appInfo.ftpPort}")
//    private int port;
    
    @Value("#{appInfo.ftpSystemFolder}")
    private String username;
    
//    @Value("#{appInfo.ftpPassword}")
//    private String password;
    
    @Value("#{appInfo.tempFolder}")
	private File tempFolder;
    
    @Value("#{appInfo.employeeFolder}")
    private String saveFolder;
	
    private static final String PREFIX = "FTP_";
    
//    private FTPClient ftp;
    
//    @PostConstruct
//    private void init() throws IOException {
//    	ftp = new FTPClient();
//		ftp.setControlEncoding("UTF-8");
//		ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));
//    	ftp.connect(server,port);
//    	ftp.login(username, password);
//    	ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
//    }
	
	
	@Override
	public EmployeeVO retrieveEmployee(String empNo) throws Exception {
		EmployeeVO employee = dao.selectEmployee(empNo);
		if(employee==null) {
			throw new PKNotFoundException(String.format("%s 에 해당하는 사원+_ 없음.", empNo));
		} else {
			base64(employee);
		}
		return employee;
	}
	
	
	@Override
	public ServiceResult modifyEmployee(EmployeeVO employee) throws Exception {
		ServiceResult result = dao.updateEmployee(employee) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		if(result == ServiceResult.OK) {
			processProfileImage(employee);//이진데이터 DB에 저장
		}
		return result;
	}

	@Override
	public List<EmployeeVO> retriveEmployeeList(PaginationInfo paging) {
		if(paging.getCurrentPage()>0) {
			int totalRecord = dao.selectTotalRecord(paging);
			paging.setTotalRecord(totalRecord);
		}
		return dao.selectEmployeeList(paging);
	}

	@Override
	public ServiceResult createEmployee(EmployeeVO employee) throws Exception {
		ServiceResult result = null;
		if(dao.selectEmployee(employee.getEmpNo())==null) { //무결성 검사
			result = dao.insertEmployee(employee) > 0? ServiceResult.OK : ServiceResult.FAIL;
		}else {
			result = ServiceResult.PKDUPLICATED;
		}
		if(result == ServiceResult.OK) {
			processProfileImage(employee);
		}
		return result;
	}
	
	
	//POI 이용한 사원 일괄 등록
	@Override
	public Map<String, Object> createBulkEmployee(EmployeeVO realUser, MultipartFile uploadedfile) throws Exception {
		ServiceResult result = null;
		CompanyVO cmp = new CompanyVO();
		cmp = cmpDao.selectCompany(realUser.getEmpCmpId());
		String extension = FilenameUtils.getExtension(uploadedfile.getOriginalFilename()); //파일명에서 확장자 추출
		
		if (!extension.equals("xlsx") && !extension.equals("xls")) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "엑셀파일을(xls, xlsx) 업로드 해주세요.");
	    }
		Workbook workbook = null;
	    if (extension.equals("xlsx")) {
	      workbook = new XSSFWorkbook(uploadedfile.getInputStream());
	    } else if (extension.equals("xls")) {
	      workbook = new HSSFWorkbook(uploadedfile.getInputStream());
	    }
	    Sheet worksheet = workbook.getSheetAt(0);
	    
	    Map<String, Object> resultMap = new HashedMap<>();
	    List<EmployeeVO> failedEmpList = new ArrayList<>();
	    
	    int failCnt = 0;
	    int totalCnt = worksheet.getPhysicalNumberOfRows() - 3;
	    resultMap.put("totalCnt", totalCnt);
	    int whichRow = 4;
	    List<Integer> errorRows = new ArrayList<>();
	    
	    for (int i = 3; i < worksheet.getPhysicalNumberOfRows(); i++) { 

	        Row row = worksheet.getRow(i);
	        
	        String empNo = Optional
	                .ofNullable(row.getCell(0))
	                .map(Cell::getStringCellValue)
	                .orElse(null);

	        String empName = Optional
	                .ofNullable(row.getCell(1))
	                .map(Cell::getStringCellValue)
	                .orElse(null);

//	        String empPass = Optional
//	                .ofNullable(row.getCell(2))
//	                .map(cell -> String.valueOf(cell.getStringCellValue()))
//	                .orElse(null);

	        String empMobile = Optional
	                .ofNullable(row.getCell(2))
	                .map(Cell::getStringCellValue)
	                .orElse(null);

	        String empRrno = Optional
	                .ofNullable(row.getCell(3))
	                .map(cell -> String.valueOf(cell.getStringCellValue()))
	                .orElse(null);
	        
	        EmployeeVO uploadedEmp = new EmployeeVO();;
	        try {
	        	uploadedEmp.setEmpCmpId(realUser.getEmpCmpId());
		        uploadedEmp.setEmpPass(cmp.getCmpInitPass());
		        uploadedEmp.setEmpNo(empNo);
		        uploadedEmp.setEmpName(empName);
//		        uploadedEmp.setEmpPass(empPass);
		        uploadedEmp.setEmpMobile(empMobile);
		        uploadedEmp.setEmpRrno(empRrno);
//		        validator.validate(null, null);
	        
	        	result = createEmployee(uploadedEmp);
	        } catch(DataAccessException e) {
	        	result = ServiceResult.FAIL;
    			failedEmpList.add(uploadedEmp);
	        	failCnt++;
	        	errorRows.add(whichRow);
	        }
	        whichRow++;
	    }
	    resultMap.put("failedEmpList", failedEmpList);
	    resultMap.put("failCnt", failCnt);
	    resultMap.put("successCnt", totalCnt - failCnt);
	    resultMap.put("errorRows", errorRows);
	    log.info("resultMap : {}", resultMap);
	    
		return resultMap;
	}

//	@Override
//	public ServiceResult removeEmployee(EmployeeVO employee) {
//		int cnt = dao.deleteEmployee(employee);
//		return cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
//	}
	@Override
	public ServiceResult modifyEmpPassword(EmployeeVO employee) {
		ServiceResult result  = dao.updateEmpPassword(employee)  > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}
	
	
	/**
	 * 상품 등록이나 수정시 업로드된 상품 이미지인 이진데이터 저장
	 * @throws Exception 
	 */
	@Override
	public void processProfileImage(EmployeeVO employee) throws Exception {
		FTPClient ftp = ftpClientPool.borrowObject();
		MultipartFile profileImage = employee.getProfileFile();
		if(profileImage == null) {
			return;
		}
		
		try {
			String pathName = saveFolder+employee.getEmpPicpath();
			InputStream is = profileImage.getInputStream();
			boolean result = ftp.storeFile(pathName, is);
			if(result) {
				base64(employee);
			}
			is.close();
//			ftp.completePendingCommand();
		} catch (IOException e) {
			throw new UncheckedIOException(e);
		}
		ftpClientPool.returnObject(ftp);
	}
	
	@Override
	public void base64(EmployeeVO employee) throws Exception {
		FTPClient ftp = ftpClientPool.borrowObject();
		if(employee.getEmpPicpath() != null) {
			String pathName = saveFolder+employee.getEmpPicpath();
			InputStream is = null;
			try {
				is = ftp.retrieveFileStream(pathName); //이미지파일 읽기
				byte[] fileByte = IOUtils.toByteArray(is);	//읽은 이미지파일을 바이트배열화
				String base64 = Base64.getEncoder().encodeToString(fileByte);//바이트배열을 base64 스트링으로 변환
				employee.setBase64(base64);
			} catch (MalformedServerReplyException a) {
			} catch (NullPointerException k) {
				log.info("이미지 파일이 존재하지 않습니다.");
			} catch (IOException e) {
			} finally {
				try {
					is.close();
					ftp.completePendingCommand();
				} catch (Exception e) {
				}
			}
		}
		ftpClientPool.returnObject(ftp);
//		if(employee.getEmpPicpath() != null) {
//			String pathName = saveFolder+employee.getEmpPicpath();
//			try {
//				InputStream is = null;
//				byte[] fileByte = null;
//				try {
//					is = ftp.retrieveFileStream(pathName); //이미지파일 읽기
//					fileByte = IOUtils.toByteArray(is);	//읽은 이미지파일을 바이트배열화
//				} catch(NullPointerException k ) {
//					if(is != null) is.close();
//					return;
//				} catch(MalformedServerReplyException a) {
//					if(is != null) is.close();
//					return;
//				}
//				String base64 = Base64.getEncoder().encodeToString(fileByte);//바이트배열을 base64 스트링으로 변환
//				employee.setBase64(base64);
//				is.close();
//				ftp.completePendingCommand();
//			} catch (IOException e) {
//				try {
//					ftp.completePendingCommand();
//				} catch (IOException e1) {
//					e1.printStackTrace();
//				}
//				e.printStackTrace();
//			}
//		}
	}

	@Override
	public void Arraybase64(List<EmployeeVO> employees) throws Exception {
		for(EmployeeVO employee : employees) {
			base64(employee);
		}
	}
		


	
}
