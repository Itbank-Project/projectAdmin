package com.itbank.controller;

import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.admin.Hash;
import com.itbank.calculate.CalculateDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.itbank.admin.AdminDTO;
import com.itbank.service.AdminService;
import com.itbank.service.CalculateService;
import com.itbank.service.MailService;

@RestController
public class AjaxController {

	@Autowired private AdminService as;
	@Autowired private MailService mailService;
	@Autowired private CalculateService cs;
	
	// 현재 비밀번호와 일치하는지 확인
	@PostMapping(value = "checkPw", produces = "application/json;charset=utf8")
	public String pwCheck (String userpw) {
		boolean check = as.selectPW(userpw);
		return check ? "일치" : "비밀번호를 잘못입력하였습니다.";
	}
	
	
	// 아이디찾기
	@PostMapping(value = "findID", produces = "application/text;charset=utf8")
	public String findId(@RequestBody AdminDTO dto) {
		String id = as.getId(dto);
		return id == null ? "일치하는 정보가 없습니다." : id;
	}

	// 비번 찾기
	@PostMapping(value = "sendMail", produces = "application/text;charset=utf8")
	public String findPw(@RequestBody AdminDTO dto, HttpSession session) throws FileNotFoundException {
		AdminDTO user = as.getUserPw(dto);
		String email = dto.getAd_email();
		
		if (user != null) {
			String userid = user.getAd_id();
			mailService.authMail(email, session);
			System.out.println("userid : " + userid);
			return userid;
		} else {
			return "일치하는 계정이 없습니다";
		}
	}

	// 입력한 인증번호 전송한 인증번호와 일치하는지 확인
	@GetMapping("getAuthResult/{authNumber}/")
	public String authCheck(@PathVariable String authNumber, HttpSession session) {
		System.out.println("인증번호 : "+  Hash.getHash(authNumber));
		String hashNumber = (String) session.getAttribute("hashNumber");
		System.out.println("해시처리한 번호 :ㅣ " + hashNumber);
		boolean flag = hashNumber.equals(Hash.getHash(authNumber));
		return Boolean.toString(flag);
	}

	// 비밀번호 재설정
	@PutMapping(value = "changePW", consumes = "application/json;charset=utf8")
	public int changePW(@RequestBody AdminDTO dto ,HttpSession session) {
		System.out.println("비번 : "+ dto.getAd_pw());
		System.out.println("아이디 : "  + dto .getAd_id());
		int row = as.changePw(dto);
		
		AdminDTO login = (AdminDTO) session.getAttribute("login");
		
		System.out.println("login ? : " + login);
		if (login != null) {
			login.setAd_pw(dto.getAd_pw());
			session.removeAttribute("login");
			session.setAttribute("login", login);
		}

		System.out.println(row);
		
		return row;
	}

	// 회원가입 시 이메일 인증
	@GetMapping(value = "mailto/{mailAddress}/", produces = "application/text;charset=utf8")
	public String mailto(@PathVariable String mailAddress, HttpSession session) throws FileNotFoundException {
		System.out.println(mailAddress);
		return mailService.authMail(mailAddress, session);

	}

	// 회원가입 시 id중복체크
	@GetMapping(value = "join/{userid}", produces = "application/text;charset=utf8")
	public String member(@PathVariable String userid) {
		int row = as.getMember(userid);
		String msg = row == 1 ? "이미 사용중인 ID입니다" : "사용 가능한 ID입니다";
		return msg;
	}

	// 회원가입
	@PostMapping(value = "join", consumes = "application/json;charset=utf8")
	public String join(@RequestBody AdminDTO dto) throws Exception {
		int row = as.insertMember(dto);
		return row + "";
	}
	
	// 회원 정보 변경
	@PutMapping(value = "modify", consumes = "application/json;charset=utf8")
	public int modify(@RequestBody AdminDTO dto, HttpSession session) {
		int row = as.updateMember(dto);

		// 수정하고 login한 세션을 불러와서 변경내용을 다시 세션에 저장하기
		AdminDTO login = (AdminDTO) session.getAttribute("login");
		
		login.setAd_account(dto.getAd_account());
		login.setAd_bank(dto.getAd_bank());
		login.setAd_email(dto.getAd_email());
		login.setAd_pnum(dto.getAd_pnum());
		login.setAd_name(dto.getAd_name());
		
		session.removeAttribute("login");
		session.setAttribute("login", login);
		return row;
		}
		
		// 정산 정보 검색
		@PostMapping(value = "selectCalcList", produces = "application/json;charset=utf8")
		public List<CalculateDTO> selectCalcList(@RequestBody CalculateDTO dto, HttpSession session) throws JsonProcessingException {
			
			AdminDTO login = (AdminDTO) session.getAttribute("login");
			System.out.println(login.getAd_id());
			System.out.println(dto.getYyyy());
			System.out.println(dto.getMm());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ad_id", login.getAd_id());
			map.put("yyyy", dto.getYyyy());
			map.put("mm", dto.getMm());
			
			List<CalculateDTO> list = cs.selectCalcList(map);
			map.put("list", list);
			
			
			return list;
	}
}
