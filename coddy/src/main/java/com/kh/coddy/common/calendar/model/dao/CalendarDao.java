package com.kh.coddy.common.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.common.calendar.model.vo.Schedule;


@Repository
public class CalendarDao {
	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule sc) {
		return sqlSession.insert("calendarMapper.mapper",sc);
	}
}
