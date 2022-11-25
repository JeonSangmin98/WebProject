package com.project.service;

import com.project.domain.MemberDTO;

public interface MemberService {
	
	//회원가입
	public void memberJoin(MemberDTO member);
	
	//아이디 중복 검사
	public int idCheck(String memberId);
	
	//로그인 
	public MemberDTO memberLogin(MemberDTO member);
	
	public MemberDTO getMemberId(String memberId);
}
