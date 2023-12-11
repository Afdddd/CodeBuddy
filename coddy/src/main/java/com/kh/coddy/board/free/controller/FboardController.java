package com.kh.coddy.board.free.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.coddy.board.free.model.service.FboardService;
import com.kh.coddy.board.free.model.service.Fboard;

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
