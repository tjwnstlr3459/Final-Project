package kr.or.member.model.vo;

import java.util.ArrayList;

import lombok.Data;
@Data
public class MemberPageData {
	private String navigation;
	private ArrayList<Member> list;
	public MemberPageData(String navigation, ArrayList<Member> list) {
		super();
		this.navigation = navigation;
		this.list = list;
	}
	
}
