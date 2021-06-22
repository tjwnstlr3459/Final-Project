package kr.or.freeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	public int FreeBoardtotalCount() {
		return dao.FreeBoardtotalCount();
	}
	public ArrayList<FreeBoard> selectFreeBoards(int start) {
		int length = 5;
		int end = start + length - 1;
		HashMap<Integer, Object> map = new HashMap<Integer, Object>();
		map.put(1, start);
		map.put(2, end);
		ArrayList<FreeBoard> list = dao.selectFreeBoards(map);
		return list;
	}
}
