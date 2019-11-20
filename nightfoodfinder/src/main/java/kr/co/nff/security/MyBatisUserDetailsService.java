package kr.co.nff.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import kr.co.nff.front.login.service.LoginService;
import kr.co.nff.repository.dao.LoginDAO;
import kr.co.nff.repository.vo.Store;



@Component("myBatisUserDetailsService")
public class MyBatisUserDetailsService implements UserDetailsService {

	// login dao
	@Autowired	
	LoginDAO dao;

//	@Autowired
//	private PasswordEncoder encoder;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		
		
		
		Member vo = mapper.selectMember(userName);   
		List<SimpleGrantedAuthority> list = new ArrayList<>();
		for (Auth auth : vo.getAuthList()) {
			list.add(new SimpleGrantedAuthority(auth.getAuth()));
		}
		return vo == null ? null : new SecurityUser(vo, list);
	}
}
