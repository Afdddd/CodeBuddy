package com.kh.coddy.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.member.model.vo.Company;

@Repository
public class CompanyDao {
	public int companyCheck(SqlSessionTemplate sqlSession, String id) { return sqlSession.selectOne("companyMapper.companyCheck", id); }
	public int insertCompany(SqlSessionTemplate sqlSession, Company c) { return sqlSession.insert("companyMapper.insertCompany", c); }
}