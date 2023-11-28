package com.kh.coddy.board.job.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.coddy.board.job.model.service.HboardService;

@Controller
public class HboardController {
	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired private HboardService hboardService;

	@GetMapping(value="listView.hb") public String listView(HttpSession session) { return "board/job/hboardListView"; }
}