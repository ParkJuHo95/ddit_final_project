package kr.co.warebridge.repository.controller;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import kr.co.warebridge.calendar.service.CalendarService;
import kr.co.warebridge.employee.dao.EmployeeDAO;
import kr.co.warebridge.repository.CompressUtils;
import kr.co.warebridge.repository.FTPVO;
import kr.co.warebridge.repository.service.RepositoryService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/repository")
public class RepositoryController {
	
	@Inject
	private RepositoryService service;
	
	@Inject
	private CalendarService Cservice;
	
	@Inject
	private EmployeeDAO dao;
	
	@GetMapping
	public String list(
		Model model,
		@RealUser EmployeeVO realUser,
		@RequestParam(value = "who", required = false, defaultValue = "N") String who,
		HttpServletRequest req
	) throws IOException {
		HttpSession session = req.getSession();
		Map<String,String[]> map = new HashMap<String, String[]>();
		EmployeeVO user = dao.selectEmployee(realUser.getEmpNo());
		List<FTPVO> list = service.retrieveList(user,who,map);
		List<String> dptList = Cservice.selectDPTName(user);
		model.addAttribute("list",list);
		model.addAttribute("dptList",dptList);
//		model.addAttribute("who",who);
		session.setAttribute("who",who);
		model.addAttribute("map",map);
		return "user/repository/repository";
	}
	
	@GetMapping("{folder}")
	public String selectList1(
		@RealUser EmployeeVO realUser,
		@PathVariable String folder,
		Model model
	) throws IOException {
		Map<String,String[]> map = new HashMap<String, String[]>();
		EmployeeVO user = dao.selectEmployee(realUser.getEmpNo());
		List<String> dptList = Cservice.selectDPTName(user);
		model.addAttribute("dptList",dptList);
		List<FTPVO> list = service.retrieveSelectList(folder,map);
		model.addAttribute("list",list);
		model.addAttribute("map",map);
		return "user/repository/repository";
	}

//	@GetMapping("{folder}")
//	public String selectList2(
//			Model model
//			) throws IOException {
//		String folder = "sync";
//		Map<String,String> map = new HashMap<String, String>();
//		List<FTPVO> list = service.retrieveSelectList(folder,map);
//		model.addAttribute("list",list);
//		model.addAttribute("map",map);
//		return "user/repository/repository";
//	}
	
	@PostMapping("makeFolder")
	@ResponseBody
	public void updown(
		@RequestBody HashMap<String,String> map,
		Model model
	) throws IOException {
		String name = map.get("name");
		boolean result = service.createRemoveFolder(name);
		model.addAttribute("result",result);
	}
	
	@PostMapping("fileUp")
	@ResponseBody
	public void fileUp(
		@RequestParam("files") MultipartFile[] files,
		Model model
	) throws IOException {
		boolean result = service.insertFiles(files);
		model.addAttribute("result",result);
	}

	@PostMapping("fileDown")
	public ResponseEntity<MultiValueMap<String, HttpEntity<?>>> fileDown(
			@RequestBody HashMap<String,Object> map,
			Model model
			) throws Exception {
		
		MultiValueMap<String, HttpEntity<?>> mixData = new LinkedMultiValueMap<>();
		
		ArrayList<String> files = (ArrayList<String>) map.get("files");
		boolean flag = service.fileSizeCheck(files);
		if(!flag) {
			
			HttpHeaders headers = new HttpHeaders();
			URI uri = new URI("/WareBridge/user/repository/zipDown");
			return ResponseEntity.status(225)
								.contentType(MediaType.MULTIPART_FORM_DATA)
								.body(mixData);
		}
		
		Map<String,ByteArrayResource> resources = service.downloadFile(files);
		

		String namebase = "part";
		int idx = 1;
		
		for(String name : files) {
			ByteArrayResource resource = resources.get(name);
			HttpHeaders headers = new HttpHeaders();
//			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			ContentDisposition disposition = ContentDisposition.formData()
						.name(namebase+idx++)
					.filename(name)
					.build();
			headers.setContentDisposition(disposition);
			HttpEntity<Resource> entity = new HttpEntity<>(resources.get(name), headers);
			
			mixData.add(namebase, entity);
		};
		
//			mixData.add("test", new HttpEntity(Collections.singletonMap("prop", "값")));
		
		return  ResponseEntity.ok()
				.contentType(MediaType.MULTIPART_FORM_DATA)
				.body(mixData);
	}
	

	@PostMapping("zipDown")
	public ResponseEntity<StreamingResponseBody> zipDown(
			@RequestBody HashMap<String,Object> map,
			Model model
			) throws Exception {
		ArrayList<String> files = (ArrayList<String>) map.get("files");
		File dir = service.downloadZipFile(files);
		return CompressUtils.compressAndGenerateResponseEntity(dir);
	}
	
	
	
	@PostMapping("remove")
	@ResponseBody
	public void remove(
		@RequestBody HashMap<String,Object> map,
		Model model
	) throws IOException {
		ArrayList<String> files = (ArrayList<String>) map.get("files");
		boolean result = service.removeFiles(files);
	}
	
	

}
