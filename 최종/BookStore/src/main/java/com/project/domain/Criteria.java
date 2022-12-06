package com.project.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	//조건
	private String type;
	//사용자가 실제로 입력한 값
	private String keyword;
	
	
	public Criteria() {
		this(1, 10);  //페이지 기본 값을 1페이지, 페이지 개수 10개로 설정
	}
	
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	

	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");  
		//TWC title,writer,content의 앞글자를 따서 검색조건을 배열로 만들어 한 번에 처리해줌
	}
	
	//여러 개의 파라미터들을 연결해서 URL형태로 만들어주는 기능
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
				
				return builder.toUriString();
	}
	
}
