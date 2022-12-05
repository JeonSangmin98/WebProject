package com.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.BookDTO;
import com.project.domain.Criteria;
import com.project.mapper.BookMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BookServiceImpl implements BookService{
	
	@Autowired
	private BookMapper mapper;
	
	//책 api 데이터 등록
	@Override
	public void register(BookDTO dto) {
		mapper.insert(dto);
	}

	//책 상세조회
	@Override
	public BookDTO get(Long bno) {
		return mapper.read(bno); 
	}
	// 책 검색
	@Override
	public List<BookDTO> searchList(String type, String keyword) {
		return mapper.searchList(type, keyword);
	}
	//도서 전체 리스트 페이징 처리
	@Override
	public ArrayList<BookDTO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	//총 도서 개수
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	//도서 카테고리
	@Override
	public List<BookDTO> categoryList(String category) {
		return mapper.categoryList(category);
	}

	//높은 할인도서 리스트
	@Override
	public List<BookDTO> discountList() {
		return mapper.discountList();
	}

	//인기도서 리스트
	@Override
	public List<BookDTO> popularList() {
		return mapper.popularList();
	}

}
