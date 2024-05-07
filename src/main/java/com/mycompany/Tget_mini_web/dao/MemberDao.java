package com.mycompany.Tget_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.Tget_mini_web.dto.MemberDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;

@Mapper
public interface MemberDao {
	MemberDto selectByMid(String username);
	public int insertMember(MemberDto memberdto);
	List<MemberDto> selectByPage(PagerDto pager);
	int count();
	public int updateMember(MemberDto memberDto);
	public int deleteByMid(String mid);
	public int insertJoin(MemberDto memberdto);
}