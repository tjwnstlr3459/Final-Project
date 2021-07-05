package kr.or.directMessage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.directMessage.model.vo.DirectMessage;

@Repository
public class DirectMessageDao {
	@Autowired
	private SqlSession session;
	
	public int insertDm(DirectMessage dm) {
		return session.insert("directMessage.insertDm",dm);
	}

	public List selectAllDm() {
		return session.selectList("directMessage.selectAllDm");
	}

	public int updateWarningCount(DirectMessage dm) {
		return session.update("directMessage.updateWarningCount",dm);
	}

	public int insertMultiDm(DirectMessage dm, String[] memberNo) {
		int count = 0;
		for(int i=0;i<memberNo.length;i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("dm", dm);
			map.put("memberNo", memberNo[i]);
			count += session.insert("directMessage.insertMultiDm",map);
		}
		//session.insert("directMessage.insertMultiDm",map)
		System.out.println("insert : " +count);
		return count;
	}

	public List selectDmByName(HashMap<String, String> param) {
		return session.selectList("directMessage.selectDmByName", param);
	}
	
	public List selectUnreadDmByName(HashMap<String, String> param) {
		return session.selectList("directMessage.selectUnreadDmByName", param);
	}

	public int selectUnreadDm(String memberNick) {
		return session.selectOne("directMessage.selectUnreadDm", memberNick);
	}

	public int updateDm(DirectMessage dm) {
		return session.update("directMessage.updateReadStatus", dm);
	}

	public DirectMessage selectOneDm(DirectMessage dm) {
		return session.selectOne("directMessage.selectOneDm", dm);
	}

	public int selectAllDmCount(String memberNick) {
		return session.selectOne("directMessage.selectAllDmCount", memberNick);
	}

}
