package com.spring.flower.dao;


import java.util.ArrayList;

import com.spring.flower.dto.AskVO;
import com.spring.flower.dto.ProductVO;


public interface ADao {
		
	public ArrayList<AskVO> askList(String id);

	public ArrayList<AskVO> askListTopNum(String pNum);

	public void insertAsk(AskVO aVo);

	public AskVO getOneAsk(String qNum);

	public void updateAsk(AskVO aVo);

	public void deleteAsk(String qNum);
	
	public ArrayList<AskVO> search(String searchStr);

	/*
	 * * 관리자 모드에서 필요한 메소드
	 */
	public ArrayList<AskVO> listAllAsk();

	public AskVO getAsk(int qNum);

	public void updateAskReply(AskVO askVO);

}
