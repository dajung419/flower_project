package com.spring.flower.dao;

import java.util.ArrayList;
import java.util.List;

import com.spring.flower.dto.CartVO;
import com.spring.flower.dto.OrderVO;


public interface ODao {
	public int insertOrder(OrderVO oVO);

//장바구니 리스트 조회
	public List<CartVO> selectAllCartList(String id);

	public void deleteCart(String cOdN);

	public void updateCartToOrder(String cOdN);

	public void updateCartOrderQty(String orderNum, String orderQ, String o_price);

//	mypage2 주문내역 불러오기
	public ArrayList<CartVO> ViewCartList(String id);

	public int getOrderPoint(String orderNum);

	public CartVO Detail(String orderNum);

///////////////////////////관리자모드에서 사용되는 메소드 /////////////////////////////

	public ArrayList<OrderVO> listOrder(String id);

	public void updateOrderResult(String orderNum);

}
