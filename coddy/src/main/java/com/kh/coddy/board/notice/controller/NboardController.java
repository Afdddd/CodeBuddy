package com.kh.coddy.board.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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

import com.kh.coddy.board.notice.model.service.NboardService;
import com.kh.coddy.board.notice.model.vo.Nboard;

@Controller
public class NboardController {
	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired NboardService nboardService;
	
	@GetMapping("list.no")
	public String nBoardList() {
		return "board/notice/noticeListView";
	}
	
	@GetMapping("detail.no")
	public String nBoardDetail() {
		return "board/notice/noticeDetailView";
	}
	
	@GetMapping("enrollForm.no")
	public String nBoardEnrollForm(){
		return "board/notice/noticeEnrollForm";
	}
	
	@GetMapping("update.no")
	public String nBoardUpdate() {
		return "board/notice/noticeUpdateForm";
	}
	
}
