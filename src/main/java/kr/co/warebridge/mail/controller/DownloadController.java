package kr.co.warebridge.mail.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import kr.co.warebridge.mail.service.FileService;
import kr.co.warebridge.vo.MailFileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DownloadController {
    @Inject
    private FileService service; //파일 서비스

    @Value("#{appInfo.mailfileFolder}")
    private Resource mailPath;

    @GetMapping("/mail/download/{fileName}")
    public ResponseEntity<Resource> fileDownload(@PathVariable String fileName) throws IOException {
        String savedName = fileName;
        Resource saveFile = mailPath.createRelative(savedName);
        log.info("==================파일다운 : {}", saveFile.getFilename());

        if (!saveFile.exists()) {
            // 파일을 찾을 수 없음 예외 처리
            return ResponseEntity.notFound().build();
        }
        String origin = service.selectFileName(fileName);
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDisposition(ContentDisposition.builder("attachment").filename(origin, StandardCharsets.UTF_8).build());
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        return ResponseEntity.ok().headers(headers).body(saveFile);
    }
}
