package com.kh.coddy.common.calendar.model.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @Setter @ToString
public class Schedule {
	private String eventTitle;
	private String startDate;
	private String endDate;
	private String projcetNo;
}
