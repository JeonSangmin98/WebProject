package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long replyNo;	// 댓글 번호
	private Long boardNo;	// 게시글 번호
	
	private String reply;	// 댓글 내용
	private String replyer;	// 댓글 작성자
	
	private Date replyDate;	// 댓글 작성일
	private Date updateDate;	// 댓글 수정일
}