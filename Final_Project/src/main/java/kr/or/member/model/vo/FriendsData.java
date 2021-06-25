package kr.or.member.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class FriendsData {
	private ArrayList<Member> fList;
	private ArrayList<Member> fReqList;
	private ArrayList<Member> fpendingList;
	private int fReq;
}
