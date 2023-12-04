package com.kh.coddy.board.intro.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@GetMapping("introlist.bo")
	public String selectList() {
		
		
		
		return "board/intro/introListView";
	
		
	}
	
	@RequestMapping("introForm.bo")
	public String selectEnrollForm() {
		
		return "board/intro/introEnrollForm";
	}
	
}