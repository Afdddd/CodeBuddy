package com.kh.coddy.board.job.model.service;

import com.kh.coddy.board.job.model.vo.Hattachment;
import com.kh.coddy.board.job.model.vo.Hboard;
import com.kh.coddy.board.job.model.vo.Hrelation;

public interface HboardService {
	int insertBoard(Hboard h);
	boolean insertTag(Hrelation hr);
	int insertThumb(Hattachment ha);
}