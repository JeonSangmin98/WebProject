package com.spring.service;

import com.spring.domain.MemberDTO;

public interface MemberService {
	
	//회원가입
	public void memberJoin(MemberDTO member);
	
	//아이디 중복 체크
	public int idCheck(String memberId);
}
