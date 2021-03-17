package com.itbank.admin;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
	
	public static String getHash(String userpw) {
		
		try {
//			Secure Hash Algorithm 512 : 입력값이 같으면 출력결과도 같으며, 출력결과는 다른값과 중복되지 않음을 보장하는 알고리즘
//			2^512
			MessageDigest md = MessageDigest.getInstance("SHA-512");	
			md.reset();
			md.update(userpw.getBytes("UTF-8"));
			String ret = String.format("%0128x", new BigInteger(1, md.digest()));
			return ret;
			
		} catch (NoSuchAlgorithmException e) {
			System.out.println("그런 알고리즘은 없습니다 : " + e);
//			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			System.out.println("그런 인코딩은 없습니다 : " + e);
//			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void main(String[] args) {
		String userpw = "1234";
		String test1 = getHash(userpw);
		System.out.println(test1);
		
		String test2 = getHash("itbank");
		String test3 = getHash("itank");
		
		System.out.println();
		System.out.println(test1);	// DB에 저장된 해시
		System.out.println(test2);	// 사용자입력값을 기반으로 한 해시값이 일치한다면, 패스워드 인증 성공
		System.out.println(test3);	// 한 글자만 달라도 전혀 다른 값을 출력
		
		System.out.println(test1.length());
		System.out.println(test3.length());
		
	}
}
