package kr.or.freeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.freeBoard.model.dao.FreeBoardDao;
import kr.or.freeBoard.model.vo.FreeBoard;
import kr.or.likes.model.dao.LikesDao;

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

	public ArrayList<FreeBoard> selectFreeBoards(int start, int userNo) {
		int length = 100;
		int end = start + length - 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("userNo", userNo);
		ArrayList<FreeBoard> list = dao.selectFreeBoards(map);
		return list;
	}

	public ArrayList<FreeBoard> selectFreeBoardsNoUser(int start) {
		int length = 100;
		int end = start + length - 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<FreeBoard> list = dao.selectFreeBoards(map);
		return list;
	}

	public FreeBoard selectFreeBoardByFbNo(int fbNo) {
		FreeBoard fb = dao.selectFreeBoardByFbNo(fbNo);
		return fb;
	}

	@Transactional
	public int updateFreeBoard(FreeBoard fb) {
		return dao.updateFreeBoard(fb);
	}

	@Transactional
	public int deleteFreeBoard(int fbNo) {
		return dao.deleteFreeBoard(fbNo);
	}

	public String selectFilepath(int fbNo) {
		return dao.selectFilepath(fbNo);
	}

	@Transactional
	public int addViews(int fbNo) {
		return dao.addViews(fbNo);
	}

	@Transactional
	public int addHeart(int fbNo, int userNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("fbNo", fbNo);
		map.put("userNo", userNo);
		int result = dao.addHeart(map);
		return result;
	}

	@Transactional
	public int minusHeart(int fbNo, int userNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("fbNo", fbNo);
		map.put("userNo", userNo);
		int result = dao.minusHeart(map);
		return result;
	}
}
