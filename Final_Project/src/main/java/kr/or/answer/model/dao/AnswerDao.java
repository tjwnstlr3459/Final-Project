package kr.or.answer.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.answer.model.vo.Answer;


@Repository
public class AnswerDao {
	@Autowired
	private SqlSession session;

	public int insertAnswer(Answer an) {
		return session.insert("answer.insertAnswer",an);
	}

	public Answer selectAnswer(int abNo) {
		return session.selectOne("answer.selectOneAnswer",abNo);
	}

	public int updateAnswer(Answer an) {
		return session.update("answer.updateAnswer",an);
	}
}
