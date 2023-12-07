package com.kh.coddy.board.job.model.service;

import java.util.ArrayList;

import com.kh.coddy.board.job.model.vo.HSearch;
import com.kh.coddy.board.job.model.vo.Hattachment;
import com.kh.coddy.board.job.model.vo.Hboard;
import com.kh.coddy.board.job.model.vo.Hrelation;
import com.kh.coddy.board.job.model.vo.Hwishlist;
import com.kh.coddy.common.vo.PageInfo;

public interface HboardService {
	int insertBoard(Hboard h);
	boolean insertTag(Hrelation hr);
	int insertThumb(Hattachment ha);
	int selectListCount(HSearch hs);
	ArrayList<Hboard> selectList(PageInfo pi, HSearch hs);
	Hattachment getThumbOne(Hboard h);
	ArrayList<Hrelation> getTagInfo(Hboard h);
	Boolean getWishList(Hboard h, int mno);
	int getWish(Hwishlist hw);
	String deleteWish(Hwishlist hw);
	String insertWish(Hwishlist hw);
	int plusView(int hno);
	Hboard selectBoard(int hno);
	ArrayList<Hattachment> getAttachmentList(Hboard hb);
	int addFile(Hattachment ha);
	int minusFile(int ano);
	int deleteBoard(int hboardNo);
}