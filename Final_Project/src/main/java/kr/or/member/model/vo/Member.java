package kr.or.member.model.vo;

import lombok.Data;

@Data
public class Member {
	private int memberNo;
	private String email;
	private String memberPw;
	private String memberNick;
	private String gender;
	private String address;
	private String intro;
	private String hobby1;
	private String hobby2;
	private String hobby3;
	private String filename;
	private String filepath;
	private int warningCount;
	private int grade;
	private String enrollDate;
	private String lastDate;
	private int age;
	private int joinMethod;
	//db에서 정렬 되어오는 rnum
	private int sort;

}
