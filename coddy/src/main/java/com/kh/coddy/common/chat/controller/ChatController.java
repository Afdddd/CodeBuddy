package com.kh.coddy.common.chat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.kh.coddy.common.chat.model.vo.Chat;
import com.kh.coddy.common.chat.model.vo.ChatRecord;

@Controller
public class ChatController {    
	// 채팅 메세지 전달
    @MessageMapping("")
    @SendTo("")
    public ChatRecord sendMsg(Chat c, ChatRecord chatr) {
        return null;
    }
}