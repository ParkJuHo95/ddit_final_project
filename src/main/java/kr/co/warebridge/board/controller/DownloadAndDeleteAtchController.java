package kr.co.warebridge.board.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Collections;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;

import kr.co.warebridge.board.service.BoardService;
import kr.co.warebridge.vo.AtchmnflVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class DownloadAndDeleteAtchController {
	@Inject
	private BoardService service;
	@Value("#{appInfo.boPath}")
	private Resource boPath;
	
	@GetMapping("/user/board/company/download/{atchNo}")
	public ResponseEntity<Resource> download(@PathVariable int atchNo) throws IOException {
		AtchmnflVO atch = service.downloadAttatch(atchNo);
		log.info("\n\n\n== 1 ==\n\n\n");
		String saveName = atch.getAtchSavename();
		log.info("\n\n\n== 2 ==\n\n\n");
		Resource saveFile = boPath.createRelative(saveName);
		log.info("\n\n\n== 3 ==\n\n\n");
		if(!saveFile.exists())
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, String.format("%s 파일을 찾을 수 없음.", atch.getAtchName()));
		
		log.info("\n\n\n== 4 ==\n\n\n");
		HttpHeaders headers = new HttpHeaders();
		log.info("\n\n\n== 5 ==\n\n\n");
		headers.setContentLength(atch.getAtchSize());
//		Content-Disposition: attachment; filename="filename.jpg"
		log.info("\n\n\n== 6 ==\n\n\n");
		ContentDisposition disposition = ContentDisposition.attachment()
											.filename(atch.getAtchName(), Charset.forName("UTF-8"))
											.build();
		log.info("\n\n\n== 7 ==\n\n\n");
		headers.setContentDisposition(disposition);
		log.info("\n\n\n== 8 ==\n\n\n");
		return ResponseEntity.ok()
						.headers(headers)
						.body(saveFile);
	}
	
	@DeleteMapping("/user/board/company/atch/{atchNo}")
	@ResponseBody
	public Map<String, Object> deleteAttatch(@PathVariable int atchNo) {
		service.removeAttatch(atchNo);
		return Collections.singletonMap("success", true);
	}
}
















