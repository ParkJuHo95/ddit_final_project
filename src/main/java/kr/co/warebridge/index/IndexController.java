package kr.co.warebridge.index;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.warebridge.Bid.service.BidIndexService;
import kr.co.warebridge.admin.organization.dao.DepartmentSystemDAO;
import kr.co.warebridge.board.service.BoardService;
import kr.co.warebridge.calendar.service.CalendarService;
import kr.co.warebridge.chat.service.ChatService;
import kr.co.warebridge.common.paging.BootstrapFormBasePaginationRenderer;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.common.paging.PaginationRenderer;
import kr.co.warebridge.employee.service.EmployeeService;
import kr.co.warebridge.eworks.service.SnctdocumentService;
import kr.co.warebridge.mail.dao.MailDAO;
import kr.co.warebridge.mail.service.MailService;
import kr.co.warebridge.news.service.NewsService;
import kr.co.warebridge.validate.RealUser;
import kr.co.warebridge.vo.BidrcmdVO;
import kr.co.warebridge.vo.ChatRoomVO;
import kr.co.warebridge.vo.CompanyBoardVO;
import kr.co.warebridge.vo.DepartmentVO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.MailVO;
import kr.co.warebridge.vo.NewsVO;
import kr.co.warebridge.vo.SnctdocumentVO;
import kr.co.warebridge.vo.schedule.ScheduleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/{who}/home")
public class IndexController {
	
//	@GetMapping("login")
//	public String loginPage() {
//		return "login";
//	}
	@Inject
	private BidIndexService bidService;
	
	@Inject
	private EmployeeService service;
	
	@Inject
	private NewsService nService;
	
	@Inject
	private DepartmentSystemDAO dsDao;
	
	@Inject
	private MailService mService;
	
	@Inject
	private MailDAO mDao;
	
	@Inject
	private BoardService bService; 

	@Inject
	private CalendarService cService;
	
	@Inject
	private ChatService chatService;
	
	@Inject
	SnctdocumentService sService;
	
