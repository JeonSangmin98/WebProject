package com.project.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyDTO {
	private int replyCnt;
	private List<ReplyVO> list;
}