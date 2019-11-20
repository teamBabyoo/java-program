package kr.co.nff.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.co.nff.repository.vo.Store;
import lombok.Getter;

@Getter
public class SecurityUser extends User {
	private static final long serialVersionUID = 1L;
	private Store store;
	public SecurityUser(Store vo, Collection<? extends GrantedAuthority> list) {
		super(vo.getStoreName(), vo.getStorePass(), list);
		this.store = vo;
	}
}
