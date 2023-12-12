package com.kh.coddy.board.notice.model.service;

import java.util.ArrayList;

import com.kh.coddy.board.notice.model.vo.Nboard;
import com.kh.coddy.board.notice.model.vo.Nattachment;
import com.kh.coddy.common.vo.PageInfo;

public interface NboardService {
	
	int selectListCount();

    ArrayList<Nboard> selectList(PageInfo pi);

    int insertBoard(Nboard n);

    int increaseCount(int nboardNo);

    Nboard selectBoard(int nboardNo);

    int deleteBoard(int nboardNo);

    int updateBoard(Nboard n);

    ArrayList<Nattachment> selectAttachmentList(int nboardNo);

    Nattachment selectOneAttachment(int nattachmentNo);

    int insertAttachment(Nattachment nattachment);

    int updateAttachment(Nattachment nattachment);

    int deleteAttachment(int nattachmentNo);

}
