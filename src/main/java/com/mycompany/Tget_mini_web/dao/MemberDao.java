package com.mycompany.Tget_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.Tget_mini_web.dto.MemberDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;

@Mapper
public interface MemberDao {
	MemberDto selectByMid(String username);
//	public int insert(MemberDto memberDto);
//	MemberDto insertmember(MemberDto memberdto);
	public int insertmember(MemberDto memberdto);
	List<MemberDto> selectByPage(PagerDto pager);
	int count();
}