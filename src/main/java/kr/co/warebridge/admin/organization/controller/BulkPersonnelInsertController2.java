package kr.co.warebridge.admin.organization.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import kr.co.warebridge.admin.organization.service.DepartmentSystemService;
import kr.co.warebridge.admin.organization.service.PersonnelSystemService;
import kr.co.warebridge.employee.service.EmployeeService;
import kr.co.warebridge.enumpkg.ServiceResult;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;

@Controller
@RequestMapping("/admin/organization/bulkPersonnelSystem")
public class BulkPersonnelInsertController2 {
	
	@GetMapping
	protected String bulkDepartmentUI() {
		return "admin/organization/bulkPersonnelSystem";
	}
	
	@Inject
	PersonnelSystemService service;
	
	@Value("#{appInfo.formatFiles}")
	private Resource fileFolder;
	
	@GetMapping("downloadSample")
	public ResponseEntity<Resource> downloadSample() throws IOException {
//		Content-Disposition: attachment; filename="filename.jpg"
		String fileName = "직위일괄설정_샘플.xls";
		Resource sampleFile = fileFolder.createRelative(fileName); //주소 : fileFolder + fileName
		
		if(!sampleFile.exists()) {
			//원래같으면 resp.sendError() 이거나, 커스텀 예외를 만들어서 내보냈었음
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, String.format("%s 파일을 찾을 수 없음", fileName));
		}
		
		//@ResponseBody대신에 ResponseEntity객체를 쓰는 이유는 response의 line, header, body를 커스터마이즈 하기 위함
		HttpHeaders headers = new HttpHeaders();
		headers.setContentLength(sampleFile.contentLength());
		
		//inline 구조인지 attachment 구조인지를 설정하기 위해 ContentDisposition 객체 이용
		ContentDisposition disposition = ContentDisposition.attachment() //ContentDisposition은 디폴트로 inline이여서 브라우저에 보여주기만 하고, 우리가 attachment로 설정하면 첨부파일형태가 됨
						.filename(fileName, Charset.forName("utf-8"))
						.build();
		headers.setContentDisposition(disposition);
		
		return ResponseEntity.ok()
					.headers(headers)
					.body(sampleFile);
	}
	
	
	@PostMapping
	@ResponseBody
	public Map<String, Object> processUploadedExcel(
			 @RealUser EmployeeVO realUser
			,@RequestBody MultipartFile excelFile
			,Model model
	) throws IOException {
		
		Map<String, Object> resultMap = service.createBulkPersonnelSystem(realUser, excelFile);
		return resultMap;
	}
}
