package com.spring.mapper;

import com.spring.domain.MemberDTO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberDTO member);
	
	//아이디 중복 검사
	public int idCheck(String memberId);
}
