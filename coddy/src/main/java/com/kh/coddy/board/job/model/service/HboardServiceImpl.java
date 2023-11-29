package com.kh.coddy.board.job.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.job.model.dao.HboardDao;

@Service
public class HboardServiceImpl implements HboardService {
	@Autowired private SqlSessionTemplate sqlSession;
	@Autowired private HboardDao hboardDao;
}