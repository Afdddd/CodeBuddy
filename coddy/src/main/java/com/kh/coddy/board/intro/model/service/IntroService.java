package com.kh.coddy.board.intro.model.service;

import java.util.ArrayList;

import com.kh.coddy.board.intro.model.vo.IBoard;
import com.kh.coddy.board.intro.model.vo.Iattachment;
import com.kh.coddy.board.intro.model.vo.Ireply;
import com.kh.coddy.board.intro.model.vo.IreplyImage;
import com.kh.coddy.board.intro.model.vo.Isearch;
import com.kh.coddy.board.intro.model.vo.Likes;
import com.kh.coddy.board.recruitment.model.vo.Prelation;
import com.kh.coddy.board.recruitment.model.vo.Project;
import com.kh.coddy.board.recruitment.model.vo.Recruitment;
import com.kh.coddy.common.vo.PageInfo;

public interface IntroService {

	// 글 인서트
	int insertBoard(IBoard i);
	
	// 이미지 인서트
	int insertBoardImg(Iattachment ia);

	// 게시글의 총 갯수 조회
	int selectListCount(Isearch is);

	// 전체조회
	ArrayList<IBoard> selectList(PageInfo pi, Isearch is);

	// 이미지 전체조회용
	Iattachment selectattachment(IBoard ib);

	// 태그 가져오기용
	ArrayList<Prelation> getTagInfo(IBoard ib);

	// 좋아요리스트
	Boolean getWishList(IBoard ib,  int mno);

	// 좋아요 기능
	int getWish(Likes iw);

	// 좋아요 제거
	String deleteWish(Likes iw);

	// 좋아요 넣기
	String insertWish(Likes iw);

	// 상세조회 조회수 증가
	int plusView(int ino);

	// 상세조회용 select
	IBoard selectBoard(int ino);

	// 상세조회용 이미지 리스트 가져오기
	ArrayList<Iattachment> getAttachmentList(IBoard ib);

	// 상세
	int getAllWish(int iboardNo);

	// 게시판 글 삭제
	int deleteForm(int iboardNo);

	// 댓글 조회용
	ArrayList<IreplyImage> selectReplyList(int iboardNo);

	// 댓글 작성용
	int insertReply(Ireply r);

	// 댓글 삭제용
	int deletereply(int ireplyNo);
	
	// 댓글 수정용
	int updatereply(Ireply r);

	// 인기게시글
	ArrayList<IBoard> selectTopList();

	// project list 조회
	Project selectProject(IBoard ib);

	// Recruitment list 조회
	Recruitment selectRecruitment(Project p);

	

	
	
	
}