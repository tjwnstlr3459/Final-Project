package kr.or.freeBoard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.freeBoard.model.dao.FreeBoardDao;

@Service
public class FreeBoardService {
	@Autowired
	private FreeBoardDao dao;
}
