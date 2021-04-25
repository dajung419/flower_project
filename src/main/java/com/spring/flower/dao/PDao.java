package com.spring.flower.dao;

import java.util.ArrayList;

import com.spring.flower.dto.ProductVO;

public interface PDao {
	public ProductVO getProduct(String pNum);

	public ArrayList<ProductVO> bestListKindProduct(String kind);

	public ArrayList<ProductVO> listKindProduct(String kind, String page, String pageDataCount);

	public int dataCount(String kind);

	public ProductVO getProductByOrderNum(String orderNum);
	
	public ArrayList<ProductVO> search(String searchStr);

	/*
	 * * 관리자 모드에서 사용되는 메소드 *
	 */

	public int totalRecord(String product_name);

	static int view_rows = 5; // 페이지의 개수
	static int counts = 5; // 한 페이지에 나타낼 상품의 개수

	// 페이지 이동을 위한 메소드
	public String pageNumber(int tpage, String pName);

	// 상품정보를 얻어오기위한 메소드
	public ProductVO selectProductByCode(String pNum);

	// 상품등록을위한 메소드
	public int insertProduct(ProductVO product);

	// 상품수정메소드
	public int updateProduct(ProductVO product);

	// 상품삭제메소드
	public void deleteProduct(String pNum);

	// 상품검색을 위한 메소드
	public ArrayList<ProductVO> SearchlistProduct(String page, String pageDataCount, String key);

	public int PdataCount();
	
}
