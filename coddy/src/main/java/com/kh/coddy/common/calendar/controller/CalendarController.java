package com.kh.coddy.common.calendar.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.coddy.common.calendar.model.service.CalendarService;
import com.kh.coddy.common.calendar.model.vo.Schedule;

import lombok.extern.slf4j.Slf4j;

@Slf4j @Controller
public class CalendarController {
	
	@Autowired
	public CalendarService calService;

	@PostMapping("insertSchedule.cal")
	@ResponseBody
	public String inserSchedule(@RequestBody List<Map<String, Object>> param) {
	    DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
	    DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm", Locale.KOREA);

	    for (Map<String, Object> list : param) {
	        String eventName = (String) list.get("title");
	        String startDateString = (String) list.get("start");
	        log.info("start={}", startDateString);
	        String endDateString = (String) list.get("end");
	        String pno = (String) list.get("pno");

	        LocalDateTime startDateUTC = LocalDateTime.parse(startDateString, inputFormatter);
	        LocalDateTime endDateUTC = LocalDateTime.parse(endDateString, inputFormatter);

	        LocalDateTime startDate = startDateUTC.plusHours(9);
	        LocalDateTime endDate = endDateUTC.plusHours(9);

	        String formattedStartDate = startDate.format(outputFormatter);
	        String formattedEndDate = endDate.format(outputFormatter);

	        Schedule sc = new Schedule(eventName, formattedStartDate, formattedEndDate, pno);
	        log.info("sc={}", sc);
	        calService.insertSchedule(sc);
	    }

	    return "success";
	}
}
