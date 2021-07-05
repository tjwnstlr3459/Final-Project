package kr.or.newclub.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.newclub.model.vo.ClubComment;

@Repository	
public class ClubCommentDao {
	@Autowired
	private SqlSessionTemplate session;

	public List commentList(int boardNo) {
		System.out.println(boardNo);
		List list = session.selectList("clubcomment.commentList",boardNo);
		return list;
	}

	public int insertComment(ClubComment ccm) {
		return session.insert("clubcomment.insertComment",ccm);
		
	}

}
