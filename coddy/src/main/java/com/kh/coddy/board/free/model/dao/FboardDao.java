package com.kh.coddy.board.free.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.free.model.vo.Freply;
import com.kh.coddy.board.free.model.vo.Fboard;
import com.kh.coddy.board.free.model.vo.Fattachment;


@Repository
public class FboardDao {

    @Autowired
    private SqlSession sqlSession;

    // FBOARD
    public int insertBoard(FBoard f) {
        return sqlSession.insert("fboard.insertBoard", f);
    }

    public FBoard selectBoard(int fboardNo) {
        return sqlSession.selectOne("fboard.selectBoard", fboardNo);
    }

    public int updateBoard(Fboard f) {
        return sqlSession.update("fboard.updateBoard", f);
    }

    public int deleteBoard(int fboardNo) {
        return sqlSession.update("fboard.deleteBoard", fboardNo);
    }

    // FREPLY
    public List<Freply> selectReplyList(int fboardNo) {
        return sqlSession.selectList("freply.selectReplyList", fboardNo);
    }

    public int insertReply(FReply fr) {
        return sqlSession.insert("freply.insertReply", fr);
    }

    // FATTACHMENT
    public List<Fattachment> selectAttachmentList(int fboardNo) {
        return sqlSession.selectList("fattachment.selectAttachmentList", fboardNo);
    }

    public Fattachment selectOneAttachment(int fattachmentNo) {
        return sqlSession.selectOne("fattachment.selectOneAttachment", fattachmentNo);
    }

    public int insertAttachment(FAttachment fattachment) {
        return sqlSession.insert("fattachment.insertAttachment", fattachment);
    }

    public int updateAttachment(FAttachment fattachment) {
        return sqlSession.update("fattachment.updateAttachment", fattachment);
    }

    public int deleteAttachment(int fattachmentNo) {
        return sqlSession.delete("fattachment.deleteAttachment", fattachmentNo);
    }
	
}
