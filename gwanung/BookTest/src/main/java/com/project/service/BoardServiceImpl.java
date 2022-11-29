package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;
import com.project.mapper.BoardMapper;
import com.project.mapper.ReplyMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public void register(BoardVO vo) {
		mapper.insertSelectKey(vo);
	}

	@Override
	public BoardVO get(Long boardNo) {
		return mapper.read(boardNo);
	}

	@Override
	public int modify(BoardVO vo) {
		return mapper.update(vo);
	}

	@Override
	@Transactional
	public int remove(Long boardNo) {
		replyMapper.allDeleteReply(boardNo);
		return mapper.delete(boardNo);
	}

	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
}