package com.spring.flower.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.spring.flower.dto.AskVO;
import com.spring.flower.dto.NoticeVO;

import util.DBManager;


public interface NDao {

	public int dataCount();

	public ArrayList<NoticeVO> listNotice(String page, String pageDataCount, String yOrN);

	// 게시판 글 상세 내용 보기 :글번호로 찾아온다. : 실패 null,
	public NoticeVO selectOneBoard(String notiNum);
	
	public ArrayList<NoticeVO> selectAllBoards();

	public ArrayList<NoticeVO> selectAllFaqBoards();

	public void insertBoard(NoticeVO bVo);

	public void updateBoard(NoticeVO bVo);

	public void deleteBoard(String notiNum);

}
