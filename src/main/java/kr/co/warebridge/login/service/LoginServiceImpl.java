package kr.co.warebridge.login.service;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.warebridge.employee.dao.EmployeeDAO;
import kr.co.warebridge.login.EmployeeVOWrapper;
import kr.co.warebridge.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("userDetailService")
public class LoginServiceImpl implements UserDetailsService{
	
	@Inject
	private EmployeeDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeVO employee = dao.selectEmployeeForLogin(username);
		if(employee == null) {
			throw new UsernameNotFoundException(String.format("%s 사용자 없음.", username));
		}
		log.info("employee : {}",employee.toString());
		return new EmployeeVOWrapper(employee);
	}
}
