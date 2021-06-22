package kr.or.freeBoard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.freeBoard.model.dao.FreeBoardDao;
import kr.or.freeBoard.model.vo.FreeBoard;

@Service
public class FreeBoardService {
	@Autowired
	private FreeBoardDao dao;
	@Transactional
	public int insertFreeBoard(FreeBoard fb) {
		return dao.insertFreeBoard(fb);
	}
}
