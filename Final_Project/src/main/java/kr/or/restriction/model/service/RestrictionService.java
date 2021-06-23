package kr.or.restriction.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.restriction.model.dao.RestrictionDao;
import kr.or.restriction.model.vo.Restriction;

@Service
public class RestrictionService {
	@Autowired
	private RestrictionDao dao;

	@Transactional
	public int insertRest(Restriction rest) {
		return dao.insertRest(rest);
	}
	@Transactional
	public int updateMemberGrade(Restriction rest) {
		return dao.updateMemberGrade(rest);
	}
	@Transactional
	public void deleteRestEndDate() {
		int result1 = dao.updateEndRestMember();
		int result2 = dao.deleteRestEndDate();
		System.out.println("회원 등급 update : "+result1);
		System.out.println("이용제한 회원 delete : "+result2);
	}
}
