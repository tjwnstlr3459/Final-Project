package kr.or.answer.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.answer.model.dao.AnswerDao;

@Service
public class AnswerService {
	@Autowired
	private AnswerDao dao;
}
