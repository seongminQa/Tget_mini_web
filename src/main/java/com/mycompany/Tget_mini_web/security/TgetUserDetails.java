package com.mycompany.Tget_mini_web.security;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mycompany.Tget_mini_web.dto.MemberDto;

public class TgetUserDetails extends User {
	private MemberDto memberDto;
	
	public TgetUserDetails(MemberDto memberDto, List<GrantedAuthority> authorities) {
		super(memberDto.getMid(), 
				memberDto.getMpassword(), true, true, true, true, 
				authorities);
		this.memberDto = memberDto;
	}
	
	public MemberDto getMember() {
		return memberDto;
	}

}
