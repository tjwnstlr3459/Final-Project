package kr.or.adminBoard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.adminBoard.model.dao.AdminBoardDao;

@Service
public class AdminBoardService {
	@Autowired
	private AdminBoardDao dao;
}
