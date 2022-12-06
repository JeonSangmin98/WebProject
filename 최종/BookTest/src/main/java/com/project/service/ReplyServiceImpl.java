package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Criteria;
import com.project.domain.ReplyDTO;
import com.project.domain.ReplyVO;
import com.project.mapper.BoardMapper;
import com.project.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper mapper;
	@Autowired
	private BoardMapper boardMapper;

	@Transactional
	@Override
	public int register(ReplyVO vo) {
		boardMapper.updateReplyCnt(vo.getBoardNo(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long replyNo) {
		return mapper.read(replyNo);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long replyNo) {
		ReplyVO vo = mapper.read(replyNo);
		boardMapper.updateReplyCnt(vo.getBoardNo(), -1);
		return mapper.delete(replyNo);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long boardNo) {
		return mapper.getListWithPaging(cri, boardNo);
	}

	@Override
	public ReplyDTO getListPage(Criteria cri, Long boardNo) {
		return new ReplyDTO(
				mapper.getCountByBoardNo(boardNo), 
				mapper.getListWithPaging(cri, boardNo));
	}

}