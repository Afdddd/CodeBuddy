package com.kh.coddy.board.free.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.free.model.dao.FboardDao;

@Service
public class FboardServiceImpl implements FboardService{
	@Autowired private SqlSessionTemplate sqlSession;
	@Autowired private FboardDao fboardDao;
}
