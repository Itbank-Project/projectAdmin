package com.itbank.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Properties;
import java.util.Scanner;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.itbank.admin.Hash;

@Service
public class MailService {

	// 12자리 인증번호 만들기
		public String getAuthNumber() {
			int index = 0;
			char[] charArr = new char[] { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
					'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
					'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6',
					'7', '8', '9', '0' };

			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < 12; i++) {
				index = (int) (charArr.length * Math.random());
				sb.append(charArr[index]);
			}

			return sb.toString();
		}

	// 메일 보내기
	public static String sendMail(String mailAddress, String authNumber, String account) {
				
		// 여기서 부터 메일을 발송하는데 사용하는 코드
		String host = "smtp.naver.com";
		final String username = account.split("/")[0];
		System.out.println(username);
		final String password = account.split("/")[1];
		int port = 465;
		
		String subject = "[HotelJava] 인증 메일입니다";
		String body = "인증번호는 [%s]입니다\n\n";
		body = String.format(body, authNumber);
		
		// 메일을 보내는 서버에 대한 인증과 속성을 설정한다 (smtp)
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host",host);
		props.put("mail.smtp.port",port);
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.trust",host);
		
		// 속성 + 인증(id, pw)을 이용하여 세션을 생성
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
			String un = username;
			String pw = password;
			
			protected PasswordAuthentication getPasswordAuthentication( ) {
				return new PasswordAuthentication(un, pw);
			}
		});
		mailSession.setDebug(true);	// 세션에 대한 처리내용을 콘솔에 출력할 수 있도록 debug를 활성화
		
		// 	메일의 전반적인 내용을 설정(보내는 사람, 받는 사람, 제목, 내용)	
		Message mimeMessage = new MimeMessage(mailSession);
		
		try {
			mimeMessage.setFrom(new InternetAddress(username + "@naver.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(mailAddress));
			mimeMessage.setSubject(subject);
			mimeMessage.setText(body);
			Transport.send(mimeMessage);
	
		} catch (AddressException e) {
			e.printStackTrace();
			return "주소가 잘못되었습니다";
		} catch (MessagingException e) {
			e.printStackTrace();
			return "주소를 전송할 수 없습니다";
		}
		return authNumber;
	}

	// 인증번호 
	public String authMail(String email, HttpSession session) throws FileNotFoundException {
		String filePath = session.getServletContext().getRealPath("/WEB-INF/data/mailAccount.dat");
		File f = new File(filePath);
		if (f.exists() == false) {
			return "메일 전송에 필요한 계정 정보를 찾을 수 없습니다";
		}
		Scanner sc = new Scanner(f);
		String account = null;
		while (sc.hasNextLine()) {
			account = sc.nextLine();
		}
		sc.close();

		String authNumber = getAuthNumber(); // 인증번호
		String hashNumber = Hash.getHash(authNumber); // 인증번호를 해시처리
		session.setAttribute("hashNumber", hashNumber); // 해시처리 된 인증번호를 세션에 저장

		String result = sendMail(email, authNumber, account);
		if (result.equals(authNumber)) { // 메일이 정상적으로 발송되었으면, 인증번호의 hash값을 반환한다
			return hashNumber;
		} else { // 예외가 발생하면 예외 문구를 반환한다
			return result;
		}
	}

}
