package kr.or.club.model.vo;

import lombok.Data;

@Data
public class ClubBoard {
	private int boardNo;
	private int clubNo;
	private int boardCg;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private String fileName;
	private String filePath;
	private int boardViews;
	private int cbGood;
	private String enrollDate;
	//클럽명까지 출력을 위해
	private String clubName;
	//게시물 좋아요를 같이 받기위해
	private int totalCount;
	private String likeCheck;
}
