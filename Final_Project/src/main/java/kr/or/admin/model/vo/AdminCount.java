package kr.or.admin.model.vo;

import lombok.Data;

@Data
public class AdminCount {
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
	private int teenager;
	private int twenty;
	private int thirty;
	private int fourty;
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
