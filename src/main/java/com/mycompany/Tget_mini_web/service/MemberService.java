package com.mycompany.Tget_mini_web.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.Tget_mini_web.dao.MemberDao;
import com.mycompany.Tget_mini_web.dto.BoardDto;
import com.mycompany.Tget_mini_web.dto.MemberDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {
	@Resource // @Autowired 받아도 됨.
	private MemberDao memberDao; // Dao 주입받기

	public void join(MemberDto member) {
		log.info("회원가입 form service 도착");
		// 사용자로 부터 받아온 비밀번호를 암호화 해서 DTO에 저장한다.
		log.info(member.toString()); // null로 나온다...
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		log.info(passwordEncoder.encode(member.getMpassword()));
		member.setMpassword(passwordEncoder.encode(member.getMpassword()));
		member.setMgrade("일반"); // 처음 등급(not null이라서 일단 지정 함)
		member.setMrole("ROLE_USER"); // 기본적으로 t-get 홈페이지를 통해 회원가입을 하는 사람들은 user로 지정
		member.setMtotalpay(0); // 기본 값 0원으로 지정
		member.setMssn(member.getMssn().replace("-", ""));
		memberDao.insertJoin(member);
	}

	// 페이지 당 리스트를 보여주는 메소드
	public List<MemberDto> getMemberList(PagerDto pager) {
		List<MemberDto> memberList = memberDao.selectByPage(pager);
		return memberList;
	}

	// 리스트들의 총 행의 수를 반환하는 메소드
	public int getTotalRows() {
		int totalRows = memberDao.count();
		return totalRows;
	}

	// 멤버 객체를 mid로 구분하기
	public MemberDto getMember(String mid) {
		MemberDto memberDto = memberDao.selectByMid(mid);
		return memberDto;
	}

	// 회원 정보 수정 메소드
	public void updateMember(MemberDto memberDto) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		memberDto.setMpassword(passwordEncoder.encode(memberDto.getMpassword()));
		int rowNum = memberDao.updateMember(memberDto);
	}

	// 회원 삭제 메소드
	public void removeMember(String mid) {
		// int rowNum = memberDao.deleteByMid(mid); // rowNum은 삭제된 행수를 얻고싶을 때 넣어주고,
		// 필요없으면 안써도 된다.
		memberDao.deleteByMid(mid);
	}

	public int getMidCount(String mid) {
		int count = 0;
		log.info("service 진입" + mid);

		// DB에서 중복값의 행을 반환했을 때 0이 나오면
		if (memberDao.selectByMidIsUnique(mid) != 0) {
			count = 1; // 유일한 아이디이고 1을 반환한다.
		}
		log.info(memberDao.selectByMidIsUnique(mid) + "");
		log.info(count + "");

		return count;
	}

	public int getMssnCount(String mssn) {
		int count = 0;
		log.info("service 진입" + mssn);

		// DB에서 중복값의 행을 반환했을 때 0이 나오면
		if (memberDao.selectByMssnIsUnique(mssn) != 0) {
			count = 1; // 유일한 주민번호이고 1을 반환한다.
		}
		log.info(memberDao.selectByMssnIsUnique(mssn) + "");
		log.info(count + "");

		return count;
	}

	public int getMphoneCount(String mphone) {
		int count = 0;
		log.info("service 진입" + mphone);

		// DB에서 중복값의 행을 반환했을 때 0이 나오면
		if (memberDao.selectByMphoneIsUnique(mphone) != 0) {
			count = 1; // 유일한 휴대폰 번호이고 1을 반환한다.
		}
		log.info(memberDao.selectByMphoneIsUnique(mphone) + "");
		log.info(count + "");

		return count;
	}

	public int getMnicknameCount(String mnickname) {
		int count = 0;
		log.info("service 진입" + mnickname);

		// DB에서 중복값의 행을 반환했을 때 0이 나오면
		if (memberDao.selectByMnicknameIsUnique(mnickname) != 0) {
			count = 1; // 유일한 닉네임이고 1을 반환한다.
		}
		log.info(memberDao.selectByMnicknameIsUnique(mnickname) + "");
		log.info(count + "");

		return count;
	}

	// 아이디 찾기
	public String findId(MemberDto memberDto) {
		String mid = memberDao.findId(memberDto);
		return mid;
	}

	// 비밀번호 찾기
	public String findPw(MemberDto memberDto) {
		String mpassword = memberDao.findPw(memberDto);
		return mpassword;

	}

	// 비밀번호 찾기 기능
	public void ChangePw(MemberDto memberDto) {

		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		memberDto.setMpassword(passwordEncoder.encode(memberDto.getMpassword()));
		memberDao.ChangePw(memberDto);

	}
	
	// 회원정보 수정에서 회원 비밀번호 변경하기
	public void updateMpassword(MemberDto memberDto) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		memberDto.setMpassword(passwordEncoder.encode(memberDto.getMpassword()));
		memberDao.updateMpassword(memberDto);
	}
	
	//회원정보수정에서 회원 닉네임 변경하기
	public void updateMnickname(MemberDto memberDto) {
		memberDao.updateMnickname(memberDto);
		
	}
	// 회원정보수정에서 회원 이메일 변경하기
	public void updateMemail(MemberDto memberDto) {
		memberDao.updateMemail(memberDto);
		
	}
	// 회원정보수정에서 회원 휴대폰 번호 변경하기
	public void updateMphone(MemberDto memberDto) {
		memberDao.updateMphone(memberDto);
		
	}

	public MemberDto getMemberImg(String mid) {
		MemberDto memberdto = memberDao.selectImgByMid(mid);
		return memberdto;
	}

	public void updateMprofileImg(MemberDto memberDto) {
		memberDao.updateMprofileImg(memberDto);
		
	}

	public void deletemember(MemberDto auMemberDto) {
		memberDao.deleteByMid(auMemberDto.getMid());
		
	}
	public List<BoardDto> detail(String mid) {
		List<BoardDto> saved= memberDao.selectBoard(mid);
		return saved;
	}



}
