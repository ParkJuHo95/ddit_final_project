package kr.co.warebridge.repository.controller;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import kr.co.warebridge.repository.service.RepositoryService;
import kr.co.warebridge.repository.service.RepositoryServiceImpl;
import lombok.extern.slf4j.Slf4j;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

@Slf4j
@RequestMapping("/user/repository")
@Controller
public class RepositorySummaryController {

	@Value("#{appInfo.openaiApiKey}")
	String apiKey;
	
	@Value("#{appInfo.endpoint}")
	String endpoint;
	
	@Inject
	private RepositoryService service;
	
	@PostMapping(value="summerize") //경로변수에 모든 문자가 들어갈 수 있음을 표시하는 정규표현식...
	public String summerize(
			@RequestBody String fileNamePath,
			Model model
			) throws Exception {
		
		log.info("파일이름 ~~ : {}", fileNamePath);
		String content = service.retrieveContents(fileNamePath) + "이 문서가 어떤 내용을 다루고 있는지 알려주고 내용 요약 한국어로 해줘.";
		
		log.info("===========문서내용 : {}",content);
		// 요청 본문 설정
		Map<String, Object> requestBody = new HashMap<>();
		requestBody.put("model", "gpt-3.5-turbo");
		Map<String, Object> message = new HashMap<>();
		message.put("role", "user");
		message.put("content", content); // 요약할 text 추가
		List<Map<String, Object>> messages = new ArrayList<>();
		messages.add(message);
		requestBody.put("messages", Collections.singletonList(message));
		requestBody.put("temperature", 0.5);
		requestBody.put("max_tokens", 256);
		
		// HTTP 요청 보내기
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth(apiKey);
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);
		try {
			ResponseEntity<String> responseEntity = restTemplate.exchange(endpoint, HttpMethod.POST, requestEntity, String.class);
			if (responseEntity.getStatusCode() == HttpStatus.OK) {
			    log.info(responseEntity.getBody()); // jsonView로 보내야함
			    model.addAttribute("summary", responseEntity.getBody());
			} else {
				log.info("HTTP 요청이 실패했습니다. 상태 코드: " + responseEntity.getStatusCodeValue());
			    model.addAttribute("errorCode", responseEntity.getStatusCodeValue());
			}
		}catch (HttpClientErrorException e) {
		    // 요청이 실패했을 때의 처리
		    String errorMessage = e.getResponseBodyAsString();
		    // 에러 메시지를 사용하여 원하는 동작을 수행
		    model.addAttribute("errorMessage", errorMessage);
		}
		
		return "jsonView";
	}
}
