package com.spring.flower.dao;

import java.util.ArrayList;

import com.spring.flower.dto.ProductVO;
import com.spring.flower.dto.ReviewVO;

public interface RDao {
	public ArrayList<ReviewVO> listReview(String page, String pageDataCount);

	public String listProductPic(String orderNum);

	public ArrayList<ReviewVO> listProductReview(String pNum);

	public int dataCount();

	public void writeReview(ReviewVO rVo);

	public ReviewVO getReview(String rev_num);

	public void updateRevReview(ReviewVO rVo);

	public void deleteRevReview(ReviewVO rVo);

	public void updateReadCount(String rev_num);

	public int insertProduct(ProductVO product);

	public void updateReview(ReviewVO rVo);

	public void deleteReview(String rev_num);
	
	public ArrayList<ReviewVO> search(String searchStr);

	/* 이전 리뷰번호 구하기 */
	public String getPrevRevNum(String rev_num);

	/* 이후 리뷰번호 구하기 */
	public String getNextRevNum(String rev_num);
	
}
