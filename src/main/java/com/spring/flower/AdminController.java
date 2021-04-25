package com.spring.flower;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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
import org.springframework.web.multipart.MultipartFile;

import com.spring.flower.dao.ADao;
import com.spring.flower.dao.MDao;
import com.spring.flower.dao.NDao;
import com.spring.flower.dao.ODao;
import com.spring.flower.dao.PDao;
import com.spring.flower.dto.AskVO;
import com.spring.flower.dto.BPageVO;
import com.spring.flower.dto.MemberVO;
import com.spring.flower.dto.NoticeVO;
import com.spring.flower.dto.OrderVO;
import com.spring.flower.dto.ProductVO;


@Controller
public class AdminController {
	

	@Autowired      //spring설정파일에서 만들어 놓은 bean 객체를 주입받음
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("admin_login_form")
	public String adminIndex() {
		return "admin/main";
	}
	
	@RequestMapping("admin_login")
	public String adminLogin(HttpServletRequest request, Model model) {
		
		String msg = "";
	    String workerId = request.getParameter("workerId").trim();
	    String workerPwd = request.getParameter("workerPwd").trim();

	    MDao mDao = sqlSession.getMapper(MDao.class);
	    
	    int result = 0;
	    
	    String ckResult = mDao.workerCheck(workerId);
	    if(ckResult != null) {
			if (ckResult.equals(workerPwd)) {
				result = 1; // 비밀번호 마저도 일치
			} else {
				result = -1;
			}
	    }
	    
	    if (result == 1) {// 로그인 성공
	      HttpSession session = request.getSession();
	      session.setAttribute("workerId", workerId);
	      return "redirect:admin_product_list";
	      
	    } else if (result == -1) {
	      msg = "비밀번호를 확인하세요.";
	    } else if (result == 0) {
	      msg = "아이디를 확인하세요.";
	    }
	    model.addAttribute("message", msg);
	    return "admin/main";
	}
	
	@RequestMapping("admin_logout")
	public String adminLogout(HttpServletRequest request, Model model) {
		
		HttpSession session=request.getSession(false);
	    if(session!=null){
	      session.invalidate();
	      model.addAttribute("message", "");
	    }
		return "redirect:index";
	}
	
