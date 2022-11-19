package com.project.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {	// 검색의 기준
	private int pageNum;	// 게시판 페이지 번호
	private int amount;		// 	게시글 수
	
	private String type;
	private String keyword;
	
	
//	기본값을 1페이지, 10개로 지정
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
//	검색조건이 각 글자(T,C,W)로 구성되어 있으므로
//	검색 조건을 배열로 만들어서 한 번에 처리 하기 위함
//	T : title / C : content / W : writer
	public String[] getTypeArr() {
		return type == null ? new String[] {}: type.split("");
	}
	
//	여러개의 파라미터들을 연결해서 URL형태로 만들어 줌
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
}