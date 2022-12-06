package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.BoardVO;
import com.project.domain.Criteria;

public interface BoardMapper {
	
//	@Select("select * from book_board")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
//	pk 값을 알 필요 없는 경우
	public void insert(BoardVO board);
//	pk 값을 알아야 하는 경우
	public void insertSelectKey(BoardVO board);
	
//	데이터 조회
	public BoardVO read(Long boardNo);
	
//	데이터 삭제
	public int delete(Long boardNo);
	
//	데이터 수정
	public int update(BoardVO board);
	
//	전체 데이터 개수 처리
	public int getTotalCount(Criteria cri);
	
//	게시글의 댓글이 추가/삭제 될때마다 댓글 수 업데이트
	public void updateReplyCnt(@Param("boardNo") Long boardNo, @Param("amount") int amount);

// 댓글 있는 게시글 삭제
	public int allDelete(Long boardNo);
}
