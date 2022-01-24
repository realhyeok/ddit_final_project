package com.probada.document.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.probada.document.service.DocumentService;
import com.probada.document.vo.FileVO;



@Controller
@RequestMapping("/document")
public class DocumentController {
	
	
	@Autowired
	private DocumentService documentService;
	
	
	@RequestMapping("/")
	public String main() {
		String url = "/web-app/document/documentTest";
		return url;
	}
	

	@PostMapping(value="/Upload")
	@ResponseBody
	private void sendFile (String path, @RequestParam("file")MultipartFile uploadFile,HttpServletResponse res) throws Exception{
		
		String fileName = null;
		String realFileName;
		String req = documentService.seqDoc();
		String uploadPath = "c:/"+path;//3조 PMS probada/업무
		fileName = uploadFile.getOriginalFilename();//jQuery.jpg
		String fullPath = path+"/"+fileName;
		System.out.println("upload..fullName=>"+fullPath);
		int size = Integer.parseInt(uploadFile.getSize()+"");
		String extension = fileName.substring(fileName.lastIndexOf("."));
		if(extension== null) {
			extension = "";
		}

		
		//같은 파일 등록 시 +1path와 name에 (1)추가
		List<FileVO> fileVO = new ArrayList<FileVO>();
		
		fileVO = documentService.getDocList();
		
		List<FileVO> realFileList = new ArrayList<>();
		
		
		for ( FileVO vo: fileVO) {
			
			if(vo.getPath().equals(fullPath)) {
				System.out.println("getPath=>"+vo.getPath());
				res.sendError(res.SC_BAD_REQUEST);
			}
	
		}
		

		//
		if(fileName.substring(0,fileName.lastIndexOf(".")).equals("")) {
			realFileName = req.substring(3,req.length()).concat("제목없음");
		}else {
			realFileName = fileName.substring(0,fileName.lastIndexOf("."));
		}

		File storeFile = new File(uploadPath, realFileName+extension);
		storeFile.mkdirs();
		
		uploadFile.transferTo(storeFile);
		
		FileVO doc = new FileVO();
		
		String seq = documentService.seqDoc();
		
		doc.setDOC_NO(seq);
		doc.setHasDirectories(false);
		doc.setIsDirectory(false);
		doc.setExtension(extension);
		doc.setName(realFileName);
		doc.setPath(path+"/"+realFileName+extension);
		doc.setSize(size);
		
		documentService.registDocument(doc);
		
		
	}
	
	
	
	@PostMapping(value="/Create")
	@ResponseBody
	private FileVO createFolder(String target,String doc_NO) throws Exception{


		String seq = documentService.seqDoc();
		
		String fileName = "새로운 폴더"+seq;
		String realPath;
		
		if(target == null) {
			target = "";
			realPath = fileName;
		}else {
			realPath = target+"/"+fileName;
		}
		
		String uploadPath = "c:/"+target;

		System.out.println("realPaht=>"+realPath);
		System.out.println("uploadPath->"+uploadPath);
		
		File storeFile = new File(uploadPath, fileName);
		storeFile.mkdirs();
				
		FileVO doc = new FileVO();
		
		
		doc.setDOC_NO(seq);
		doc.setHasDirectories(true);
		doc.setIsDirectory(true);
		doc.setExtension(" ");
		doc.setName(fileName);
		doc.setPath(realPath);
		doc.setSize(5000);
		
		documentService.registDocument(doc);
		
		
		System.out.println("create=>"+doc);
		
		return doc;
		

	}
	
