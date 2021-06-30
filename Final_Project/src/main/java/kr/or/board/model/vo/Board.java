package kr.or.board.model.vo;

import lombok.Data;

@Data
public class Board {
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
	//셀렉트 절에서 서브쿼리로 ab_cg = cg_no 인 cg_name 을 가져와 사용하는 변수
	private String cgName;
	//조회수 카운트
	private int selCount;
}
