package kr.or.directMessage.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class DirectMessageData {
	private ArrayList<DirectMessage> dmList;
	private int unread;
}
