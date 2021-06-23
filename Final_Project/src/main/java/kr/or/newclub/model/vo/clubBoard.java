package kr.or.newclub.model.vo;

import lombok.Data;

@Data
public class clubBoard {
	private int boardNo;
	private int clubNo;
	private int boardCG;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private String filename;
	private String filepath;
	private int boardViews;
	private int boardGood;
	private String enrollDate;
}
