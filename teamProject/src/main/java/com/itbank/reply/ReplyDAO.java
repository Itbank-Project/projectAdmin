package com.itbank.reply;

import java.util.List;

public interface ReplyDAO {

	int insertReply(ReplyDTO dto);

	List<ReplyDTO> selectReplyList(int review_idx);
}

