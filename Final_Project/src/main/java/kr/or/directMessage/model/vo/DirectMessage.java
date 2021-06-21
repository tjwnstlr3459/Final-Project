package kr.or.directMessage.model.vo;

import lombok.Data;

@Data
public class DirectMessage {
	private int dmNo;
	private String sender;
	private String receiver;
	private String dmContent;
	private String dmDate;
}
