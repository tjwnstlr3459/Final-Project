package kr.or.board.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class BoardPageData {
	private ArrayList<Board> list;
	private String pageNavi;
	
	public BoardPageData(ArrayList<Board> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public BoardPageData() {
		super();
	}
}
