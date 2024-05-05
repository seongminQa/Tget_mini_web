package com.mycompany.Tget_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.Tget_mini_web.dto.MemberDto;

@Mapper
public interface MemberDao {
	MemberDto selectByMid(String username);
	MemberDto insertmember(MemberDto memberdto);
}