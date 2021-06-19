package kr.or.club.model.vo;

import lombok.Data;

@Data
public class Club {
	private int clubNo;
	private int clubCg;
	private String clubName;
	private String clubIntro;
	private String clubOpener;
	private String fileName;
	private String filePath;
	private int clubRating;
	private String ispublic;
	private String enrollDate;
	private String lastDate;
	private int warningCount;
}