	@RequestMapping("admin_product_list")
	public String adminProductList(HttpServletRequest request, Model model) {
		
		// paging
		String key = request.getParameter("key");
		if(key == null) {
			key = "";
		}
		String page = (String)request.getParameter("page");
		String pageDataCount = (String)request.getParameter("pageDataCount");
		
		if(page==null || page.equals("0") || page.equals("")) {
			page="1"; //값이 넘어오지 않았을때 예외 처리
		}
		
		if(pageDataCount==null || pageDataCount.equals("0") || pageDataCount.equals("")) {
			pageDataCount="12"; // 12개로 맞춤
		}
		PDao pDAO = sqlSession.getMapper(PDao.class);
	 
	    ArrayList<ProductVO> productList 
		= pDAO.SearchlistProduct(page, pageDataCount, key);

	     
	    model.addAttribute("productList",productList);
	    int totalDataCount = pDAO.PdataCount();
	    BPageVO bPageVO = new BPageVO();
		bPageVO.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount), totalDataCount);
		
		model.addAttribute("bPageVO", bPageVO);
		
		model.addAttribute("key", key);
		
		return "admin/product/productList";
	}
	
	@RequestMapping("admin_product_write_form")
	public String adminProductWriteform() {
		return "admin/product/productWrite";
	}
	
	@RequestMapping("admin_product_write")
	public String adminProductWrite(HttpServletRequest request, Model model, MultipartFile pic) {
			String major = request.getParameter("major");
		    if(major.equals("꽃")) {
		    	major = "flower/";
		    } else {
		    	major = "tree/";
		    }
//		    UUID uuid = UUID.randomUUID();
		    String picName = major +pic.getOriginalFilename();
		    
		    logger.info("파일 이름: {}", pic.getOriginalFilename());
		    logger.info("파일 크기: {}", pic.getSize());
		    logger.info("picName: {}",picName);
		    
		    File saveFile = new File("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps\\flower\\resources\\images\\",picName); // 저장할 폴더 이름, 저장할 파일 이름
		    
		    try {
		    	pic.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
		    } catch (IOException e) {
		    	e.printStackTrace();
		    	return null;
		    }

		    ProductVO productVO = new ProductVO();
		    productVO.setMajor(request.getParameter("major"));
		    productVO.setMedium(request.getParameter("medium"));
		    productVO.setpName(request.getParameter("pName"));
		    productVO.setPrice(Integer.parseInt(request.getParameter("price")));
		    productVO.setStock(Integer.parseInt(request.getParameter("stock")));
		    productVO.setContent(request.getParameter("content"));
		    productVO.setPic(picName);
		    
		    if(request.getParameter("bestyn") == null) {
		    	String bestYN = "n";
		    	productVO.setBestyn(bestYN);
		    } else {
		    	productVO.setBestyn(request.getParameter("bestyn"));
		    }
		    
		    if(request.getParameter("useyn") == null) {
		    	String useYN = "n";
		    	productVO.setUseyn(useYN);
		    } else {
		    	productVO.setUseyn(request.getParameter("useyn"));
		    }

		    PDao productDAO = sqlSession.getMapper(PDao.class);
		    productDAO.insertProduct(productVO);
		    model.addAttribute("productVO", productVO);
			
		    return "redirect:admin_product_list";
		
	}
	
	@RequestMapping("admin_product_detail")
	public String adminProductDetail(HttpServletRequest request, Model model) {

	    String pNum = request.getParameter("pNum").trim();

	    PDao productDAO = sqlSession.getMapper(PDao.class);
	    ProductVO productVO = productDAO.getProduct(pNum);

	    model.addAttribute("productVO", productVO);
	    
	 // 상품 리스트(product_list.jsp) 페이지에서 쿼리 스트링으로 넘겨준 현재 페이지를 얻어온다.
	    String tpage = "1";
	    if (request.getParameter("tpage") != null) {
	      tpage = request.getParameter("tpage");
	    }
	    
	    model.addAttribute("tpage", tpage);
		return "admin/product/productDetail";
	}
	
	@RequestMapping("admin_product_update_form")
	public String adminProductUpdateform(HttpServletRequest request, Model model) {
		
		String pNum = request.getParameter("pNum").trim();

		PDao productDAO = sqlSession.getMapper(PDao.class);
	    ProductVO productVO = productDAO.getProduct(pNum);

	    model.addAttribute("productVO", productVO);

	    // 상품 리스트(product_list.jsp) 페이지에서 쿼리 스트링으로 넘겨준 현재 페이지를 얻어온다.
	    String tpage = "1";
	    if (request.getParameter("tpage") != null) {
	      tpage = request.getParameter("tpage");
	    }
	    model.addAttribute("tpage", tpage);
	    
		return "admin/product/productUpdate";
	}
	
	@RequestMapping("admin_product_update")
	public String adminProductUpdate(HttpServletRequest request, Model model, MultipartFile pic) {
		
		String major = request.getParameter("major");
		String nonmakePic = request.getParameter("nonmakePic");
	    if(major.equals("꽃")) {
	    	major = "flower/";
	    } else {
	    	major = "tree/";
	    }
	    
	    String picName = major +pic.getOriginalFilename();
	    
	    if(!picName.equals(major)) {
	    	logger.info("파일 이름: {}", pic.getOriginalFilename());
	    	logger.info("파일 크기: {}", pic.getSize());
	    	logger.info("picName: {}",picName);
	    	
	    	if(nonmakePic.equals(picName)) {
	    		logger.info("같은 이름: {}",picName);
	    	} else {
	    		File saveFile = new File("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps\\flower\\resources\\images\\",picName); // 저장할 폴더 이름, 저장할 파일 이름
	    		
	    		try {
	    			pic.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	    		} catch (IOException e) {
	    			e.printStackTrace();
	    			return null;
	    		}
	    	}
	    } else {
	    	picName = nonmakePic;
	    }
	    
	    ProductVO productVO = new ProductVO();
	    productVO.setMajor(request.getParameter("major"));
	    productVO.setMedium(request.getParameter("medium"));
	    productVO.setpName(request.getParameter("pName"));
	    productVO.setPrice(Integer.parseInt(request.getParameter("price")));
	    productVO.setStock(Integer.parseInt(request.getParameter("stock")));
	    productVO.setContent(request.getParameter("content"));
	    productVO.setPic(picName);

	    if(request.getParameter("bestyn") == null) {
	    	String bestYN = "n";
	    	productVO.setBestyn(bestYN);
	    } else {
	    	productVO.setBestyn(request.getParameter("bestyn"));
	    }
	    
	    if(request.getParameter("useyn") == null) {
	    	String useYN = "n";
	    	productVO.setUseyn(useYN);
	    } else {
	    	productVO.setUseyn(request.getParameter("useyn"));
	    }
	    
	    productVO.setpNum(Integer.parseInt(request.getParameter("pNum")));

	    PDao productDAO = sqlSession.getMapper(PDao.class);
	    productDAO.updateProduct(productVO);
	  
	    return "redirect:admin_product_list";
}
	
	@RequestMapping("admin_product_delete")
	public String adminProductDelete(HttpServletRequest request) {
		
		String pnum = request.getParameter("pNum").trim();
	    
		PDao productDAO = sqlSession.getMapper(PDao.class);
	    productDAO.deleteProduct(pnum);
	    
	    return "redirect:admin_product_list";
	}
	
	@RequestMapping("admin_order_list")
	public String adminOrderList(HttpServletRequest request, Model model) {
		
		String key = "";
	    if (request.getParameter("key") != null) {
	      key = request.getParameter("key");
	    }

	    ODao oDao = sqlSession.getMapper(ODao.class);
	    ArrayList<OrderVO> orderList = oDao.listOrder(key);

	    model.addAttribute("orderList", orderList);
	    return "admin/order/orderList";
	}
	
	@RequestMapping("admin_order_save")
	public String adminOrderSave(HttpServletRequest request, Model model) {
		String[] resultArr = request.getParameterValues("sign");
	      
	    for(String orderNum:resultArr){
	    	ODao orderDAO = sqlSession.getMapper(ODao.class);
	        orderDAO.updateOrderResult(orderNum);
        }
	    return "redirect:admin_order_list";
	}
	
	@RequestMapping("admin_member_list")
	public String adminMemberList(HttpServletRequest request, Model model) {
		
		String key = "";
	    if (request.getParameter("key") != null) {
	      key = request.getParameter("key");
	    }

	    MDao mDao = sqlSession.getMapper(MDao.class);
	    ArrayList<MemberVO> memberList = mDao.listMember(key);

	    model.addAttribute("memberList", memberList);
	    
		return "admin/member/memberList";
	}
	
	@RequestMapping("admin_ask_list")
	public String adminAskList(HttpServletRequest request, Model model) {
		
		ADao askDAO = sqlSession.getMapper(ADao.class);
	    ArrayList<AskVO> askList = askDAO.listAllAsk();

	    model.addAttribute("askList", askList);
		
		return "admin/ask/askList";
	}
	
	@RequestMapping("admin_ask_detail")
	public String adminAskDetail(HttpServletRequest request, Model model) {
		
		String qNum = request.getParameter("qNum").trim();

		ADao askDAO = sqlSession.getMapper(ADao.class);
	    AskVO askVO = askDAO.getAsk(Integer.parseInt(qNum));

	    model.addAttribute("askVO", askVO);
		
		return "admin/ask/askDetail";
	}
	
	@RequestMapping("admin_ask_save")
	public String adminAskSave(HttpServletRequest request, Model model) {
		
		String qNum = request.getParameter("qNum").trim();
	    String reply =request.getParameter("reply").trim();
	    
	    AskVO askVO = new AskVO();
	    askVO.setqNum(Integer.parseInt(qNum));
	    askVO.setReply(reply);    
	    
	    
	    ADao askDAO = sqlSession.getMapper(ADao.class);
		askDAO.updateAskReply(askVO);
		
		return "redirect:admin_ask_list";
	}
	
	@RequestMapping("admin_notice_list")
	public String adminNoticeList(HttpServletRequest request, Model model) {

		NDao nDAO = sqlSession.getMapper(NDao.class);
		ArrayList<NoticeVO> noList = nDAO.selectAllBoards();
		model.addAttribute("noList", noList);
		
		ArrayList<NoticeVO> faqList = nDAO.selectAllFaqBoards();
		model.addAttribute("faqList", faqList);
		
		return "admin/notice/noticeList";
	}
	
	@RequestMapping("admin_notice_write")
	public String adminNoticeWrite(HttpServletRequest request, Model model) {
		
		NoticeVO noticeVo = new NoticeVO();
		noticeVo.setId(request.getParameter("id"));
		noticeVo.setNoti_title(request.getParameter("noti_title"));
		noticeVo.setNoti_contents(request.getParameter("noti_contents"));
		noticeVo.setNoti_true(request.getParameter("noti_true"));

		NDao nDAO = sqlSession.getMapper(NDao.class);
		nDAO.insertBoard(noticeVo);
		
		return "redirect:admin_notice_list";
	}
	
	@RequestMapping("admin_notice_write_form")
	public String adminNoticeWriteform() {
		return "admin/notice/noticeWrite";
	}
	
	@RequestMapping("admin_notice_detail")
	public String adminNoticeDetail(HttpServletRequest request, Model model) {
		
		String notiNum = request.getParameter("notiNum").trim();

		NDao nDAO = sqlSession.getMapper(NDao.class);
		NoticeVO noticeVo = nDAO.selectOneBoard(notiNum);

		model.addAttribute("noticeVo", noticeVo);

		String tpage = "1";
		if (request.getParameter("tpage") != null) {
			tpage = request.getParameter("tpage");
		}

		model.addAttribute("tpage", tpage);
		
		return "admin/notice/noticeDetail";
	}
	
	@RequestMapping("admin_notice_update")
	public String adminNoticeUpdate(HttpServletRequest request, Model model) {
		
		NoticeVO noticeVo = new NoticeVO();
		
		noticeVo.setNotiNum(Integer.parseInt(request.getParameter("notiNum")));
		noticeVo.setNoti_title(request.getParameter("noti_title"));
		noticeVo.setNoti_contents(request.getParameter("noti_contents"));
		noticeVo.setId(request.getParameter("id"));
		noticeVo.setNoti_true(request.getParameter("noti_true"));
		
		NDao nDAO = sqlSession.getMapper(NDao.class);
		nDAO.updateBoard(noticeVo);
		
		return "redirect:admin_notice_list";
	}
	
	@RequestMapping("admin_notice_delete")
	public String adminNoticeDelete(HttpServletRequest request) {
		
		String notiNum = request.getParameter("notiNum").trim();
	    
		NDao nDAO = sqlSession.getMapper(NDao.class);
		nDAO.deleteBoard(notiNum);
		
		return "redirect:admin_notice_list";
	}
	
}
