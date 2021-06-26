package kr.or.admin.model.vo;

import lombok.Data;

@Data
public class AdminCount {
	//sysdate 해서 오늘 날짜 가져오는 변수
	private String toDay;
	//전체 회원 수
	private int memberCount;
	//전체 클럽 수
	private int clubCount;
	//회원 취미 수
	private int memberSports;
	private int memberTravel;
	private int memberNature;
	private int memberGame;
	private int memberMovie;
	private int memberBear;
	private int memberEat;
	//연령대 별 회원 수
	private int teenagers;
	private int twenties;
	private int thirties;
	private int forties;
	//개설된 클럽의 카테고리 수
	private int clubSports;
	private int clubMusic;
	private int clubTravle;
	private int clubNature;
	private int clubGame;
	private int clubMovie;
	private int clubBear;
	private int clubEat;
}
