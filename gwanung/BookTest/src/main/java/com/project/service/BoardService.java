package com.project.service;

import java.util.List;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;

public interface BoardService {
	public void register(BoardVO vo);
	public BoardVO get(Long bno);
	public int modify(BoardVO vo);
	public int remove(Long bno);
	public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
}
