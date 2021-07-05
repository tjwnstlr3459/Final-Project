package kr.or.newclub.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.newclub.model.dao.ClubCommentDao;
import kr.or.newclub.model.vo.ClubComment;

@Service
public class ClubCommentService {
	@Autowired
	private ClubCommentDao dao;
		
	public List commentList(int boardNo) {
		return dao.commentList(boardNo);
	}

	public int insertComment(ClubComment ccm) {
		return dao.insertComment(ccm);
	}

}
