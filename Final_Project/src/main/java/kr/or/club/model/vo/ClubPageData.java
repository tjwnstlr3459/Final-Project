package kr.or.club.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ClubPageData {
	private String navigation;
	private ArrayList<Club> list;
}
