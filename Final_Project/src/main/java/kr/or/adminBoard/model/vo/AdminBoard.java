package kr.or.adminBoard.model.vo;

import lombok.Data;

@Data
public class AdminBoard {
	private int abNO;
	private int abCg;
	private String abWriter;
	private String abTitle;
	private String abContent;
	private String fileName;
	private String filePath;
	//정렬 쓰는 경우
	private int rnum;
}
