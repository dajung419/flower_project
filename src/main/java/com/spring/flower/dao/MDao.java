package com.spring.flower.dao;

import java.util.ArrayList;

import com.spring.flower.dto.MemberVO;
import com.spring.flower.dto.ProductVO;

public interface MDao {

	public int confirmID(String userid);
	public MemberVO getMember(String id);
	public void insertMember(MemberVO memberVO);
	public ArrayList<MemberVO> listMember(String member_name);
	public void updatemypage(MemberVO mVo);
	public void deleteMember(String id);
	public void updateMyPoint(String id, int point);
	
	public String workerCheck(String userid);
	
}
