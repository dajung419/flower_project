package com.spring.flower;


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
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.flower.dao.ADao;
import com.spring.flower.dao.MDao;
import com.spring.flower.dao.PDao;
import com.spring.flower.dao.RDao;
import com.spring.flower.dto.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired      //spring설정파일에서 만들어 놓은 bean 객체를 주입받음
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "main";
	}	
	@RequestMapping("/index")
	public String index() {
		return "main";
	}	
	
	@RequestMapping("/login_form")
	public String login_form() {
		return "member/login";
	}	
	@RequestMapping("/logout_flower")
	public String logout(HttpSession session, HttpServletRequest request) {
		session=request.getSession(false);
	    if(session!=null){
	    	session.invalidate();  
	    }
		return "main";
	}	
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
	    HttpSession session=request.getSession();
	  
	    String id=request.getParameter("id");
	    String pass=request.getParameter("pass");
	    
	    MDao dao = sqlSession.getMapper(MDao.class);
	    
	    MemberVO mVO = dao.getMember(id);
	    
	    if(mVO!=null){
	      if(mVO.getPass().equals(pass)){    
	        session.removeAttribute("id");
	        session.setAttribute("loginUser", mVO);
	        return "redirect:index";
	      } else {
	    	  return "member/login_fail";
	      }
	    }
		return "member/login_fail";
	}	
	
	@RequestMapping("/join_form")
	public String join_form() {
		return "member/join";
	}	
	@RequestMapping("/join")
	public String join(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
	    
	    MemberVO mVO = new MemberVO();
	    
	    mVO.setId(request.getParameter("id"));
	    mVO.setPass(request.getParameter("pass"));
	    mVO.setName(request.getParameter("name"));
	    mVO.setBirth(request.getParameter("birth"));
	    mVO.setPhone(request.getParameter("phone_1")
	    	+ request.getParameter("phone_2") + request.getParameter("phone_3"));
	    mVO.setAddress(request.getParameter("address_1") 
	    		+ request.getParameter("address_2"));    
	    mVO.setPost(request.getParameter("post").trim());
	      
	    session.setAttribute("id", request.getParameter("id"));    
	    
	    MDao mDao = sqlSession.getMapper(MDao.class);
	    mDao.insertMember(mVO);
	    
		return "main";
	}	
	@RequestMapping("/id_check_form")
	public String id_check_form(HttpServletRequest request, Model model) {
		String id = request.getParameter("id").trim();
	    
		MDao mDao = sqlSession.getMapper(MDao.class);
	    int message = mDao.confirmID(id);
	        
	    model.addAttribute("message", message);
	    model.addAttribute("id", id);
		return "member/idcheck";
	}	
	@RequestMapping("/findIdForm")
	public String findIdForm() {
		return "member/findId";
	}	
	@RequestMapping("/findpwForm")
	public String findpwForm() {
		return "member/findpw";
	}	
	
	@RequestMapping("/findId")
	public String findId() {
		/*작성*/
		return "member/findId";
	}	
	@RequestMapping("/findpw")
	public String findpw() {
		/*작성*/
		return "member/findpw";
	}	
	
	@RequestMapping("/searchForm")
	public String searchForm() {
		return "search";
	}	
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request, Model model) {
		String searchStr = request.getParameter("searchStr").trim();
		PDao pDao = sqlSession.getMapper(PDao.class);
		model.addAttribute("pSearchList", pDao.search(searchStr));
		RDao rDao = sqlSession.getMapper(RDao.class);
		model.addAttribute("rSearchList", rDao.search(searchStr));
		ADao aDao = sqlSession.getMapper(ADao.class);
		model.addAttribute("aSearchList", aDao.search(searchStr));
		return "search";
	}	
	
}
