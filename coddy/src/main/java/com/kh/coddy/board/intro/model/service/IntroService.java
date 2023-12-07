package com.kh.coddy.board.intro.model.service;

import java.util.ArrayList;

import com.kh.coddy.board.intro.model.vo.IBoard;
import com.kh.coddy.board.intro.model.vo.Iattachment;
import com.kh.coddy.common.vo.PageInfo;

public interface IntroService {

	// 글 인서트
	int insertBoard(IBoard i);
	
	// 이미지 인서트
	int insertBoardImg(Iattachment ia);

	// 게시글의 총 갯수 조회
	int selectListCount();

	// 전체조회
	ArrayList<IBoard> selectList(PageInfo pi);
	
	
}