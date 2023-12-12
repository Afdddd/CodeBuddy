package com.kh.coddy.board.free.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.coddy.board.free.model.dao.FboardDao;
import com.kh.coddy.board.free.model.vo.Fboard;
import com.kh.coddy.board.free.model.vo.Freply;
import com.kh.coddy.board.free.model.vo.Fattachment;
import com.kh.coddy.common.vo.PageInfo;

import java.util.ArrayList;

@Service
public class FboardServiceImpl implements FboardService {
    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private FboardDao fboardDao;

    @Override
    public int selectListCount() {
        return fboardDao.selectListCount(sqlSession);
    }

    @Override
    public ArrayList<Fboard> selectList(PageInfo pi) {
        return fboardDao.selectList(sqlSession, pi);
    }

    @Override
    @Transactional
    public int insertBoard(Fboard f) {
        return fboardDao.insertBoard(sqlSession, f);
    }

    @Override
    @Transactional
    public int increaseCount(int fboardNo) {
        return fboardDao.increaseCount(sqlSession, fboardNo);
    }

    @Override
    public Fboard selectBoard(int fboardNo) {
        return fboardDao.selectBoard(sqlSession, fboardNo);
    }

    @Override
    @Transactional
    public int deleteBoard(int fboardNo) {
        return fboardDao.deleteBoard(sqlSession, fboardNo);
    }

    @Override
    @Transactional
    public int updateBoard(Fboard f) {
        return fboardDao.updateBoard(sqlSession, f);
    }

    @Override
    public ArrayList<Freply> selectReplyList(int fboardNo) {
        return fboardDao.selectReplyList(sqlSession, fboardNo);
    }

    @Override
    public int insertReply(Freply fr) {
        return fboardDao.insertReply(sqlSession, fr);
    }

    @Override
    public ArrayList<Fboard> selectTopBoardList() {
        return fboardDao.selectTopBoardList(sqlSession);
    }

    @Override
    public ArrayList<Fattachment> selectAttachmentList(int fboardNo) {
        return fboardDao.selectAttachmentList(sqlSession, fboardNo);
    }

    @Override
    @Transactional
    public int insertAttachment(Fattachment fa) {
        return fboardDao.insertAttachment(sqlSession, fattachment);
    }

    @Override
    public Fattachment selectOneAttachment(int fattachmentNo) {
        return fboardDao.selectOneAttachment(sqlSession, fattachmentNo);
    }

    @Override
    @Transactional
    public int deleteAttachment(int fattachmentNo) {
        return fboardDao.deleteAttachment(sqlSession, fattachmentNo);
    }
}
