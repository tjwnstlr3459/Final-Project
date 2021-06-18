package kr.or.club.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.club.model.dao.ClubDao;
import kr.or.club.model.vo.Club;
import kr.or.member.model.vo.Member;

@Service
public class ClubService {

	@Autowired
	private ClubDao dao;

	public ArrayList<Club> memberClubList(Member m) {
		List<Club> list = dao.memberClubList(m);
		return (ArrayList<Club>)list;
	}

	public ArrayList<Club> memberClubPosts(Member m) {
		List<Club> list = dao.memberClubPosts(m);
		return (ArrayList<Club>)list;
	}
}
