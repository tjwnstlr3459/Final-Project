package kr.or.directMessage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.directMessage.model.dao.DirectMessageDao;
import kr.or.directMessage.model.vo.DirectMessage;

@Service
public class DirectMessageService {
	@Autowired
	private DirectMessageDao dao;
	
	public int insertDm(DirectMessage dm) {
		return dao.insertDm(dm);
	}

	public ArrayList<DirectMessage> selectAllDm() {
		return (ArrayList<DirectMessage>)dao.selectAllDm();
	}

	public int updateWarningCount(DirectMessage dm) {
		System.out.println("dm서비스");
		return dao.updateWarningCount(dm);
	}

}
