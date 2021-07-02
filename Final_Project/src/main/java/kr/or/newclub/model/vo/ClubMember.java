package kr.or.newclub.model.vo;

import lombok.Data;

@Data
public class ClubMember {
	private int cmNo;
	private int clubNo;
	private String clubNick;
	private String cmDate;
	
	//자기소개(멤버 서브쿼리)
	private String intro;
}
