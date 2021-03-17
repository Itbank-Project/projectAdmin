package com.itbank.admin;

public interface AdminDAO {

	AdminDTO selectMember(AdminDTO dto);

	int updatePassword(String newPw1);

	String selectId(AdminDTO dto);

	AdminDTO selectPw(AdminDTO dto);

	int selectOne(String userid);

	int insertMember(AdminDTO dto);

	int updatePW(AdminDTO dto);

	int updateMember(AdminDTO dto);

	String selectPassword(String userpw);
	

}
