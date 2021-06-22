package kr.or.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.board.model.dao.boardDao;
import kr.or.board.model.vo.Board;

@Service
public class boardService {
	
	@Autowired
	private boardDao dao;
	
	@Transactional
	public ArrayList<Board> boardList() {
		List<Board> list = dao.boardList();
		return (ArrayList<Board>)list;
	}

}
