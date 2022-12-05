package com.project.mapper;

import com.project.domain.MemberDTO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberDTO member);
	
	//아이디 중복 검사
	public int idCheck(String memberId);
	
	//로그인
	public MemberDTO memberLogin(MemberDTO member);
	
	//회원 정보
	public MemberDTO memberInfo(String memberId);
	
	//회원 정보 수정
	public void memberModify(MemberDTO member);
	
	//회원 정보 삭제
	public void memberDelete(String memberId);
	
	/* 주문자 주소 정보 */
	public MemberDTO getMemberInfo(String memberId);
}
