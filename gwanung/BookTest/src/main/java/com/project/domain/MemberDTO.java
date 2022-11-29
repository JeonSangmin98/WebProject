package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	
	private String memberId; //회원 id
	private String memberPw; //회원 pw
	private String memberName; //회원 이름
	private String memberMail; //회원 email
	private Date regDate; //회원 등록날짜
	private Long point; //회원 마일리지
	
	private String memberAddr1;//회원 우편번호
	private String memberAddr2;//회원 주소
	private String memberAddr3;//회원 상세주소
	
}
