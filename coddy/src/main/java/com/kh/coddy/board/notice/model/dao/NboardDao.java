package com.kh.coddy.board.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.notice.model.vo.Nboard;
import com.kh.coddy.board.notice.model.vo.Nattachment;

@Repository
public class NboardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 게시글 등록
	public int insertNboard(Nboard n) {
		return sqlSession.insert("nboardMapper.insertNboard", n);
	}

	// 게시글 수정
	public int updateNboard(Nboard n) {
		return sqlSession.update("nboardMapper.updateNboard", n);
	}

	// 게시글 삭제
	public int deleteNboard(int nboardNo) {
		return sqlSession.update("nboardMapper.deleteNboard", nboardNo);
	}

	// 게시글 상세 조회
	public Nboard selectNboard(int nboardNo) {
		return sqlSession.selectOne("nboardMapper.selectNboard", nboardNo);
	}

	// 게시글 목록 조회
	public List<Nboard> selectNboardList() {
		return sqlSession.selectList("nboardMapper.selectNboardList");
	}

	// 게시글 조회수 증가
	public int increaseNboardViews(int nboardNo) {
		return sqlSession.update("nboardMapper.increaseNboardViews", nboardNo);
	}

	// 첨부파일 등록
	public int insertNattachment(Nattachment na) {
		return sqlSession.insert("nboardMapper.insertNattachment", na);
	}

	// 첨부파일 수정
	public int updateNattachment(Nattachment na) {
		return sqlSession.update("nboardMapper.updateNattachment", na);
	}

	// 첨부파일 삭제
	public int deleteNattachment(int nattachmentNo) {
		return sqlSession.delete("nboardMapper.deleteNattachment", nattachmentNo);
	}

	// 첨부파일 목록 조회
	public List<Nattachment> selectNattachmentList(int nboardNo) {
		return sqlSession.selectList("nboardMapper.selectNattachmentList", nboardNo);
	}

	// 첨부파일 상세 조회
	public Nattachment selectOneNattachment(int nattachmentNo) {
		return sqlSession.selectOne("nboardMapper.selectOneNattachment", nattachmentNo);
	}
}
