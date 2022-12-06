package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.ReplyDTO;
import com.project.domain.ReplyVO;

public interface ReplyService {
	// 등록
	public int register(ReplyVO vo);
	
	// 조회
	public ReplyVO get(Long replyNo);
	
	// 수정
	public int modify(ReplyVO vo);
	
	// 삭제
	public int remove(Long replyNo);
	
	// 목록
	public List<ReplyVO> getList(Criteria cri, Long boardNo);
	
	// 댓글 목록
	public ReplyDTO getListPage(Criteria cri, Long boardNo);
}