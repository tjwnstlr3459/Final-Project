package kr.or.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.AdminCount;
import kr.or.admin.model.vo.Visit;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;

	public AdminCount selectAdminCount() {
		return dao.selectAdminCount();
	}
	@Transactional
	public int insertVisit(String visitorIp) {
		int result = 0;
		if(dao.searchIp(visitorIp) == null) {
			result = dao.insertVisit(visitorIp);
		}
		return result;
	}
	public int selectVisit(Visit selectType) {
		return dao.selectVisit(selectType);
	}
}
