package kr.or.newclub.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.board.model.vo.Board;
import kr.or.newclub.model.dao.newClubDao;
import kr.or.newclub.model.vo.clubBoard;

@Service
public class newClubService {


@Autowired
private newClubDao dao;

public List boardList() {
	return dao.boardList();

}

public int totalCount(int clubNo) {
    return dao.totalCount(clubNo);
 }

public ArrayList<Board> clubBoardMore(int start, int clubNo) {
	//3개씩가져올거다
	int length = 3;
	int end = start + length - 1;
	HashMap<Object, Object> map = new HashMap<Object, Object>();
	map.put("start", start);
	map.put("end", end);
	map.put("clubNo", clubNo);
	
	return dao.clubBoardMore(map);
}

	public int insertBoard(clubBoard n) {
		return dao.inserBoard(n);
}


}

