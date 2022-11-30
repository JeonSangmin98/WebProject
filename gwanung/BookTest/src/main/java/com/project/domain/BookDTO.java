package com.project.domain;

import java.util.Date;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//책 정보
@Data
public class BookDTO {

	private Long bno; // 도서 번호 (등록순, seq 사용)
	private String author; // 도서 저자
	private String title; // 도서 제목
	private Long price; // 도서 가격
	private double discount; // 도서 할인
	private Date pubdate; // 출판일
	private Long isbn; // 도서 고유번호 
	private String image; //이미지 경로
	private String category; //카테고리
	private String publisher; //책 출판사
	private String description; //책 상세정보
	
	private Long bookCount; //도서 수량 (대여, 구매 시 차감)
	
	private String type; //도서 조건
	private String keyword; //도서 검색
	
	private int reviewCnt; //리뷰 개수
}
