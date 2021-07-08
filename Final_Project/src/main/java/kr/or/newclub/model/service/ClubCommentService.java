package kr.or.newclub.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.newclub.model.dao.ClubCommentDao;
import kr.or.newclub.model.vo.ClubComment;

@Service
public class ClubCommentService {
	@Autowired
	private ClubCommentDao dao;
	
	@Transactional	
	public List commentList(int boardNo) {
		return dao.commentList(boardNo);
	}
	@Transactional
	public int insertComment(ClubComment ccm) {
		return dao.insertComment(ccm);
	}
	@Transactional
	public int commentDelete(int ccNo) {
		return dao.commentDelete(ccNo);
	}

}
