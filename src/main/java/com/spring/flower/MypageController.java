package com.spring.flower;

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

import com.spring.flower.dao.ADao;
import com.spring.flower.dao.MDao;
import com.spring.flower.dao.ODao;
import com.spring.flower.dto.AskVO;
import com.spring.flower.dto.CartVO;
import com.spring.flower.dto.MemberVO;


@Controller
public class MypageController {
	

	@Autowired      //spring설정파일에서 만들어 놓은 bean 객체를 주입받음
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping("mypage_point")
	public String mypagePoint(HttpServletRequest request, Model model) {
		
		 HttpSession session = request.getSession();
		    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		    if (loginUser == null) {
		    	return "redirect:login_form";
		    } 
		    else {
		    
		    	String id = loginUser.getId();
		    	
		    	ODao oDao = sqlSession.getMapper(ODao.class);
		    	ArrayList<CartVO> pointList = oDao.ViewCartList(id);
		    	model.addAttribute("pointList", pointList);
		    }
		
		return "mypage/mypage_point";
	}
	
	@RequestMapping("mypage_2")
	public String mypage_2(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "redirect:login_form";
		} 
		else {
			
			String id = loginUser.getId();
			ODao oDao = sqlSession.getMapper(ODao.class);
			ArrayList<CartVO> cartList = oDao.ViewCartList(id);
			model.addAttribute("cartList", cartList);
		}
		
		return "mypage/mypage_2";
	}
	
	@RequestMapping("mypage_2_detail")
	public String mypage_2_detail(HttpServletRequest request, Model model) {
		
		String orderNum =request.getParameter("orderNum");
		
		ODao oDao = sqlSession.getMapper(ODao.class);
		CartVO cartVO = new CartVO();
		cartVO= oDao.Detail(orderNum);
		model.addAttribute("cartVO", cartVO);
		
		return "mypage/mypage_2_detail";
	}
	
	@RequestMapping("mypage_3")
	public String mypage_3(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
	    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	    
	    String id= loginUser.getId();
	    
	    ADao askDAO = sqlSession.getMapper(ADao.class);
	    ArrayList<AskVO> askList = askDAO.askList(id);
	   
	    model.addAttribute("askList", askList);
		
		return "mypage/mypage_3";
	}
	
	@RequestMapping("mypage_4")
	public String mypage_4() {
		
		return "mypage/mypage_4";
	}
	
	@RequestMapping("mypage_5")
	public String mypage_5() {
		
		return "mypage/mypage_5";
	}
	
	@RequestMapping("mypage_5_delete")
	public String mypage_5_delete(HttpServletRequest request, Model model) {
		
		String id= request.getParameter("id");
		String pass= request.getParameter("pass"); 
		
		MemberVO mVo= new MemberVO();
		
		MDao mDao = sqlSession.getMapper(MDao.class);
		mVo = mDao.getMember(id);
		String pas = mVo.getPass();
		if ((pas).equals(pass)) { // 성공
			
			mDao.deleteMember(id);
			HttpSession session=request.getSession(false);
			if(session!=null){
				session.invalidate();  
			}
			return "redirect:index";
			
		} else {// 실패
			model.addAttribute("message", "비밀번호가 틀립니다.");
			return "mypage/mypage5_fail";
		}
	}
	
	@RequestMapping("mypage_check_pass_form")
	public String mypage_check_pass_form() {
		return "mypage/mypageCheckPass";
	}
	
	@RequestMapping("mypage_check_pass")
	public String mypage_check_pass(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		MDao mDao = sqlSession.getMapper(MDao.class);
		MemberVO mVo = mDao.getMember(id);
		if (mVo.getPass().equals(pass)) { // 성공
			return "mypage/myCheckSuccess";
		} else {// 실패
			model.addAttribute("message", "비밀번호가 틀렸습니다.");
			return "redirect:mypage_check_pass_form";
		}
	}
	
	@RequestMapping("mypage_4_Update")
	public String mypage_4_Update(HttpServletRequest request, Model model) {
		MemberVO mVo = new MemberVO();
		mVo.setId(request.getParameter("id"));
		mVo.setPass(request.getParameter("pass"));
		mVo.setPhone(request.getParameter("phone_1")
		    	+ request.getParameter("phone_2") + request.getParameter("phone_3"));
		    mVo.setAddress(request.getParameter("address_1") 
		    		+ request.getParameter("address_2"));
		mVo.setPost(request.getParameter("post"));
		
		MDao mDao = sqlSession.getMapper(MDao.class);
		mDao.updatemypage(mVo);
		
		return "mypage/my_update_success";
	}
	
	@RequestMapping("delivery")
	public String delivery() {
		return "mypage/delivery";
	}
	
}
