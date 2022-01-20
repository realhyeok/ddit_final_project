package com.probada.user.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.probada.user.vo.FolderVO;
import com.probada.user.vo.UploadTestVO;




@RestController
@RequestMapping("/test")
public class TestDoc {
	
	
	@PostMapping(value="/doc")
	private void sendFile (HttpServletRequest request, @RequestParam("file")MultipartFile uploadFile) throws Exception{

		
		
		String fileName = null;
		String uploadPath = "c:/attach/board/img";
		fileName = uploadFile.getOriginalFilename();
	
		System.out.println(fileName);
	
		File storeFile = new File(uploadPath, fileName);
		storeFile.mkdirs();
		
		uploadFile.transferTo(storeFile);
		
		
	}
	
	
	
	@PostMapping(value="/create")
	@ResponseBody
	private FolderVO createFolder(String folderName) throws Exception{

		ResponseEntity<String> entity = null;
		
		FolderVO folder = new FolderVO();
		
		folder.setName(folderName);
		
		
		return folder;
			
		
	}
	
	
	
	@PostMapping(value = "/read", produces = MediaType.IMAGE_JPEG_VALUE)
	public ResponseEntity<byte[]> userSearch(@PathVariable("imagename") String imagename) throws IOException {
		System.out.println("test");
		InputStream imageStream = new FileInputStream("c:/attach");
//		InputStream imageStream = new FileInputStream("/home/ubuntu/images/feed/" + imagename);
		byte[] imageByteArray = IOUtils.toByteArray(imageStream);
		imageStream.close();
		return new ResponseEntity<byte[]>(imageByteArray, HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
