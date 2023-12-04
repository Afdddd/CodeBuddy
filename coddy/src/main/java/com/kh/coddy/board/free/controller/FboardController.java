package com.kh.coddy.board.free.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FboardController {

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
