package com.kh.user.common;

import java.io.File;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy; 

public class MyFileRenamePolicy implements FileRenamePolicy{
	
	public File rename(File originFile) {
		
		String originName = originFile.getName(); 
		
		//1.파일 업로드한 시간 알아내기 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date()); 
		
		//2.끝에 붙일 래넘값 5자기 가져오기
		int ranNum = (int)(Math.random()*90000+10000);	
		
		//3.저장 파일경 ".jpg" 불러오기 
		int dot = originName.lastIndexOf(".");
		String ext = originName.substring(dot); 
		
		//4. 위 내가지 합차기 
		String fileName = currentTime + ranNum + ext;
		
		//전달받은 원본 파일명을 수정파일명으로 리턴하기. 
		File renameFile = new File(originFile.getParent(), fileName);
		
		return renameFile; 
		
	}
}
