package kr.or.newclub.model.vo;

import lombok.Data;

@Data
public class ClubComment {
	private int ccNo;
	private int boardNo;
	private String ccWriter;
	private String ccContent;
	private String ccCG;
	private String ccREF;
	private String ccGOOD;
	
}
