package com.kh.coddy.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.member.model.dao.CompanyDao;

@Service
public class CompanyServiceImpl implements CompanyService {
	@Autowired private CompanyDao companyDao;
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override public int companyCheck(String id) { return companyDao.companyCheck(sqlSession, id); }
}