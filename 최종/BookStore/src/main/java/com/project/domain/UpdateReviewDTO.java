package com.project.domain;

import lombok.Data;

@Data
public class UpdateReviewDTO {
	private Long bno;	// 책 번호
	
	private double ratingAvg;	// 별점 평균
}