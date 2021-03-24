package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.reply.ReplyDTO;
import com.itbank.service.ReplyService;

@RestController
public class ReplyAjaxController {

	@Autowired private ReplyService replyService;
	
	// 답글 작성 (insert)
	@PostMapping(value="trueReview", consumes="application/json;charset=utf8")
	public int trueReview(@RequestBody ReplyDTO dto) {
		int row = replyService.insertReply(dto);
		return row;
	}
}
