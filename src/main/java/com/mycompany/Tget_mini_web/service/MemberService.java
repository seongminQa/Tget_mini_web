package com.mycompany.Tget_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.Tget_mini_web.dao.MemberDao;
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
		member.setMgrade("아기 연뮤덕"); // 처음 등급(not null이라서 일단 지정 함)
		member.setMrole("user"); // 기본적으로 t-get 홈페이지를 통해 회원가입을 하는 사람들은 user로 지정
		member.setMtotalpay(0); // 기본 값 0원으로 지정
		memberDao.insertmember(member);
		
	}
	
	/*public void memberSignup(MemberDto memberDto) {
		// 비즈니스 로직 처리
		int rowNum = memberDao.insert(memberDto);
		log.info("rowNum: " + rowNum + ", mno: " + memberDto.getMno());
	}*/
	
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

	// 멤버 객체를 mid로 구분하기?
	/*public MemberDto getMember(String mid) {
		MemberDto memberDto = memberDao.selectByMid(mid);
		return memberDto;
	}*/

	// 게시물 첨부파일 보기 메소드
	/*public byte[] getAttachData(int bno) {
		Ch13Board board = boardDao.selectAttachData(bno);
		return board.getBattachdata();
	}*/
	
	/*public void updateBoard(Ch13Board board) {
		int rowNum = boardDao.update(board);
	}*/

	/*public void removeBoard(int bno) {
		// int rowNum = boardDao.deleteByBno(bno); // rowNum은 삭제된 행수를 얻고싶을 때 넣어주고, 필요없으면 안써도 된다.
		boardDao.deleteByBno(bno);
	}*/
}
