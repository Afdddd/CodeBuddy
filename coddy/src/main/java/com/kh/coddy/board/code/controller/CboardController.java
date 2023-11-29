package com.kh.coddy.board.code.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.coddy.board.code.model.service.CboardService;

@Controller
public class CboardController {

		@Autowired
		private CboardService cboardService;
		
		@GetMapping("list.co")
		public String cboardList() {
			return "board/code/codeListView";
		}
		
		@GetMapping("detail.co")
		public String cboardDetail() {
			return "board/code/codeDetailView";
		}
	
}
