package com.probada.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.probada.document.service.DocumentService;
import com.probada.document.vo.FileVO;
import com.probada.task.vo.TaskVO;
import com.probada.user.vo.UserVO;

public class DocumentUtil {

	@Resource(name="documentService")
	DocumentService documentService;

	private static final Logger LOGGER = LoggerFactory.getLogger(DocumentUtil.class);

	/*public List<Object> getDocumentListByProjNo(String projNo) {

		documentService.getDocumentListForProjDetail(projNo);

	}*/

	public void taskUpload (List<MultipartFile> files, HttpServletRequest request, HttpServletResponse response, TaskVO taskVO) throws Exception{

		try {

			for (MultipartFile file : files) {

				String path = taskVO.getProjTitle()+"/업무/"+taskVO.getTitle();
				String name;
				String realFileName;
				String req = documentService.seqDoc();
				String uploadPath = "c:/"+path;					// 3조 PMS probada/업무/업무명
				String fileName = file.getOriginalFilename();		// jQuery.jpg
				String fullPath = path+"/"+fileName;					// 3조 PMS probada/업무/업무명/jQuery.jpg
				String extension = "";
				LOGGER.debug("req : {}",req);
				LOGGER.debug("uploadPath : {}",uploadPath);
				LOGGER.debug("fileName : {}",fileName);
				LOGGER.debug("fullPath : {}",fullPath);

				int size = Integer.parseInt(file.getSize()+"");
				LOGGER.debug("size : {}",size);

				LOGGER.debug("file.getOriginalFilename() =>"+file.getOriginalFilename());
				if(file.getOriginalFilename() != "") {
					extension = fileName.substring(fileName.lastIndexOf("."));
					if(extension== null) {
						extension = "";
					}
					LOGGER.debug("extension : {}",extension);
				}else {
					continue;
				}

				//같은 이름 중복 방지
				name  = sameFileProcess(response, fullPath);
				if(name.equals("sameName")) {
					response.sendError(response.SC_BAD_REQUEST);
					return;
				}

				if(fileName.substring(0,fileName.lastIndexOf(".")).equals("")) {
					realFileName = req.substring(3,req.length()).concat("제목없음");
				}else {
					realFileName = fileName.substring(0,fileName.lastIndexOf("."));
				}

				File storeFile = new File(uploadPath,fileName);
				storeFile.mkdirs();

				file.transferTo(storeFile);

				FileVO doc = new FileVO();

				String seq = documentService.seqDoc();

				doc.setEtc("0");
				doc.setDOC_NO(seq);
				//하드코딩

				HttpSession session = request.getSession();
				UserVO userVO = (UserVO) session.getAttribute("userVO");
				String userId = userVO.getUserId();
				doc.setPROJ_NO(taskVO.getProjNo());
				doc.setUSER_ID(userId);


				doc.setHasDirectories(false);
				doc.setIsDirectory(false);
				doc.setExtension(extension);
				doc.setName(realFileName);
				doc.setPath(path+"/"+realFileName+extension);
				doc.setSize(size);

				LOGGER.debug("doc : {}",doc);

				documentService.registDocument(doc);

			}

		}catch (Exception e) {
			e.getStackTrace();
			throw e;
		}
	}


	public TaskVO readTaskDocByTaskTitleANDprojNo(TaskVO detailVO) throws Exception {

		List<FileVO> fileList = documentService.getDocumentListBytaskTitleANDprojNo(detailVO);
		detailVO.setFileList(fileList);

		return detailVO;

	}

	public void documentRemoveResolver(FileVO fileVO) throws Exception{


		String path = fileVO.getPath();
		String docId = fileVO.getDOC_NO();
		File originFile = new File("c:/"+path);
		LOGGER.debug(path +"/"+ docId);

		originFile.delete();
		documentService.removeDocument(docId);

	}

	public String sameFileProcess(HttpServletResponse res, String fullPath) throws Exception{


		//String sr2 = String.format("안녕하세요. %s 입니다.","dfdf");
		//같은 파일 등록 시 +1path와 name에 (1)추가할까말까
		List<FileVO> fileVO = new ArrayList<FileVO>();
		String name = "difName";


		fileVO = documentService.getDocList();

		//같은 이름 중복 방지
		for ( FileVO vo: fileVO) {
			if(vo.getPath().equals(fullPath)) {

				name = "sameName";

				return name;
			}
		}
		return name;
	}

}
