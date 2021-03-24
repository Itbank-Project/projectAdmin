package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {
	
	private final String uploadPath = "D:\\upload";
	private String[] extArr = {"jpg", "png", "jpeg", "bmp", "gif"};
	
	public FileService() {					// 스프링에 의해서 서비스 객체가 생성될 때
		File dir = new File(uploadPath);	// 업로드 경로가 
		if(dir.exists() == false) {			// 존재하지 않으면
			dir.mkdirs();					// 폴더를 새로 만들자
		}
	}
	
	private boolean isImgFile(String fileName) {		// 파일 이름을 전달받아서	
		for(String ext: extArr) {						// 등록된 확장자 중에서
			if(fileName.toLowerCase().endsWith(ext)) {	// 파일이름(소문자처리)이 확장자로 끝나면
				return true;							// 이미지 파일이다
			}
			
		}
		return false;								// 모든 확장자에 대해 해당이 없으면 아니다
	}

	public List<String> getFileList() {
//		File dir = new File(request.getSession().getServletContext().getRealPath("."));
//		업로드 파일이 프로젝트 내부 폴더에 올라오면, 프로젝트의 크기가 점점 커지고 무거워진다
//		멤버 필드로 업로드 경로를 절대경로로 설정해두고, 해당 위치에 파일을 업로드하며, 참조할 수 있도록 설정하자
//		Service 의 메서드는 request, response와 분리된 구조를 만드는것이 좋다
		
		File dir = new File(uploadPath);
		ArrayList<String> fileList = new ArrayList<String>(Arrays.asList(dir.list()));
		// 업로드 경로의 모든 파일의 이름을 String[] -> ArrayList<String> 으로 변환하여 생성
		
		for(int i = 0; i < fileList.size(); i++) {
			String fileName = fileList.get(i);
//			System.out.println(fileName);
			if(isImgFile(fileName) == false) {
				fileList.remove(i);
			}
		}
		
		return fileList;
	}

	public boolean uploadFile(MultipartFile file) throws IllegalStateException, IOException {
		
		File target = new File(uploadPath, file.getOriginalFilename());
		if(isImgFile(file.getOriginalFilename())) {
			file.transferTo(target);
		}
		return target.exists();
	}

}
