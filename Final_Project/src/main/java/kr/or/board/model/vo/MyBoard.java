package kr.or.board.model.vo;

import java.util.ArrayList;

import kr.or.answer.model.vo.Answer;
import lombok.Data;

@Data
public class MyBoard {
	private int rnum;
	private int abNo;
	private int abCg;
	private String abWriter;
	private String abTitle;
	private String abContent;
	private String fileName;
	private String filePath;
	private String enrollDate;
	private String status;
	private int anNo;
	private String anWriter;
	private String anContent;
	private String anFilename;
	private String anFilepath;
	private String anDate;
}