	@GetMapping
	public String userHomeG(
			@RealUser EmployeeVO realUser,
			@PathVariable String who,
			Model model,
			HttpSession session,
			@ModelAttribute("paging") PaginationInfo paging,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage
			) throws Exception {
		Map<String, Object> detailCondition = new HashedMap<String, Object>();
		EmployeeVO userData = service.retrieveEmployee(realUser.getEmpNo());
		service.base64(userData);
		session.setAttribute("realUser", userData);
		
		List<String> dptList = cService.selectDPTName(realUser);
		model.addAttribute("dptList",dptList);
		
		String mailGetter = userData.getEmpMail();
		model.addAttribute("mailGetter",mailGetter);
		
		List<BidrcmdVO> bidrcmdList = bidService.retrieveBidrcmdList(userData.getEmpCmpId());
		model.addAttribute("bidrcmdList", bidrcmdList);
		
		List<CompanyBoardVO> noticeList = bService.retrieveNoticeList(userData);
		model.addAttribute("noticeList", noticeList);
		
		List<ChatRoomVO> chatRoomList = chatService.retrieveChatRoomList(realUser.getEmpNo());
		model.addAttribute("chatRoomList", chatRoomList);
		
		List<ScheduleVO> todayList = cService.retrieveTodayList(userData);
		List<ScheduleVO> myList = new ArrayList<ScheduleVO>();
		List<ScheduleVO> dpt1List = new ArrayList<ScheduleVO>();
		List<ScheduleVO> dpt2List = new ArrayList<ScheduleVO>();
		List<ScheduleVO> companyList = new ArrayList<ScheduleVO>();
		for(ScheduleVO vo : todayList) {
			if(vo.getScheduleType().equals("E")) myList.add(vo);
			if(vo.getScheduleType().equals("D1")) dpt1List.add(vo);
			if(vo.getScheduleType().equals("D2")) dpt2List.add(vo);
			if(vo.getScheduleType().equals("C")) companyList.add(vo);
		}
		model.addAttribute("myList", myList);
		model.addAttribute("dpt1List", dpt1List);
		model.addAttribute("dpt2List", dpt2List);
		model.addAttribute("companyList", companyList);
		
		detailCondition.put("ssEmpNo", realUser.getEmpNo());
		detailCondition.put("ssStatus", "0");
		paging.setDetailCondition(detailCondition);
		List<SnctdocumentVO> sdcList = sService.retrieveWaitingList(paging);
		model.addAttribute("sdcList", sdcList);
		
		//dpt 목록 불러오기
		if("user".equals(who)) {
			
			detailCondition.put("dptCmpId", userData.getEmpCmpId());
			paging.setDetailCondition(detailCondition);
			List<DepartmentVO> deptSystemList = dsDao.selectTreeList(paging);
			model.addAttribute("deptSystemList", deptSystemList);
			
			NewsVO news = nService.retrieveNews(userData);
			model.addAttribute("news", news);
			paging.setCurrentPage(currentPage);
			List<MailVO> mail = mService.retrieveGetMailList(mailGetter, paging);
			paging.addDetailCondition("mailGetter", mailGetter);
			int mailCnt = mDao.selectMailCnt(paging);
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		    String pagingHTML = renderer.renderPagination(paging);
			model.addAttribute("mail", mail);
			model.addAttribute("mailCnt", mailCnt);
			 
		}
//		model.addAttribute("realUser", userData);
		return who+"/nonesubside";
	}

	
	@GetMapping("body")
	public String userHome(
		@RealUser EmployeeVO realUser,
		@PathVariable String who,
		Model model,
		HttpSession session,
		@ModelAttribute("paging") PaginationInfo paging,
		@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage
		
	) throws Exception {
		Map<String, Object> detailCondition = new HashedMap<String, Object>();
		EmployeeVO userData = service.retrieveEmployee(realUser.getEmpNo());
		
		List<String> dptList = cService.selectDPTName(realUser);
		model.addAttribute("dptList",dptList);
		
		String mailGetter = userData.getEmpMail();
		model.addAttribute("mailGetter",mailGetter);
		
		List<BidrcmdVO> bidrcmdList = bidService.retrieveBidrcmdList(userData.getEmpCmpId());
		model.addAttribute("bidrcmdList", bidrcmdList);
		
		List<CompanyBoardVO> noticeList = bService.retrieveNoticeList(userData);
		model.addAttribute("noticeList", noticeList);
		
		List<ChatRoomVO> chatRoomList = chatService.retrieveChatRoomList(realUser.getEmpNo());
		model.addAttribute("chatRoomList", chatRoomList);
		
		List<ScheduleVO> todayList = cService.retrieveTodayList(userData);
		List<ScheduleVO> myList = new ArrayList<ScheduleVO>();
		List<ScheduleVO> dpt1List = new ArrayList<ScheduleVO>();
		List<ScheduleVO> dpt2List = new ArrayList<ScheduleVO>();
		List<ScheduleVO> companyList = new ArrayList<ScheduleVO>();
		for(ScheduleVO vo : todayList) {
			if(vo.getScheduleType().equals("E")) myList.add(vo);
			if(vo.getScheduleType().equals("D1")) dpt1List.add(vo);
			if(vo.getScheduleType().equals("D2")) dpt2List.add(vo);
			if(vo.getScheduleType().equals("C")) companyList.add(vo);
		}
		model.addAttribute("myList", myList);
		model.addAttribute("dpt1List", dpt1List);
		model.addAttribute("dpt2List", dpt2List);
		model.addAttribute("companyList", companyList);
		
		detailCondition.put("ssEmpNo", realUser.getEmpNo());
		detailCondition.put("ssStatus", "0");
		paging.setDetailCondition(detailCondition);
		List<SnctdocumentVO> sdcList = sService.retrieveWaitingList(paging);
		model.addAttribute("sdcList", sdcList);
		
		//dpt 목록 불러오기
		if("user".equals(who)) {
			
			detailCondition.put("dptCmpId", userData.getEmpCmpId());
			paging.setDetailCondition(detailCondition);
			List<DepartmentVO> deptSystemList = dsDao.selectTreeList(paging);
			model.addAttribute("deptSystemList", deptSystemList);
			
			NewsVO news = nService.retrieveNews(userData);
			model.addAttribute("news", news);
			paging.setCurrentPage(currentPage);
			List<MailVO> mail = mService.retrieveGetMailList(mailGetter, paging);
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		    String pagingHTML = renderer.renderPagination(paging);
			model.addAttribute("mail", mail);
			 
		}
		return who+"/home/nonesubside";
	}

	@PostMapping
	public String userHomeP(@PathVariable String who) {
		return who+"/nonesubside";
	}
}

