package kr.or.admin.model.vo;

import lombok.Data;

@Data
public class Visit {
	private int visitNo;
	private String visitIp;
	private String visitDate;
	
	private String selectType;
}
