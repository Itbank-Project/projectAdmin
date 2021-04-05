package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.reply.ReplyDAO;
import com.itbank.reply.ReplyDTO;

@Service
public class ReplyService {

	@Autowired private ReplyDAO dao;
	
	public int insertReply(ReplyDTO dto) {
		return dao.insertReply(dto);
	}

	public List<ReplyDTO> getReplyList(int review_idx) {
		return dao.selectReplyList(review_idx);
	}
}
