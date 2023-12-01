package com.kh.coddy.board.recruitment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class recruitmentController {

	@GetMapping("list.rec")
	public String recruitmentList() {
		return "board/recruitment/recruitmentListView";
	}	
	@GetMapping("detail.rec")
	public String recruitmentDetail() {
		return "board/recruitment/recruitmentDetailView";
	}
	@GetMapping("room.rec1")
	public String roomEnter1(){
		return "project/room1";
	}
	@GetMapping("room.rec2")
	public String roomEnter2(){
		return "project/room2";
	}
	@GetMapping("enrollForm.rec")
	public String enrollForm(){
		return "board/recruitment/recruitmentEnrollForm";
	}
}
