package kr.co.warebridge.admin.organization.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import kr.co.warebridge.admin.organization.dao.PersonnelSyetemDAO;
import kr.co.warebridge.common.exception.PKNotFoundException;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.DepartmentVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.PersonnelSystemVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class PersonnelSystemServiceImpl implements PersonnelSystemService{

	private final PersonnelSyetemDAO dao;
	
	@Override
	public List<PersonnelSystemVO> retriveJobrankList(String prsCmpId) {
		return dao.selectJobrankList(prsCmpId);
	}

	@Override
	public PersonnelSystemVO retrieveJobrank(String prsCode, String prsCmpId) {
		PersonnelSystemVO jobrank = dao.selectJobrank(prsCode, prsCmpId);
		if(jobrank == null)
			throw new PKNotFoundException(String.format("%s 코드에 해당하는 직위 없음", prsCode));
		return jobrank;
	}

	@Override
	public ServiceResult createJobrank(PersonnelSystemVO jobrank) {
		ServiceResult result = null;
		if(dao.selectJobrank(jobrank.getPrsCode(), jobrank.getPrsCmpId())==null) {
			result = dao.insertJobrank(jobrank) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}else {
			result = ServiceResult.PKDUPLICATED;
		}
		return result;
	}

	@Override
	public ServiceResult modifyJobrank(PersonnelSystemVO jobrank) {
		int cnt = dao.updateJobrank(jobrank);
		return cnt > 0 ?  ServiceResult.OK : ServiceResult.FAIL	;
	}

	@Override
	public List<PersonnelSystemVO> retriveJobpositionList(String prsCmpId) {
		return dao.selectJobpositionList(prsCmpId);
	}

	@Override
	public PersonnelSystemVO retrieveJobposition(String prsCode, String prsCmpId) {
		PersonnelSystemVO jobposition = dao.selectJobposition(prsCode, prsCmpId);
		if (jobposition==null)
			throw new PKNotFoundException(String.format("%s 코드에 해당하는 직책 없음", prsCode));
		return jobposition;
	}

	@Override
	public ServiceResult createJobposition(PersonnelSystemVO jobposition) {
		ServiceResult result = null;
		if(dao.selectJobposition(jobposition.getPrsCode(), jobposition.getPrsCmpId())==null) {
			result = dao.insertJobposition(jobposition) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}else {
			result = ServiceResult.PKDUPLICATED;
		}
		return result;
	}

	@Override
	public ServiceResult modifyJobposition(PersonnelSystemVO jobposition) {
		int cnt = dao.updateJobposition(jobposition);
		return cnt > 0 ?  ServiceResult.OK : ServiceResult.FAIL	;
	}

	@Override
	public ServiceResult removeJobrank(PersonnelSystemVO jobrank) {
		int cnt = dao.deleteJobrank(jobrank);
		return cnt > 0 ?  ServiceResult.OK : ServiceResult.FAIL	;
	}

	@Override
	public ServiceResult removeJobposition(PersonnelSystemVO jobposition) {
		int cnt = dao.deleteJobposition(jobposition);
		return cnt > 0 ?  ServiceResult.OK : ServiceResult.FAIL	;
	}

	@Override
	public Map<String, Object> createBulkPersonnelSystem(EmployeeVO realUser, MultipartFile uploadedfile) {
		ServiceResult result = null;
//		
//		String extension = FilenameUtils.getExtension(uploadedfile.getOriginalFilename()); //파일명에서 확장자 추출
//		
//		if (!extension.equals("xlsx") && !extension.equals("xls")) {
//			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "엑셀파일을(xls, xlsx) 업로드 해주세요.");
//	    }
//		Workbook workbook = null;
//	    if (extension.equals("xlsx")) {
//	      workbook = new XSSFWorkbook(uploadedfile.getInputStream());
//	    } else if (extension.equals("xls")) {
//	      workbook = new HSSFWorkbook(uploadedfile.getInputStream());
//	    }
//	    Sheet worksheet = workbook.getSheetAt(0);
//	    
	    Map<String, Object> resultMap = new HashedMap<>();
//	    List<PersonnelSystemVO> failedPsList = new ArrayList<>();
//	    
//	    int failCnt = 0;
//	    int totalCnt = worksheet.getPhysicalNumberOfRows() - 3;
//	    resultMap.put("totalCnt", totalCnt);
//	    int whichRow = 4;
//	    List<Integer> errorRows = new ArrayList<>();
//	    
//	    for (int i = 3; i < worksheet.getPhysicalNumberOfRows(); i++) { 
//
//	        Row row = worksheet.getRow(i);
//	        
//	        String dptId = Optional
//	                .ofNullable(row.getCell(0))
//	                .map(Cell::getStringCellValue)
//	                .orElse(null);
//
//	        String dptName = Optional
//	                .ofNullable(row.getCell(1))
//	                .map(Cell::getStringCellValue)
//	                .orElse(null);
//
//	        String parentDptId = Optional
//	                .ofNullable(row.getCell(2))
//	                .map(Cell::getStringCellValue)
//	                .orElse(null);
//
//	        String dptHead = Optional
//	                .ofNullable(row.getCell(3))
//	                .map(Cell::getStringCellValue)
//	                .orElse(null);
//
//	        String dptOffice = Optional
//	        		.ofNullable(row.getCell(3))
//	        		.map(Cell::getStringCellValue)
//	        		.orElse(null);
//	        
//	        PersonnelSystemVO uploadedPs = new PersonnelSystemVO();;
//	        try {
//	        
//	        	result = createJobPosition(uploadedPs);
//	        } catch(DataAccessException e) {
//	        	result = ServiceResult.FAIL;
//	        	failedPsList.add(uploadedPs);
//	        	failCnt++;
//	        	errorRows.add(whichRow);
//	        }
//	        whichRow++;
//	    }
//	    resultMap.put("failedPsList", failedPsList);
//	    resultMap.put("failCnt", failCnt);
//	    resultMap.put("successCnt", totalCnt - failCnt);
//	    resultMap.put("errorRows", errorRows);
//	    log.info("resultMap : {}", resultMap);
//	    
		return resultMap;
	}

	
}
