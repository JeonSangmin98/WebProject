package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.Criteria;
import com.project.domain.MemberDTO;
import com.project.domain.ReplyDTO;
import com.project.domain.ReplyVO;
import com.project.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/")
@Log4j
public class ReplyController {
	@Autowired
	ReplyService service;
	
	// 댓글 생성
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVO vo, HttpServletRequest request) {
		log.info("ReplyVO : " + vo);
		HttpSession session = request.getSession();
		MemberDTO replyer = (MemberDTO) session.getAttribute("member");
		String memberId = replyer.getMemberId();
		vo.setReplyer(memberId);
		int insertCount = service.register(vo);
		log.info("insertCount : " + insertCount);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}// create

//	댓글 목록 조회
	@GetMapping(value = "/pages/{boardNo}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyDTO> getList(@PathVariable("page") int page, @PathVariable("boardNo") Long boardNo) {
		log.info("getList ----------");
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		return new ResponseEntity<>(service.getListPage(cri, boardNo), HttpStatus.OK);
	}// getList
	
//	댓글 조회
	@GetMapping(value = "/{replyNo}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("replyNo")Long replyNo){
		log.info("get-replyNo : " + replyNo);
		return new ResponseEntity<>(service.get(replyNo), HttpStatus.OK);
	}//get
	
//	댓글 삭제
	@DeleteMapping(value = "/{replyNo}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("replyNo") Long replyNo){
		log.info("remove-rno : " + replyNo);
		return service.remove(replyNo) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}//remove
	
//	댓글 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{replyNo}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("replyNo")Long replyNo){
		log.info("modify-rno : " + replyNo);
		log.info("ReplyVO : " + vo);
		vo.setReplyNo(replyNo);
		return service.modify(vo) == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
