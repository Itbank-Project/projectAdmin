package com.itbank.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MessageService {
	
	public void sendMessage(String ad_pnum, String cu_pnum, String body) {
		System.out.println("msg : "+ ad_pnum);
		System.out.println("msg : "+ cu_pnum);
		System.out.println("msg : "+ body);

		String api_key = "NCS0E9QVEWOIXTTH";
		String api_secret = "MVJF1EVFX5HVCZ2RXESIFU1FYUNWVM4U";
		
		Message coolsms = new Message(api_key, api_secret);
		
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", cu_pnum);
	    params.put("from", ad_pnum);
	    params.put("type", "LMS");
	    params.put("text", body);
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}
	
}
