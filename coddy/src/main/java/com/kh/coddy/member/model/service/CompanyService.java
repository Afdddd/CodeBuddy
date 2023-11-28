package com.kh.coddy.member.model.service;

import com.kh.coddy.member.model.vo.Company;

public interface CompanyService {
	int companyCheck(String id);
	int insertCompany(Company c);
}