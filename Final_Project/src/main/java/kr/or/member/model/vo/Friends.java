package kr.or.member.model.vo;

import lombok.Data;

@Data
public class Friends {
	private int friendNo;
	private String sender;
	private String receiver;
	private String accept;
	private String accDate;
	private int rowNum;
}
