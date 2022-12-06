package com.project.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.MemberDTO;
import com.project.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testJoin() {
		
		MemberDTO member = new MemberDTO();
		member.setMemberId("test1");
		member.setMemberPw("test2");
		member.setMemberMail("test3");
		member.setMemberName("test4");
		
		mapper.memberJoin(member);
	}
	 

}
