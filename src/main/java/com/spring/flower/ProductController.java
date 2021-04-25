package com.spring.flower;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.flower.dao.ADao;
import com.spring.flower.dao.MDao;
import com.spring.flower.dao.ODao;
import com.spring.flower.dao.PDao;
import com.spring.flower.dao.RDao;
import com.spring.flower.dto.AskVO;
import com.spring.flower.dto.BPageVO;
import com.spring.flower.dto.CartVO;
import com.spring.flower.dto.MemberVO;
import com.spring.flower.dto.OrderVO;
import com.spring.flower.dto.ProductVO;
import com.spring.flower.dto.ReviewVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProductController {
	

	@Autowired      //spring설정파일에서 만들어 놓은 bean 객체를 주입받음
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	
	
	@RequestMapping("product")
	public String productKind(HttpServletRequest request, Model model) {
		
		String kindName = "";
		String kind=request.getParameter("kind").trim();
		if(kind.equals("1")) {
			kindName = "꽃다발";
		}else if(kind.equals("2")) {
			kindName = "꽃바구니";
		}else if(kind.equals("3")) {
			kindName = "화환";
		}else if(kind.equals("4")) {
			kindName = "꽃화분";
		}else if(kind.equals("5")) {
			kindName = "미니나무";
		}else if(kind.equals("6")) {
			kindName = "소형나무";
		}else if(kind.equals("7")) {
			kindName = "중형나무";
		}else if(kind.equals("8")) {
			kindName = "기타";
		}
		
		// paging
		String page = (String)request.getParameter("page");
		String pageDataCount = (String)request.getParameter("pageDataCount");
		if(page==null || page.equals("0") || page.equals("")) {
			page="1"; //값이 넘어오지 않았을때 예외 처리
		}
		
		if(pageDataCount==null || pageDataCount.equals("0") || pageDataCount.equals("")) {
			pageDataCount="12"; // 12개로 맞춤
		}
		
		PDao pDAO = sqlSession.getMapper(PDao.class);
		
		// 베스트 상품목록 최근 4개만...
		ArrayList<ProductVO> bestProductList= pDAO.bestListKindProduct(kindName);
		
		// 전체 상품목록
		ArrayList<ProductVO> productList 
		= pDAO.listKindProduct(kindName, page, pageDataCount);
		
		model.addAttribute("bestProductList", bestProductList);
		model.addAttribute("productList", productList);
		
		int totalDataCount = pDAO.dataCount(kindName);
		BPageVO bPageVO = new BPageVO();
		bPageVO.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount), totalDataCount);
		
		model.addAttribute("bPageVO", bPageVO);
		model.addAttribute("kind", kind);
		
		return "product/productKind";
	}	
	
	@RequestMapping("product_detail")
	public String productDetail(HttpServletRequest request, Model model) {
	    String pNum=request.getParameter("pNum").trim();
	    
	    PDao pDAO = sqlSession.getMapper(PDao.class);
	    
	    ProductVO productVO= pDAO.getProduct(pNum);
	    
	    RDao rDao = sqlSession.getMapper(RDao.class);
	    ArrayList<ReviewVO> reviewList = rDao.listProductReview(pNum);
	    
	    ADao askDAO = sqlSession.getMapper(ADao.class);
	    ArrayList<AskVO> askList = askDAO.askListTopNum(pNum);
	    
	    model.addAttribute("productVO", productVO);
	    model.addAttribute("reviewList", reviewList);
	    model.addAttribute("askList", askList);
	    
		return "product/productDetail";
	}	
	
	@RequestMapping("cart_list")
	public String cartList(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		MemberVO mVo = (MemberVO) session.getAttribute("loginUser");
		
		// 로그인 상태인지 확인
		if(mVo == null) {
			return "member/login";
			
		} else {
			
			String id = mVo.getId();
			ODao oDao = sqlSession.getMapper(ODao.class);
			List<CartVO> cartList = oDao.selectAllCartList(id);
			model.addAttribute("cartList", cartList);
		
		}
		return "product/cartList";
	}
	
	@RequestMapping("cart_insert")
	public String cartInsert(HttpServletRequest request, Model model) {
		
		HttpSession session=request.getSession();
		MemberVO mVo = new MemberVO();
		mVo = (MemberVO) session.getAttribute("loginUser");
		String id = mVo.getId();
		
		OrderVO oVo = new OrderVO();
		oVo.setId(id);
		oVo.setpNum(Integer.parseInt(request.getParameter("pNum")));
		oVo.setOrderQ(Integer.parseInt(request.getParameter("orderQ")));
		int o_price = Integer.parseInt(request.getParameter("price")) * Integer.parseInt(request.getParameter("orderQ"));
		oVo.setO_price(o_price);
		
		// cart로
		oVo.setSign("n");
		ODao oDao = sqlSession.getMapper(ODao.class);
		oDao.insertOrder(oVo);
		
		return "redirect:cart_list";
	}
	
	@RequestMapping("cart_update")
	public String cartUpdate(HttpServletRequest request, Model model) {
		
		String orderNum = request.getParameter("orderNum");
	    String orderQ = request.getParameter("orderQ");
	    String o_price = request.getParameter("o_price");
	    ODao oDao = sqlSession.getMapper(ODao.class);
	    oDao.updateCartOrderQty(orderNum, orderQ, o_price);
		
		return "redirect:cart_list";
	}
	
	@RequestMapping("cart_delete")
	public String cartDelete(HttpServletRequest request, Model model) {
		
		String[] cOrderArr = request.getParameterValues("orderNum");
	    
	    for(String cOdN:cOrderArr){
	      ODao oDAO = sqlSession.getMapper(ODao.class);
	      oDAO.deleteCart(cOdN);
	    }
		
		return "redirect:cart_list";
	}
	
	@RequestMapping("order")
	public String cartToOrder(HttpServletRequest request, Model model) {
		
		String[] cOrderArr = request.getParameterValues("orderNum");
		ODao oDAO = sqlSession.getMapper(ODao.class);
	    int point = 0;
	    
	    HttpSession session = request.getSession();
	    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	    String id= loginUser.getId();
	    
	    if( cOrderArr.length > 0) {
	    	for(String cOdN:cOrderArr){
	    		oDAO.updateCartToOrder(cOdN);
	    		point = oDAO.getOrderPoint(cOdN);
	    	}
	    	
	    	MDao mDao = sqlSession.getMapper(MDao.class);
	    	mDao.updateMyPoint(id, point);
	    	
	    	return "redirect:mypage_2";
	    } else {
	    	System.out.println("주문에 실패하였습니다.");
	    	return "redirect:cart_list";
	    }
	}
	
	@RequestMapping("order_insert")
	public String orderInsert(HttpServletRequest request, Model model) {
		
		HttpSession session=request.getSession();
		MemberVO mVo = new MemberVO();
		mVo = (MemberVO) session.getAttribute("loginUser");
		String id = mVo.getId();
		
		OrderVO oVo = new OrderVO();
		oVo.setId(id);
		oVo.setpNum(Integer.parseInt(request.getParameter("pNum")));
		oVo.setOrderQ(Integer.parseInt(request.getParameter("orderQ")));
		int o_price = Integer.parseInt(request.getParameter("price")) * Integer.parseInt(request.getParameter("orderQ"));
		oVo.setO_price(o_price);
		
		// 바로 주문 완료
		oVo.setSign("y");
		ODao oDao = sqlSession.getMapper(ODao.class);
		int odn = oDao.insertOrder(oVo);
		
		//포인트 입력
		MDao mDao = sqlSession.getMapper(MDao.class);
		int point = oDao.getOrderPoint(odn + "");
    	mDao.updateMyPoint(id, point);
    	
    	return "redirect:mypage_2";
	}
	
	
}
