package com.kh.coddy.board.recruitment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class recruitmentController {

	@GetMapping("list.rec")
	public String recruitmentList() {
		return "board/recruitment/recruitmentListView";
	}
}
