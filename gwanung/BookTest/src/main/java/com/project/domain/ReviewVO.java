package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private Long reviewNo;	// 댓글 번호
	private Long bno;	// 도서 상품 번호
	
	private String review;	// 리뷰 내용
	private String reviewer;	// 리뷰 작성자
	
	private Date reviewDate;	// 리뷰 작성일
	private Date updateDate;	// 리뷰 수정일
	
	private double rating; //리뷰 별점
	
}