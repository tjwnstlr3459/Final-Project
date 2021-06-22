package kr.or.restriction.model.vo;

import lombok.Data;

@Data
public class Restriction {
	private int restNo;
	private String restEmail;
	private int restCg;
	private String restContent;
	private String startDate;
	private String endDate;
}
