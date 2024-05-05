package com.mycompany.Tget_mini_web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.Tget_mini_web.dao.MemberDao;
import com.mycompany.Tget_mini_web.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class MemberService {
	@Autowired
	private MemberDao mdao;

	public void join(MemberDto member) {
		log.info("회원가입 form service 도착");
		// 사용자로 부터 받아온 비밀번호를 암호화 해서 DTO에 저장한다.
		log.info(member.toString()); // null로 나온다...
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		log.info(passwordEncoder.encode(member.getMpassword()));
		member.setMpassword(passwordEncoder.encode(member.getMpassword()));
		member.setMgrade("아기 연뮤덕"); // 처음 등급(not null이라서 일단 지정 함)
		member.setMrole("user"); // 기본적으로 t-get 홈페이지를 통해 회원가입을 하는 사람들은 user로 지정
		member.setMtotalpay(0); // 기본 값 0원으로 지정
		mdao.insertmember(member);
		
	}
	
}
