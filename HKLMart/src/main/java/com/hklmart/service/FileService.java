package com.hklmart.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {

	public String getFolderPath(String absolutePath) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String datePath = sdf.format(date).replace("-", File.separator);
		String path = absolutePath + "\\" + datePath;
		return path;
	}
	
	public void createFolder() {
		
	}
	
	public void saveFile(MultipartFile file) {
		
	}

}
