package com.kh.coddy.board.free.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.coddy.board.free.model.service.FboardService;

@Controller
public class FboardController {
	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired FboardService fboardService;

	@GetMapping("list.fr")
	public String fBoardList() {
		return "board/free/freeListView";
	}
	
	@GetMapping("detail.fr")
	public String fBoardDetail() {
		return "board/free/freeDetailView";
	}
	
	@GetMapping("enrollForm.fr")
	public String fBoardEnrollForm(){
		return "board/free/freeEnrollForm";
	}
	@GetMapping("update.fr")
	public String fBoardUpdate() {
		return "board/free/freeUpdateForm";
	}
	
}
