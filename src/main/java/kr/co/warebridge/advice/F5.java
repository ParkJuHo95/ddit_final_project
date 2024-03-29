package kr.co.warebridge.advice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.warebridge.admin.organization.dao.DepartmentSystemDAO;
import kr.co.warebridge.common.paging.PaginationInfo;
import kr.co.warebridge.vo.DepartmentVO;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class F5 implements HandlerInterceptor{
	
	@Inject
	private DepartmentSystemDAO dsDao;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
		if(request.getHeader("X-Requested-With") == null) {
			try {
				String viewName = modelAndView.getViewName();
				if(viewName.contains("jsonView")) return;
				modelAndView.setViewName("/"+viewName);
				EmployeeVO userData = (EmployeeVO)request.getSession().getAttribute("realUser");
				PaginationInfo paging = new PaginationInfo(); 
				paging.addDetailCondition("dptCmpId", userData.getEmpCmpId());
				List<DepartmentVO> deptSystemList = dsDao.selectTreeList(paging);
				modelAndView.addObject("deptSystemList", deptSystemList);
			} catch(NullPointerException e) {
				return;
			}
		}
	}
	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		
//		if(handler instanceof HandlerMethod) {
//			HandlerMethod handlerMethod = (HandlerMethod) handler;
//			String controllerMethod = "";
//			GetMapping getMapping = handlerMethod.getMethodAnnotation(GetMapping.class);
//            if (getMapping != null) {
//            	controllerMethod = "GET";
//            } else {
//            	controllerMethod = "POST";
//            }
//            String requestMethod = request.getMethod();
//            
//            String uri = request.getRequestURI();
//            log.info("requestMethod : {}",requestMethod);
//            log.info("controllerMethod : {}",controllerMethod);
//            log.info("My URI : {}",uri);
//            
//            if(!requestMethod.equals(controllerMethod)) {
//            	log.info("여기가 method값이 틀린 파트입니다.");
//            	log.info("requestMethod : {}",requestMethod);
//            	log.info("controllerMethod : {}",controllerMethod);
//            	log.info("My URI : {}",uri);
//            }
//		}
//		
//		return HandlerInterceptor.super.preHandle(request, response, handler);
//	}
}
