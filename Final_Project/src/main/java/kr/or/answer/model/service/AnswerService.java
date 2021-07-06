package kr.or.answer.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.answer.model.dao.AnswerDao;
import kr.or.answer.model.vo.Answer;

@Service
public class AnswerService {
	@Autowired
	private AnswerDao dao;

	@Transactional
	public int insertAnswer(Answer an) {
		return dao.insertAnswer(an);
	}

	public Answer selectAnswer(int abNo) {
		return dao.selectAnswer(abNo);
	}
}
