package com.kh.coddy.common.chat.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.coddy.common.chat.model.service.ChatService;
import com.kh.coddy.common.chat.model.vo.ChatMember;
import com.kh.coddy.common.chat.model.vo.ChatMessage;

import lombok.extern.slf4j.Slf4j;

@Controller @Slf4j
public class ChatController {    
	
	@Autowired
	private ChatService cService;
	
	@GetMapping(value = "room.rec", params="roomId")
	public void messageList(@RequestParam(name="roomId") int roomId, HttpServletResponse response) throws JsonIOException, IOException {
		
		List<ChatMessage> mList = cService.messageList(roomId); 
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(mList,response.getWriter());
		
	}
	
	@GetMapping("outChat.do")
	public void outChat(int projectNo, int memberNo, String role) {
		
	}

	@ResponseBody
	@GetMapping("getApply.rec")
	public String getApply(int projectNo, String position) {
		int result = cService.getApply(new ChatMember(projectNo,0,position));
		return String.valueOf(result);		
	}
	@GetMapping("insertApply.rec")
	public void insertApply(int projectNo, int memberNo, String position, int maxPersonnel, HttpSession session) {		
		ChatMember cm = new ChatMember(projectNo,memberNo, position);		
		session.setAttribute("chatMember", cm);
		session.setAttribute("maxPersonnel", maxPersonnel);
	}
	
}  