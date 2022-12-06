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
import com.project.domain.ReviewDTO;
import com.project.domain.ReviewVO;
import com.project.service.ReviewService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/reviews/")
@Log4j
public class ReviewController {
	@Autowired
	ReviewService service;

	// 리뷰 생성
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReviewVO vo, HttpServletRequest request) {
		log.info("ReviewVO : " + vo);
		HttpSession session = request.getSession();
		MemberDTO reviewer = (MemberDTO) session.getAttribute("member");
		String memberId = reviewer.getMemberId();
		vo.setReviewer(memberId);
		int insertCount = service.register(vo);
		log.info("insertCount : " + insertCount);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}// create

	@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReviewDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {
		log.info("getList ----------");
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}// getList

//	리뷰 조회
	@GetMapping(value = "/{reviewNo}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<ReviewVO> get(@PathVariable("reviewNo") Long reviewNo) {
		log.info("get-reviewNo : " + reviewNo);
		return new ResponseEntity<>(service.get(reviewNo), HttpStatus.OK);
	}// get
	
//	리뷰 삭제
	@DeleteMapping(value = "/{reviewNo}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("reviewNo") Long reviewNo) {
		log.info("remove-reviewNo : " + reviewNo);
		return service.remove(reviewNo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}// remove

//	리뷰 수정
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{reviewNo}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody ReviewVO vo, @PathVariable("reviewNo") Long reviewNo) {
		log.info("modify-ron : " + reviewNo);
		log.info("ReviewVO : " + vo);
		vo.setReviewNo(reviewNo);
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}//modify
}
