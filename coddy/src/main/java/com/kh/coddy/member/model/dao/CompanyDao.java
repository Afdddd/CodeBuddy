package com.kh.coddy.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDao {
	public int companyCheck(SqlSessionTemplate sqlSession, String id) { return sqlSession.selectOne("companyMapper.companyCheck", id); }
}