	@PostMapping(value="/Update")
	@ResponseBody
	private FileVO update (String target, String path, String doc_NO, String name, String extension) throws Exception{

		
		
		
		if(target == null) {
			path = name;
			
		}else {
			path = target+"/"+name+extension;
		}

		
		
		FileVO doc = new FileVO();
		doc = documentService.getDocOne(doc_NO);
		
		File originFile = new File("c:/"+doc.getPath());

		doc.setPath(path);
		doc.setName(name);
		doc.setExtension(extension);

		documentService.modifyDocument(doc);
		
		FileVO newDoc = documentService.getDocOne(doc_NO);
		
		File updateFile = new File("c:/"+newDoc.getPath());
				
		boolean result = originFile.renameTo(updateFile);
		
		return doc;
	}
	
	
	
	
	
	
	
	
	@PostMapping(value="/Read")
	@ResponseBody
	public  List<FileVO>  read(String target) throws Exception {
		
		List<FileVO> fileVO = new ArrayList<FileVO>();
		
		//sql문에 where 내가 속한 프로젝트의 파일 출력 쿼리문 두개 
		// 하나 내가 속한 프로젝트 출력
		// 1,2,3 프로젝트의 파일을 출력
		
		fileVO = documentService.getDocList();
		
		List<FileVO> realFileList = new ArrayList<>();
		
		for ( FileVO vo: fileVO) {
			
	
			if(target==null && (vo.getPath().equals(vo.getName()))) {
				realFileList.add(vo);
			}else if(target != null && (vo.getPath().contains(target+"/"+vo.getName()))){
				realFileList.add(vo);
			}

			
		}
		
		return realFileList;
	}

	
	@PostMapping(value="/Destroy")
	@ResponseBody
	public  FileVO remove(String doc_NO, String path, String name, String extension) throws Exception {
			
		FileVO trash = new FileVO();
		FileVO doc = new FileVO();
		FileVO result = new FileVO();
		
		if(path!=null && name!= null && extension !=null && doc_NO !=null) {
			
			
			String orginPath = path.substring(0,3);
			

			//path만 이동시키면 되지 않을까??????????
			if(orginPath.equals("휴지통")) {
				
				
				doc = documentService.getDocOne(doc_NO);
				result = documentService.getDocOne(doc_NO);
				
				if (doc != null) {

					File file = new File("C:/" + doc.getPath());

					if (file.exists()) {
						file.delete();
					} 
					
					documentService.removeDocument(doc_NO);
					
				}

			}else {
				
				File originFile = new File("c:/"+path);
			
				if(originFile.isDirectory()) {
					originFile.delete();
					trash = documentService.getDocOne(doc_NO);
					documentService.removeDocument(doc_NO);
					
				}else {
				
					trash = documentService.getDocOne(doc_NO);
					
					trash.setPath("휴지통/"+name+extension);
					System.out.println("(name)누가 에러일까?"+name);
					System.out.println("(extension)누가 에러일까?"+extension);
					trash.setName(name);
					
					File newFile = new File("c:/"+trash.getPath());
					
					if(originFile.exists() && newFile.exists()) {
						FileUtils.moveFile(originFile, newFile);
					}
					
					documentService.modifyDocument(trash);
				}
				result = trash;
			}//휴지통으로 이동
			
			
		}
		

		return result;
		
		
	}


	
	
	@RequestMapping("/Download")
	public String download(String path, Model model) throws Exception {
		
		
		String url = "downloadFile";
		
		//디렉토리는 다운이 되지 않으니 무조건 패스가 있는 파일만 /유무 판단 안해도 가능
		String FileName = path.substring(path.lastIndexOf("/")+1);
		
		
		
		model.addAttribute("savedPath", path);
		model.addAttribute("fileName", FileName);
	
		// path = 3조 PMS probada/업무/circle-dot-o.png
		
		return url;
		
	}



}


//내가 속한 프로젝트 출력 시
//내가 속한 프로젝트 쿼리로 뽑아서 projNo에 넣으면 완성
//List<Integer> projNo = new ArrayList<>();

//projNo.add(3);
//projNo.add(4);

//List<FileVO> realFileList = new ArrayList<>();
//
//for ( FileVO vo: fileVO) {
//	
//	for(int pNo : projNo) {
//		
//		if(pNo==Integer.parseInt(vo.getPROJ_NO())) {
//		
//		
//			if(target==null && (vo.getPath().equals(vo.getName()))) {
//				realFileList.add(vo);
//			}else if(target != null && (vo.getPath().contains(target+"/"+vo.getName()))){
//				realFileList.add(vo);
//			}
//			
//		}
//	
//	}
//	
//}














