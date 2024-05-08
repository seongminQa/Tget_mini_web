package com.mycompany.Tget_mini_web.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mycompany.Tget_mini_web.dao.MemberDao;
import com.mycompany.Tget_mini_web.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TgetUserDetailsService implements UserDetailsService {
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("실행");
		
		MemberDto memberDto = memberDao.selectByMid(username);
		if(memberDao == null) {
			throw new UsernameNotFoundException("아이디가 존재하지 않습니다.");
		}
		
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(memberDto.getMrole()));
		
		UserDetails userDetails = new TgetUserDetails(memberDto, authorities);
		return userDetails;
	}
}