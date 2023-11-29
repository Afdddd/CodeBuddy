package com.kh.coddy.board.code.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.code.model.dao.CboardDao;
@Service
public class CboardServiceImpl implements CboardService {

	@Autowired
	private CboardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
