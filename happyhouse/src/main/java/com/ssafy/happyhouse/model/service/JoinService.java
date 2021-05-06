package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;

import com.ssafy.happyhouse.model.MemberDto;

public interface JoinService {

	public void Join(MemberDto member) throws Exception;
	public  MemberDto getMember(String id) throws Exception;
	public void modifyMember(MemberDto memberDto) throws Exception;
	public int deleteMember(String userid) throws SQLException;
	
}
