package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long boardNo;	// 게시글 번호
	private String title;	// 게시글 제목
	private String content;	// 게시글 내용
	private String writer;	// 게시글 작성자
	private Date regdate; 	// 게시글 등록 시간
	private Date updateDate;	// 게시글 수정 시간
	
	private int replyCnt;	// 게시글의 댓글 수
}
