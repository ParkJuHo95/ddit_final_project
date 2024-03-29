package kr.co.warebridge.Bid.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.warebridge.Bid.service.BidIndexService;
import kr.co.warebridge.vo.BidhstryVO;
import kr.co.warebridge.vo.BidinfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/bid")
public class BidController {
	
	@Inject
	public BidIndexService bidSvc;
	
	@RequestMapping(value = "hstry", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> makehsrty(
			@RequestBody BidhstryVO bidhstry) {
		int cnt = bidSvc.createBidhsrty(bidhstry);
		if (cnt > 0) {
	        return new ResponseEntity<String>("Success", HttpStatus.OK);
	    } else {
	        return new ResponseEntity<String>("Failed", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
	@RequestMapping("others")
	public void otherBid(Model model) {
		List<BidinfoVO> bidinfoList = bidSvc.retrieveBidinfoList();
		model.addAttribute("bidinfoList", bidinfoList);
	}

}
