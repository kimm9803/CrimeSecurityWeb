package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.ReplyDao;
import com.spring.board.domain.ReplyVo;
import com.spring.board.service.ReplyService;
import com.spring.board.vo.BoardVo;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;

	@Override
	public void insertReply(ReplyVo vo) {
		replyDao.insertReply(vo);
		
	}

	@Override
	public List<ReplyVo> getReplyList(BoardVo vo) {
		List<ReplyVo> replyList = replyDao.getReplyList(vo);
		return replyList;
	}

	@Override
	public void deleteReply(ReplyVo vo) {
		replyDao.deleteReply(vo);
		
	}

	@Override
	public void updateReply(ReplyVo vo) {
		replyDao.updateReply(vo);
	}

	//작성 댓글 갯수
	@Override
	public Object myReplyCnt(String nickname) {
        int myReplyCnt = replyDao.myReplyCnt(nickname);
		return myReplyCnt;
	}
    //작성한 댓글 목록
	@Override
	public List<ReplyVo> myreplyList(String nickname) {
		List<ReplyVo> myreplyList = replyDao.myreplyList(nickname);
		return myreplyList;
	}
}
