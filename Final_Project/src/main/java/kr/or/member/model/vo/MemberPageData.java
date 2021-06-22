package kr.or.member.model.vo;

import java.util.ArrayList;

import kr.or.category.model.vo.Category;
import lombok.Data;
@Data
public class MemberPageData {
	private String navigation;
	private ArrayList<Member> list;
	private ArrayList<Category> cgList;
	public MemberPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberPageData(String navigation, ArrayList<Member> list, ArrayList<Category> cgList) {
		super();
		this.navigation = navigation;
		this.list = list;
		this.cgList = cgList;
	}
	
	
}
