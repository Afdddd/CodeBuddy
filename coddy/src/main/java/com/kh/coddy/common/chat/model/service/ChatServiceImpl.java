package com.kh.coddy.common.chat.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.common.chat.model.dao.ChatDao;
import com.kh.coddy.common.chat.model.vo.ChatMessage;
import com.kh.coddy.common.chat.model.vo.ChatRoom;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao cDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ChatRoom selectChatRoom(String roomId) {
		return cDao.selectChatRoom(sqlSession, roomId);
	}

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		return cDao.insertMessage(sqlSession,chatMessage);	
	}

	@Override
	public List<ChatMessage> messageList(int roomId) {
		return cDao.messageList(sqlSession,roomId);		
	}

	@Override
	public int createChat(ChatRoom room) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ChatRoom searchChatRoom(ChatRoom room) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatRoom> chatRoomList(String userEmail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectUnReadCount(ChatMessage message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCount(ChatMessage message) {
		// TODO Auto-generated method stub
		return 0;
	}

}
