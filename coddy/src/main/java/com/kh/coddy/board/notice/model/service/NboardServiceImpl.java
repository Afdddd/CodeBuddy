package com.kh.coddy.board.notice.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.notice.model.dao.NboardDao;

@Service
public class NboardServiceImpl {
	@Autowired private SqlSessionTemplate sqlSession;
}