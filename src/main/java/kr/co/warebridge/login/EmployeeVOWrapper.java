package kr.co.warebridge.login;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.co.warebridge.vo.EmployeeVO;

public class EmployeeVOWrapper extends User{
	private EmployeeVO realUser;

	public EmployeeVOWrapper(EmployeeVO realUser) {
		super(realUser.getEmpNo(),realUser.getEmpPass(),
				realUser.getEmpRole().stream().map(SimpleGrantedAuthority::new)
				.collect(Collectors.toList()));
		this.realUser = realUser;
	}
	
	public EmployeeVO getRealUser() {
		return realUser;
	}
}
