package kr.or.answer.model.vo;

import lombok.Data;

@Data
public class Answer {
	private int anNo;
	private int abNo;
	private String anWriter;
	private String anContent;
	private String fileName;
	private String filePath;
	private String enrrolDate;
	private String anStatus;
}
