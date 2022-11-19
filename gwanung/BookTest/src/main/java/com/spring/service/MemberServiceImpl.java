package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MemberDTO;
import com.spring.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	//회원가입
	@Override
	public void memberJoin(MemberDTO member) {
		log.info("service member : " + member);
		mapper.memberJoin(member);
	}
	
	//아이디 중복 검사
	@Override
	public int idCheck(String memberId) {
		return mapper.idCheck(memberId);
	}

}
