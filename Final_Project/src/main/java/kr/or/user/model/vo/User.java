package kr.or.user.model.vo;

import lombok.Data;

@Data
public class User {
	private String email;
	private String memerPw;
	private String memberNick;
	private String gender;
	private String address;
	private int age;
	private String profile;
	private String filename;
	private String filepath;
	private int warnCount;
	private int grade;
	private String enDate;
	private String lastDate;
	private String like1;
	private String like2;
	private String like3;
}
