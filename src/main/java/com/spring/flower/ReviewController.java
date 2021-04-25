package com.spring.flower;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.flower.dao.PDao;
import com.spring.flower.dao.RDao;
import com.spring.flower.dto.BPageVO;
import com.spring.flower.dto.MemberVO;
import com.spring.flower.dto.ProductVO;
import com.spring.flower.dto.ReviewVO;


@Controller
public class ReviewController {
	

	@Autowired      //spring설정파일에서 만들어 놓은 bean 객체를 주입받음
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping("review_list")
	public String reviewList(HttpServletRequest request, Model model) {
		
		String page = (String)request.getParameter("page");
		String pageDataCount = (String)request.getParameter("pageDataCount");
		if(page==null || page.equals("0") || page.equals("")) {
			page="1"; //값이 넘어오지 않았을때 예외 처리
		}
		
		if(pageDataCount==null || pageDataCount.equals("0") || pageDataCount.equals("")) {
			pageDataCount="12"; // 12개로 맞춤
		}
		
		RDao rDAO = sqlSession.getMapper(RDao.class);
		ArrayList<ReviewVO> reviewList 
		= rDAO.listReview(page, pageDataCount);
		
		model.addAttribute("reviewList", reviewList);
		
		int totalDataCount = rDAO.dataCount();
		BPageVO bPageVO = new BPageVO();
		bPageVO.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount), totalDataCount);
		
		model.addAttribute("bPageVO", bPageVO);
		
		return "board/reviewList";
	}
	
	@RequestMapping("review_detail")
	public String reviewDetail(HttpServletRequest request, Model model) {
		
		String rev_num=request.getParameter("rev_num").trim();
		
		RDao reviewDAO = sqlSession.getMapper(RDao.class);
		ReviewVO reviewVO= new ReviewVO();
	    
	    // 이전, 다음 버튼 눌렀을때
		if(request.getParameter("go") != null) {
			int go = Integer.parseInt(request.getParameter("go"));
			// 이전 버튼을 눌렀을때
			if(go < 0) {
				
				String num = reviewDAO.getPrevRevNum(rev_num);
				if(num == null) {
					num = rev_num;
				} 
				reviewVO = reviewDAO.getReview(num);
				
			} else {
				
				String num = reviewDAO.getNextRevNum(rev_num);
				if(num == null) {
					num = rev_num;
				} 
				reviewVO = reviewDAO.getReview(num);
				
			}
			
		} else {
			reviewVO = reviewDAO.getReview(rev_num);
		}
		
		PDao pDAO = sqlSession.getMapper(PDao.class);
		ProductVO pVo = new ProductVO();
		pVo = pDAO.getProductByOrderNum(reviewVO.getOrderNum());
		
		// 리뷰 볼때 조회수 증가
		reviewDAO.updateReadCount(rev_num);
		
		// 댓글 줄 나눔
		String rev_rev_contents = reviewVO.getRev_rev();
		
		if(rev_rev_contents != null) {
			List<String> rev_list = Arrays.asList(rev_rev_contents.split("#e@n!d~"));
			model.addAttribute("rev_list", rev_list);	    	
		} 
		model.addAttribute("reviewVO", reviewVO);
		model.addAttribute("pVo", pVo);
		
		return "board/reviewDetail";
	}	
	
	@RequestMapping("review_rev")
	public String reviewRev(HttpServletRequest request, Model model) {
		
		ReviewVO rVo = new ReviewVO();
		String rev_num=request.getParameter("rev_num");
		String id=request.getParameter("id");
		String pre_rev=request.getParameter("pre_rev");
		
		rVo.setRev_num(Integer.parseInt(rev_num));
		String revrev = request.getParameter("rev_rev") + "#i@d!" + id + "#e@n!d~";
		rVo.setRev_rev(pre_rev + revrev);
		
		RDao reviewDAO = sqlSession.getMapper(RDao.class);
		reviewDAO.updateRevReview(rVo);
		
		rVo = reviewDAO.getReview(rev_num);
	    
	    model.addAttribute("reviewVO", rVo);
		
	    return "redirect:review_list";
	}
	
	
	@RequestMapping("review_rev_delete")
	public String review_rev_delete(HttpServletRequest request, Model model) {
		
		ReviewVO rVo = new ReviewVO();
		String rev_num=request.getParameter("rev_num");
		//String id=request.getParameter("id");
		String rev_rev=request.getParameter("pre_rev");
		
		rVo.setRev_num(Integer.parseInt(rev_num));
		rVo.setRev_rev(rev_rev);
		
		RDao reviewDAO = sqlSession.getMapper(RDao.class);
		reviewDAO.deleteRevReview(rVo);
		
		rVo = reviewDAO.getReview(rev_num);
	    
	    model.addAttribute("reviewVO", rVo);
		
		return "redirect:review_list";
	}
	
	@RequestMapping("review_update_form")
	public String reviewUpdateForm(HttpServletRequest request, Model model) {
		
		String rev_num=request.getParameter("rev_num");
	    
		RDao reviewDAO = sqlSession.getMapper(RDao.class);
	    ReviewVO reviewVO= new ReviewVO();
	    reviewVO = reviewDAO.getReview(rev_num);
	    
	    PDao pDAO = sqlSession.getMapper(PDao.class);
	    ProductVO pVo = new ProductVO();
	    pVo = pDAO.getProductByOrderNum(reviewVO.getOrderNum());
	    
	    model.addAttribute("reviewVO", reviewVO);
	    
	    model.addAttribute("pVo", pVo);
		
		return "board/reviewUpdate";
	}
	
	@RequestMapping("review_update")
	public String reviewUpdate(HttpServletRequest request, Model model) {
		
		ReviewVO rVo = new ReviewVO();
		rVo.setRev_num(Integer.parseInt(request.getParameter("rev_num")));
		rVo.setRev_score(Integer.parseInt(request.getParameter("rev_score")));
		String contents = request.getParameter("rev_contents");
		String subStr = "";
		
		if (contents.indexOf("<img") >= 0){
			int startIdx = contents.indexOf("src=\"");
			int endIdx = contents.indexOf(")\">");
			subStr = contents.substring(startIdx, endIdx);
			String[] tmp = subStr.split(" ");
			subStr = tmp[0].split("\"")[1].trim();
			subStr = subStr.split("/")[3];
			subStr = subStr.replaceAll("s_", "");
		} else {
			subStr = "";
		}
		
		rVo.setRev_pic(subStr);
		rVo.setRev_title(request.getParameter("rev_title"));
		rVo.setRev_contents(contents);
		RDao reviewDAO = sqlSession.getMapper(RDao.class);
		reviewDAO.updateReview(rVo);
		
		return "redirect:review_list";
	}
	
	@RequestMapping("review_delete")
	public String reviewDelete(HttpServletRequest request, Model model) {
		
		String rev_num=request.getParameter("rev_num");
		RDao rDao = sqlSession.getMapper(RDao.class);
		rDao.deleteReview(rev_num);
		
		return "redirect:review_list";
	}
	
	@RequestMapping("review_write_form")
	public String reviewWriteForm(HttpServletRequest request, Model model) {
		
		String pNum = request.getParameter("pNum");
		String orderNum = request.getParameter("orderNum");
		
		PDao pDAO = sqlSession.getMapper(PDao.class);
		ProductVO pVo = pDAO.getProduct(pNum);
		
		model.addAttribute("orderNum", orderNum);
		model.addAttribute("pVo", pVo);
		
		return "board/reviewWrite";
	}
	
	@RequestMapping("review_write")
	public String reviewWrite(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
	    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		ReviewVO rVo = new ReviewVO();
		rVo.setId(loginUser.getId());
		rVo.setRev_score(Integer.parseInt(request.getParameter("rev_score")));
		rVo.setOrderNum(request.getParameter("orderNum"));
		String contents = request.getParameter("rev_contents");
		String subStr = "";
		
		if (contents.indexOf("<img") >= 0){
			int startIdx = contents.indexOf("src=\"");
			int endIdx = contents.indexOf("(this)\">");
			subStr = contents.substring(startIdx, endIdx);
			String[] tmp = subStr.split(" ");
			subStr = tmp[0].split("\"")[1].trim();
			subStr = subStr.split("/")[3];
			subStr = subStr.replaceAll("s_", "");
		} else {
			subStr = "";
		}
		
		rVo.setRev_pic(subStr);
		rVo.setRev_title(request.getParameter("rev_title"));
		rVo.setRev_pass(request.getParameter("rev_pass"));
		rVo.setRev_contents(contents);
		RDao rDao = sqlSession.getMapper(RDao.class);
		rDao.writeReview(rVo);
		
		return "board/ask_success";
	}
	
	@RequestMapping("review_pass_check")
	public String reviewPassCheck(HttpServletRequest request, Model model) {
		
		String rev_num = request.getParameter("rev_num");
		String pass = request.getParameter("pass");
		String move = request.getParameter("move");
		
		RDao rDao = sqlSession.getMapper(RDao.class);                          
		ReviewVO mVo = rDao.getReview(rev_num);
	
		if (mVo.getRev_pass().equals(pass)) { // 성공
			if(move.equals("update")) {
				model.addAttribute("rev_num", rev_num);
				return "board/reviewCheckSuccess";
			} else {
			    model.addAttribute("rev_num", rev_num);
			    return "board/reviewCheckSuccess2";
			}
		} else {// 실패
			
			model.addAttribute("rev_num", rev_num);
			model.addAttribute("move", move);
			model.addAttribute("message", "비밀번호가 틀렸습니다.");
			return "board/reviewCheckPass";
		}
	}
	
	
	@RequestMapping("review_pass_check_form")
	public String reviewPassCheckform(HttpServletRequest request, Model model) {
		model.addAttribute("rev_num", request.getParameter("rev_num"));
		model.addAttribute("move", request.getParameter("move"));
		return "board/reviewCheckPass";
	}
	
	
	
}
