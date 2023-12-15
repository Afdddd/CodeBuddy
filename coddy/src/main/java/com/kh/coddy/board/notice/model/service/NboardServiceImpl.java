package com.kh.coddy.board.notice.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.coddy.board.notice.model.dao.NboardDao;
import com.kh.coddy.board.notice.model.vo.Nattachment;
import com.kh.coddy.board.notice.model.vo.Nboard;
import com.kh.coddy.common.vo.PageInfo;

@Service
public class NboardServiceImpl implements NboardService{

    @Autowired
    private NboardDao nboardDao;

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public int selectListCount() {
        return nboardDao.selectListCount(sqlSession);
    }

    @Override
    public ArrayList<Nboard> selectList(PageInfo pi) {
        return nboardDao.selectList(sqlSession, pi);
    }

    @Override
    @Transactional
    public int insertBoard(Nboard n) {
        return nboardDao.insertBoard(sqlSession, n);
    }

    @Override
    @Transactional
    public int increaseCount(int nboardNo) {
        return nboardDao.increaseCount(sqlSession, nboardNo);
    }

    @Override
    public Nboard selectBoard(int nboardNo) {
        return nboardDao.selectBoard(sqlSession, nboardNo);
    }

    @Override
    @Transactional
    public int deleteBoard(int nboardNo) {
        return nboardDao.deleteBoard(sqlSession, nboardNo);
    }

    @Override
    public ArrayList<Nattachment> selectAttachmentList(int nboardNo) {
        return nboardDao.selectAttachmentList(sqlSession, nboardNo);
    }

    @Override
    public int insertAttachment(Nattachment nattachment) {
        return nboardDao.insertAttachment(sqlSession, nattachment);
    }

    @Override
    public Nattachment selectOneAttachment(int nattachmentNo) {
        return nboardDao.selectOneAttachment(sqlSession, nattachmentNo);
    }

    @Override
    public int deleteAttachment(int nattachmentNo) {
        return nboardDao.deleteAttachment(sqlSession, nattachmentNo);
    }

    @Override
    public int updateBoard(Nboard n) {
        return nboardDao.updateBoard(sqlSession, n);
    }

    @Override
    public int updateAttachment(Nattachment nattachment) {
        return nboardDao.updateAttachment(sqlSession, nattachment);
    }

	
}