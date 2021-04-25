package com.spring.flower;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.flower.dao.ADao;
import com.spring.flower.dao.MDao;
import com.spring.flower.dao.NDao;
import com.spring.flower.dao.PDao;
import com.spring.flower.dto.AskVO;
import com.spring.flower.dto.BPageVO;
import com.spring.flower.dto.NoticeVO;
import com.spring.flower.dto.ProductVO;


@Controller
public class AskNboardController {
	

	@Autowired      //spring설정파일에서 만들어 놓은 bean 객체를 주입받음
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(AskNboardController.class);
	
	@RequestMapping("ask_write")
	public String askWrite(HttpServletRequest request, Model model) {
		
		AskVO aVo = new AskVO();
		aVo.setId(request.getParameter("id"));
		aVo.setQ_title(request.getParameter("q_title"));
		String contents = request.getParameter("q_contents");
		aVo.setQ_contents(contents);
		aVo.setQ_category(request.getParameter("q_category"));
		int pNum = 0;
		if( request.getParameter("pNum") != null ) {
			pNum = Integer.parseInt(request.getParameter("pNum"));
		}
		aVo.setpNum(pNum);
		ADao aDao = sqlSession.getMapper(ADao.class);
		aDao.insertAsk(aVo);
		
		return "board/ask_success";
	}
	
	@RequestMapping("ask_write_form")
	public String askWriteForm(HttpServletRequest request, Model model) {
		
		if(request.getParameter("pNum") != null) {
			String pNum = request.getParameter("pNum");
			
			PDao pDao = sqlSession.getMapper(PDao.class);
			ProductVO pVo = pDao.getProduct(pNum);
			model.addAttribute("pVo", pVo);
			
		}
		
		return "board/askWrite";
	}
	
	@RequestMapping("ask_detail")
	public String askDetail(HttpServletRequest request, Model model) {
		
		String qNum=request.getParameter("qNum").trim();
	    
		ADao askDAO = sqlSession.getMapper(ADao.class);
	    AskVO askVo= new AskVO();
	    askVo = askDAO.getOneAsk(qNum);
	    
	    ProductVO pVo = new ProductVO();
	    if(askVo.getpNum() != 0) {
	    	PDao pDao = sqlSession.getMapper(PDao.class);
	    	pVo = pDao.getProduct(askVo.getpNum()+"");
	    	model.addAttribute("pVo", pVo);
	    }
	    
	    model.addAttribute("askVO", askVo);
		
		return "board/askDetail";
	}
	
	@RequestMapping("ask_update")
	public String askUpdate(HttpServletRequest request, Model model) {
		
		AskVO aVo = new AskVO();
		aVo.setqNum(Integer.parseInt(request.getParameter("qNum")));
		aVo.setQ_title(request.getParameter("q_title"));
		String contents = request.getParameter("q_contents");
		aVo.setQ_contents(contents);
		aVo.setQ_category(request.getParameter("q_category"));
			
		ADao askDAO = sqlSession.getMapper(ADao.class);
		askDAO.updateAsk(aVo);
		
		return "board/ask_success";
	}
	
	@RequestMapping("ask_update_form")
	public String askUpdateForm(HttpServletRequest request, Model model) {
		
		 String qNum=request.getParameter("qNum").trim();
		    
		 ADao askDAO = sqlSession.getMapper(ADao.class);
		 AskVO askVO= new AskVO();
		 askVO = askDAO.getOneAsk(qNum);
		 
		 ProductVO pVo = new ProductVO();
		 if(askVO.getpNum() != 0) {
			PDao pDao = sqlSession.getMapper(PDao.class);
		 	pVo = pDao.getProduct(askVO.getpNum()+"");
		 	model.addAttribute("pVo", pVo);
		 }
		 
		 model.addAttribute("askVO", askVO);
		
		return "board/askUpdate";
	}
	
	@RequestMapping("ask_delete")
	public String askDelete(HttpServletRequest request, Model model) {
		
		String qNum=request.getParameter("qNum");
		ADao askDAO = sqlSession.getMapper(ADao.class);
		askDAO.deleteAsk(qNum);
		
		return "redirect:mypage_3";
	}
	
	@RequestMapping("notice_list")
	public String noticeList(HttpServletRequest request, Model model) {
		
		String page = (String)request.getParameter("page");
		String pageDataCount = (String)request.getParameter("pageDataCount");
		if(page==null || page.equals("0") || page.equals("")) {
			page="1"; //값이 넘어오지 않았을때 예외 처리
		}
		
		if(pageDataCount==null || pageDataCount.equals("0") || pageDataCount.equals("")) {
			pageDataCount="10"; // 12개로 맞춤
		}
		NDao nDAO = sqlSession.getMapper(NDao.class);
		// 공지사항 리스트 불러옴  noti_true = "y"
		ArrayList<NoticeVO> noticeList 
		= nDAO.listNotice(page, pageDataCount, "y");
		
		model.addAttribute("noticeList", noticeList);
		
		model.addAttribute("noti_true", "y");
		
		int totalDataCount = nDAO.dataCount();
		BPageVO bPageVO = new BPageVO();
		bPageVO.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount), totalDataCount);
		
		model.addAttribute("bPageVO", bPageVO);
		
		return "board/noticeList";
	}
	
	@RequestMapping("qna_list")
	public String qnaList(HttpServletRequest request, Model model) {
		
		String page = (String)request.getParameter("page");
		String pageDataCount = (String)request.getParameter("pageDataCount");
		if(page==null || page.equals("0") || page.equals("")) {
			page="1"; //값이 넘어오지 않았을때 예외 처리
		}
		
		if(pageDataCount==null || pageDataCount.equals("0") || pageDataCount.equals("")) {
			pageDataCount="10"; // 12개로 맞춤
		}
		
		NDao nDAO = sqlSession.getMapper(NDao.class);
		// qna 리스트 불러옴  noti_true = "n"
		ArrayList<NoticeVO> noticeList 
		= nDAO.listNotice(page, pageDataCount, "n");
		
		model.addAttribute("noticeList", noticeList);
		
		model.addAttribute("noti_true", "n");
		
		int totalDataCount = nDAO.dataCount();
		BPageVO bPageVO = new BPageVO();
		bPageVO.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount), totalDataCount);
		
		model.addAttribute("bPageVO", bPageVO);
		
		return "board/noticeList";
	}
	
	@RequestMapping("notice_detail")
	public String noticeDetail(HttpServletRequest request, Model model) {
		
		String notiNum = request.getParameter("notiNum").trim();
		
		NDao nDAO = sqlSession.getMapper(NDao.class);
		NoticeVO nVo = nDAO.selectOneBoard(notiNum);
		model.addAttribute("nVo", nVo);
		
		return "board/noticeDetail";
	}
	
	
	
	
	
}
