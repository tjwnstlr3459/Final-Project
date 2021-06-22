package kr.or.newclub.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
import kr.or.newclub.model.dao.newClubDao;

@Service
public class newClubService {


@Autowired
private newClubDao dao;

public List boardList() {
	return dao.boardList();

}

public int totalCount(Member m) {
    return dao.totalCount(m);
 }


}
