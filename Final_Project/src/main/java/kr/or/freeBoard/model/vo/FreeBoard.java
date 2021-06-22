package kr.or.freeBoard.model.vo;

import lombok.Data;

@Data
public class FreeBoard {
	private int fbNo;
	private String fbWriter;
	private String fbContent;
	private String filename;
	private String filepath;
	private int fbViews;
	private int fbGood;
	private int type;
	private String fbDate;
}
