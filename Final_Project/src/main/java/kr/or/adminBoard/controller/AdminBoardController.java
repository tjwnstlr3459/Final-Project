package kr.or.adminBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.adminBoard.model.service.AdminBoardService;

@Controller
public class AdminBoardController {
	@Autowired
	private AdminBoardService service;
}
