package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.MemberDTO;
import com.project.mapper.CartMapper;
import com.project.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private CartMapper cartMapper;

	// 회원가입
	@Override
	public void memberJoin(MemberDTO member) {
		log.info("service member : " + member);
		mapper.memberJoin(member);
	}

	// 아이디 중복 검사
	@Override
	public int idCheck(String memberId) {
		return mapper.idCheck(memberId);
	}

	// 로그인
	@Override
	public MemberDTO memberLogin(MemberDTO member) {
		return mapper.memberLogin(member);
	}

	// 회원정보
	@Override
	public MemberDTO memberInfo(String memberId) {
		return mapper.memberInfo(memberId);
	}

	// 회원정보 수정
	@Override
	public void memberModify(MemberDTO member) {
		mapper.memberModify(member);
	}

	//	회원정보 삭제
	@Override
	@Transactional
	public void memberDelete(String memberId) {
		cartMapper.deleteMemberCart(memberId);
		mapper.memberDelete(memberId);
	}
	
	/* 주문자 정보 */
	@Override
	public MemberDTO getMemberInfo(String memberId) {		
		return mapper.getMemberInfo(memberId);
	}
	

}
