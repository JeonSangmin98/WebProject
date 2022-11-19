package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	
	private String memberId; //회원 id
	private String memberPw; //회원 pw
	private String memberName; //회원 이름
	private String memberMail; //회원 email
	private Date regDate; //회원 등록날짜
	
}
