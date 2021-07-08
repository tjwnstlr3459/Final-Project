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

	public List<ClubComment> commentList(int boardNo) {
		System.out.println(boardNo);
		List<ClubComment> list1 = session.selectList("clubcomment.commentList",boardNo);
		return list1;
	}

	public int insertComment(ClubComment ccm) {
		return session.insert("clubcomment.insertComment",ccm);
		
	}

	public int commentDelete(int ccNo) {
		return session.delete("clubcomment.deleteComment",ccNo);
	}

}
