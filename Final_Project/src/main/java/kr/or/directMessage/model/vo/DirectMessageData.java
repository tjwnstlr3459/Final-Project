package kr.or.directMessage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class DirectMessageData {
	private ArrayList<DirectMessage> dmList;
	private ArrayList<DirectMessage> unreadDmList;
	private int unread;
	private String unreadPaging;
	private String allPaging;
}
