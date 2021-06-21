package kr.or.directMessage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.directMessage.model.dao.DirectMessageDao;
import kr.or.directMessage.model.vo.DirectMessage;

@Service
public class DirectMessageService {
	@Autowired
	private DirectMessageDao dao;
	@Transactional
	public int insertDm(DirectMessage dm) {
		return dao.insertDm(dm);
	}

	public ArrayList<DirectMessage> selectAllDm() {
		return (ArrayList<DirectMessage>)dao.selectAllDm();
	}
	@Transactional
	public int updateWarningCount(DirectMessage dm) {
		return dao.updateWarningCount(dm);
	}

}
