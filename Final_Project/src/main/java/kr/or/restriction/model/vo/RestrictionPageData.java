package kr.or.restriction.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class RestrictionPageData {
	private String navigation;
	private ArrayList<Restriction> list;
	public RestrictionPageData(String navigation, ArrayList<Restriction> list) {
		super();
		this.navigation = navigation;
		this.list = list;
	}
	
}
