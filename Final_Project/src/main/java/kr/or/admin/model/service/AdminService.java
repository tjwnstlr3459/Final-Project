package kr.or.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.AdminCount;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;

	public AdminCount selectAdminCount() {
		return dao.selectAdminCount();
	}
}
