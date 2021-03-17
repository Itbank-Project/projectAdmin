package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.admin.Hash;
import com.itbank.admin.AdminDAO;
import com.itbank.admin.AdminDTO;

@Service
public class AdminService {

	@Autowired private AdminDAO dao;

	// 로그인
	public AdminDTO getUser(AdminDTO dto) {
		dto.setAd_pw(Hash.getHash(dto.getAd_pw()));
		return dao.selectMember(dto);
	}

	// 아이디 찾기
	public String getId(AdminDTO dto) {
		return dao.selectId(dto);
	}

	// 비번 변경 시 일치하는 계정 찾기
	public AdminDTO getUserPw(AdminDTO dto) {
		return dao.selectPw(dto);
	}
	
	// 회원가입 시 id중복체크
	public int getMember(String userid) {
		return dao.selectOne(userid);
	}

	// 회원가입
	public int insertMember(AdminDTO dto) {
		dto.setAd_pw(Hash.getHash(dto.getAd_pw()));
		return dao.insertMember(dto);
	}

	// 비밀번호 변경
	public int changePw(AdminDTO dto) {
		dto.setAd_pw(Hash.getHash(dto.getAd_pw()));
		return dao.updatePW(dto);
	}

	// 회원 정보 변경
	public int updateMember(AdminDTO dto) {
		return dao.updateMember(dto);
	}

	public boolean selectPW(String userpw) {
		userpw = Hash.getHash(userpw);
		String dbpw = dao.selectPassword(userpw);
		return dbpw != null;
	}
}
