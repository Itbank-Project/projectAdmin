package com.itbank.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.admin.AdminDTO;
import com.itbank.service.AdminService;

@Controller
public class MainController {

	@Autowired private AdminService as;
	
	@RequestMapping("")
	public String index() {
		return "index";
	}
	
	// 로그인
	@GetMapping("login")
	public void login() {}

	// 로그인(쿠키)
	@PostMapping("login")
	public ModelAndView login(AdminDTO dto, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String userid = dto.getAd_id();
		String storeid = request.getParameter("storeid");
		
		AdminDTO login = as.getUser(dto);
		
		Cookie c = new Cookie("userid", userid);
		
		session.setAttribute("login", login);
		
		boolean flag = (storeid != null) && (session.getAttribute("login") != null);
		
		c.setMaxAge(flag ? 60 * 60 * 24 * 100 : 0);	
		response.addCookie(c);	
		
		mav.setViewName(login != null ? "index" : "msg");
		mav.addObject("msg", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
		return mav;
	}
	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	// 회원가입
	@GetMapping("join")
	public void join() {}

	// 아이디 찾기
	@GetMapping("findID")
	public void findID() {}

	// 비밀번호 찾기
	@GetMapping("findPW")
	public void findPW() {}
	
	// 회원 정보 변경
	@GetMapping("modify")
	public void modify() {}
	
	// 판매기록
	@GetMapping("salesRecord")
	public void salesRecord() {}
	
	// 객실현황
	@GetMapping("roomStatus")
	public void roomStatus() {}
	
	// 리뷰
	@GetMapping("trueReview")
	public void trueReview() {}

	// 호텔정보
	@GetMapping("hotelInformation")
	public void hotelInformation() {}
	
	// 정산페이지
	@GetMapping("calculate")
	public void calculate() {}

}
