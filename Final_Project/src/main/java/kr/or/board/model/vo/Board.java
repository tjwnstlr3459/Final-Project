package kr.or.board.model.vo;

import lombok.Data;

@Data
public class Board {
	private int abNo;
	private int abCg;
	private String abWriter;
	private String abTitle;
	private String abContent;
	private String fileName;
	private String filePath;
	private String enrollDate;
}
