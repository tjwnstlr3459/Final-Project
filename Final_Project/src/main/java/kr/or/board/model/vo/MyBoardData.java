package kr.or.board.model.vo;

import java.util.ArrayList;

import kr.or.answer.model.vo.Answer;
import lombok.Data;

@Data
public class MyBoardData {
	private ArrayList<MyBoard> list;
	private String pageNavi;
}
