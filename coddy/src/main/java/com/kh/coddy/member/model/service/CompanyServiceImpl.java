package com.kh.coddy.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.member.model.dao.CompanyDao;
import com.kh.coddy.member.model.vo.Company;

@Service
public class CompanyServiceImpl implements CompanyService {
	@Autowired private CompanyDao companyDao;
	@Autowired private SqlSessionTemplate sqlSession;
	
	@Override public int companyCheck(String id) { return companyDao.companyCheck(sqlSession, id); }
	@Override public int insertCompany(Company c) { return companyDao.insertCompany(sqlSession, c); }
	@Override public Company login(Company c) { return companyDao.login(sqlSession, c); }
}