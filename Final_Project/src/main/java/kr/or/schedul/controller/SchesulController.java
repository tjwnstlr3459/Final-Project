package kr.or.schedul.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.or.restriction.model.service.RestrictionService;

@Component
public class SchesulController {
	@Autowired
	private RestrictionService restService;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void restCheckDate() {			//매일 12시에 이용제한 회원 종료일을 체크하며 종료된 회원은 rest테이블에서 삭제 > 회원 등급 2로 변경
//		System.out.println("스케쥴 테스트!!");
		System.out.println("스케쥴 시작!!");
		restService.deleteRestEndDate();
		System.out.println("스케쥴 종료!!");
	}
}
