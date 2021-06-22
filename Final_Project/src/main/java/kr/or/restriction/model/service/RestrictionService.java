package kr.or.restriction.model.service;

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
}
