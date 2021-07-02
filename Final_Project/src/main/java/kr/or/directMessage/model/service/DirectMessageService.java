package kr.or.directMessage.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.directMessage.model.dao.DirectMessageDao;
import kr.or.directMessage.model.vo.DirectMessage;
import kr.or.directMessage.model.vo.DirectMessageData;

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
	
	@Transactional
	public int insertMultiDm(DirectMessage dm, String[] memberNo) {		
		return dao.insertMultiDm(dm,memberNo);
	}

	public DirectMessageData selectDmByName(String memberNick) {
		DirectMessageData dmData = new DirectMessageData();
		dmData.setDmList((ArrayList<DirectMessage>)dao.selectDmByName(memberNick));
		dmData.setUnread(dao.selectUnreadDm(memberNick));
		return dmData;		
	}
	
	@Transactional
	public int updateDm(DirectMessage dm) {
		return dao.updateDm(dm);
	}

	public DirectMessage userSelectDm(DirectMessage dm) {
		return dao.selectOneDm(dm);
	}

}
