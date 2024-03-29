package kr.co.warebridge.admin.organization.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.record.pivottable.PageItemRecord;
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

import kr.co.warebridge.admin.organization.dao.DepartmentSystemDAO;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.company.dao.CompanyDAO;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.vo.CompanyVO;
import kr.co.warebridge.vo.DepartmentVO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class DepertmentSystemServiceImpl implements DepartmentSystemService {

	private final DepartmentSystemDAO dao;
	
	private final CompanyDAO cmpDao;
	
	@Override
	public List<DepartmentVO> retrieveDepartmentList(PaginationInfo paging) {
		return dao.selectList(paging);
	}
	
	
	@Override
	public List<DepartmentVO> retrieveDepartmentTree(PaginationInfo paging){
		return dao.selectTreeList(paging);
	}

	@Override
	public DepartmentVO retrieveDepartment(DepartmentVO dpt) {
		return dao.selectOne(dpt);
	}

	@Override
	public ServiceResult createDepartment(DepartmentVO dpt) {
		ServiceResult result = null;
		if(dao.selectOne(dpt)==null) {
			result = dao.insert(dpt) > 0? ServiceResult.OK : ServiceResult.FAIL;
		}else {
			result = ServiceResult.PKDUPLICATED;
		}
		return result;
	}

	@Override
	public ServiceResult modifyDepartment(DepartmentVO dpt) {
		int cnt = dao.update(dpt);
		return cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeDepartment(DepartmentVO dpt) {
		int cnt = dao.delete(dpt);
		return cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	
	
	public Map<String, Object> createBulkDepartment(EmployeeVO realUser, MultipartFile uploadedfile) throws IOException {
		ServiceResult result = null;
		
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
	    List<DepartmentVO> failedDptList = new ArrayList<>();
	    
	    int failCnt = 0;
	    int totalCnt = worksheet.getPhysicalNumberOfRows() - 3;
	    resultMap.put("totalCnt", totalCnt);
	    int whichRow = 4;
	    List<Integer> errorRows = new ArrayList<>();
	    
	    for (int i = 3; i < worksheet.getPhysicalNumberOfRows(); i++) { 

	        Row row = worksheet.getRow(i);
	        
	        String dptId = Optional
	                .ofNullable(row.getCell(0))
	                .map(Cell::getStringCellValue)
	                .orElse(null);

	        String dptName = Optional
	                .ofNullable(row.getCell(1))
	                .map(Cell::getStringCellValue)
	                .orElse(null);

	        String parentDptId = Optional
	                .ofNullable(row.getCell(2))
	                .map(Cell::getStringCellValue)
	                .orElse(null);

	        String dptHead = Optional
	                .ofNullable(row.getCell(3))
	                .map(Cell::getStringCellValue)
	                .orElse(null);

	        String dptOffice = Optional
	        		.ofNullable(row.getCell(3))
	        		.map(Cell::getStringCellValue)
	        		.orElse(null);
	        
	        DepartmentVO uploadedDpt = new DepartmentVO();;
	        try {
	        	uploadedDpt.setDptCmpId(realUser.getEmpCmpId());
	        	uploadedDpt.setDptId(dptId);
	        	uploadedDpt.setDptName(dptName);
	        	uploadedDpt.setDptParentdptid(parentDptId);
	        	uploadedDpt.setDptHead(dptHead);
	        	uploadedDpt.setDptOffice(dptOffice);
//		        validator.validate(null, null);
	        
	        	result = createDepartment(uploadedDpt);
	        } catch(DataAccessException e) {
	        	result = ServiceResult.FAIL;
    			failedDptList.add(uploadedDpt);
	        	failCnt++;
	        	errorRows.add(whichRow);
	        }
	        whichRow++;
	    }
	    resultMap.put("failedDptList", failedDptList);
	    resultMap.put("failCnt", failCnt);
	    resultMap.put("successCnt", totalCnt - failCnt);
	    resultMap.put("errorRows", errorRows);
	    log.info("resultMap : {}", resultMap);
	    
		return resultMap;
	}




}
