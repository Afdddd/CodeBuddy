package com.kh.coddy.common.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.common.chat.model.vo.ChatMessage;
import com.kh.coddy.common.chat.model.vo.ChatRoom;

@Repository
public class ChatDao {
	
	public ChatRoom selectChatRoom(SqlSessionTemplate sqlSession, String roomId) {
		return sqlSession.selectOne("chatMapper.selectChatRoom",roomId);
	}
	public int insertMessage(SqlSessionTemplate sqlSession, ChatMessage msg) {
		return sqlSession.insert("chatMapper.insertMessage",msg);
	}
	public List<ChatMessage> messageList(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.selectList("chatMapper.messageList",roomId);
	}
	public int createChat(SqlSessionTemplate sqlSession,ChatRoom room) {
		return sqlSession.insert("chatMapper.createChat",room);
	}
		
}
