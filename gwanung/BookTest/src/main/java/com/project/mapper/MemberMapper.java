package com.project.mapper;

import com.project.domain.MemberDTO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberDTO member);
	
	//아이디 중복 검사
	public int idCheck(String memberId);
	
	//로그인
	public MemberDTO memberLogin(MemberDTO member);
}
