package kr.co.warebridge.excel;

import static org.junit.jupiter.api.Assertions.*;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.inject.Inject;
import javax.validation.Validator;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import kr.co.warebridge.AbstractRootContextTest;
import kr.co.warebridge.employee.service.EmployeeService;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class POIReadTest extends AbstractRootContextTest {
//	@Inject
//	Validator validator;
	
	@Inject
	EmployeeService service;
	
	@Value("file:D:/saveFiles/") //images는 폴더임을 나타내주기 위해 마지막에 슬래쉬 추가
	private Resource fileFolder;
	
	@Test
	void test() throws Exception {
		
		String fileName = "사원계정일괄업로드_샘플.xls";
		Resource sampleFile = fileFolder.createRelative(fileName);
		
		String extension = "xls";
		if (!extension.equals("xlsx") && !extension.equals("xls")) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "엑셀파일을(xls, xlsx) 업로드 해주세요.");
	    }
		Workbook workbook = null;
	    if (extension.equals("xlsx")) {
	      workbook = new XSSFWorkbook(sampleFile.getInputStream());
	    } else if (extension.equals("xls")) {
	      workbook = new HSSFWorkbook(sampleFile.getInputStream());
	    }
	    Sheet worksheet = workbook.getSheetAt(0);
	    
	    Map<String, Object> resultMap = new HashedMap<>();
	    List<EmployeeVO> failedEmpList = new ArrayList<>();
	    
	    int failCnt = 0;
	    int totalCnt = worksheet.getPhysicalNumberOfRows() - 3;
	    resultMap.put("totalCnt", totalCnt);
	    int whichRow = 4;
	    List<Integer> errorRows = new ArrayList<>();
	    ServiceResult result = null;
	    
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

	        String empPass = Optional
	                .ofNullable(row.getCell(2))
	                .map(cell -> String.valueOf(cell.getStringCellValue()))
	                .orElse(null);

	        String empMobile = Optional
	                .ofNullable(row.getCell(3))
	                .map(Cell::getStringCellValue)
	                .orElse(null);

	        String empRrno = Optional
	                .ofNullable(row.getCell(4))
	                .map(cell -> String.valueOf(cell.getStringCellValue()))
	                .orElse(null);
	        
	        EmployeeVO uploadedEmp = new EmployeeVO();;
	        try {
		        uploadedEmp.setEmpCmpId("dreaminfosystem");
		        uploadedEmp.setEmpNo(empNo);
		        uploadedEmp.setEmpName(empName);
		        uploadedEmp.setEmpPass(empPass);
		        uploadedEmp.setEmpMobile(empMobile);
		        uploadedEmp.setEmpRrno(empRrno);
//		        validator.validate(null, null);
	        
	        	result = service.createEmployee(uploadedEmp);
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
	}

}
