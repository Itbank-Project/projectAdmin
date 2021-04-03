package com.itbank.reply;

public interface ReplyDAO {

	int insertReply(ReplyDTO dto);

	List<ReplyDTO> selectReplyList(int review_idx);
}
