package com.probada.mail.web;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.probada.mail.command.MailRegistCommand;
import com.probada.mail.command.TempMailRegistCommand;
import com.probada.mail.service.MailService;
import com.probada.mail.utils.GetAttachFilesSize;
import com.probada.mail.utils.GetAttachesByMultipartFileAdapter;
import com.probada.mail.utils.MakeFileName;
import com.probada.mail.vo.AttachVO;
import com.probada.mail.vo.MailVO;
import com.probada.payment.service.PaymentsBillService;
import com.probada.user.service.UserService;
import com.probada.user.vo.UserVO;


@Controller
@RequestMapping("app/myWork")
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private PaymentsBillService paymentsBillService;
	
	@Autowired
	private UserService userService;
	
	@Resource(name="mailAttachPath")
	private String mailAttachPath;
	
	//첨부파일 한계용량 체크
	@RequestMapping("/getMemoryCapacity")
	@ResponseBody
	public ResponseEntity<Integer> getMemoryCapacity(String userId) throws Exception {
		ResponseEntity<Integer> entity = null;
		String planNo = null;
		int memoryCapacity = 0;
		try {
			planNo = paymentsBillService.getPlanNo(userId);
			memoryCapacity = paymentsBillService.getMemoryCapacity(planNo);
			entity = new ResponseEntity<Integer>(memoryCapacity, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	//받은메일 리스트 조회
	@RequestMapping("/getReceiveMailList")
	@ResponseBody
	public ResponseEntity<List<MailVO>> receiveMailListToJSON(String userTo) throws Exception {
		ResponseEntity<List<MailVO>> entity = null;
		List<MailVO> receiveMailList = null;
		
		try {
			receiveMailList = mailService.getReceiveMailList(userTo);
			entity = new ResponseEntity<List<MailVO>>(receiveMailList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MailVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	//보낸메일 리스트 조회
	@RequestMapping("/getSendMailList")
	@ResponseBody
	public ResponseEntity<List<MailVO>> sendMailListToJSON(String userFrom) throws Exception {
		ResponseEntity<List<MailVO>> entity = null;
		List<MailVO> sendMailList = null;
		
		try {
			sendMailList = mailService.getSendMailList(userFrom);
			entity = new ResponseEntity<List<MailVO>>(sendMailList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MailVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	//임시메일 리스트 조회
	@RequestMapping("/getTempMailList")
	@ResponseBody
	public ResponseEntity<List<MailVO>> tempMailListToJSON(String userFrom) throws Exception {
		ResponseEntity<List<MailVO>> entity = null;
		List<MailVO> tempMailList = null;
		
		try {
			tempMailList = mailService.getTempMailList(userFrom);
			entity = new ResponseEntity<List<MailVO>>(tempMailList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MailVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	//휴지통 리스트 조회
	@RequestMapping("/getTrashMailList")
	@ResponseBody
	public ResponseEntity<List<MailVO>> trashMailListToJSON(String userId) throws Exception {
		ResponseEntity<List<MailVO>> entity = null;
		List<MailVO> trashMailList = null;
		
		try {
			trashMailList = mailService.getTrashMailList(userId);
			entity = new ResponseEntity<List<MailVO>>(trashMailList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MailVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	//메일 상세 조회
	@RequestMapping("/getMailDetail")
	@ResponseBody
	public ResponseEntity<MailVO> mailDetailTOJSON(int mailNo) throws Exception {
		ResponseEntity<MailVO> entity = null;
		MailVO mailDetail = null;
		try {
			mailDetail = mailService.getMailByMailNo(mailNo);
			entity = new ResponseEntity<MailVO>(mailDetail, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<MailVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}

	//받은메일 상세 조회
	@RequestMapping("/getReceiveMailDetail")
	@ResponseBody
	public ResponseEntity<MailVO> receiveMailDetailTOJSON(int mailNo) throws Exception {
		ResponseEntity<MailVO> entity = null;
		MailVO mailDetail = null;
		try {
			mailDetail = mailService.getReceiveMailByMailNo(mailNo);
			entity = new ResponseEntity<MailVO>(mailDetail, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<MailVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	//메일 첨부파일 다운로드
	@RequestMapping("/attachDownload")
	public String attachDownload(int attachNo, Model model) throws Exception {
		String url = "downloadFile";
		
		AttachVO attachVO = mailService.getAttachByAttachNo(attachNo);
		String filePath = attachVO.getFilePath();
		String fileName = attachVO.getFileName();
		
		filePath = filePath.substring(3);
		filePath = filePath + "/" +fileName;
		model.addAttribute("savedPath", filePath);
		model.addAttribute("fileName", fileName);
		
		return url;
	}
	
	//메일 복구(한개)
	@RequestMapping("/returnMail")
	@ResponseBody
	public ResponseEntity<String> returnMail(int mailNo, String mailDist) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			if(mailDist.equals("receiveMail")) {
				mailService.returnReceiveMail(mailNo);
			}else if(mailDist.equals("sendMail")) {
				mailService.returnSendMail(mailNo);
			}else if(mailDist.equals("mineMail")) {
				mailService.returnReceiveMail(mailNo);
				mailService.returnSendMail(mailNo);
			}
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	//메일 삭제(휴지통으로, 한개)
	@RequestMapping("/deleteMailToTrash")
	@ResponseBody
	public ResponseEntity<String> deleteMailToTrash(int mailNo, String mailDist) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			if(mailDist.equals("receiveMail")) {
				mailService.deleteReceiveMailToTrash(mailNo);
			}else if(mailDist.equals("sendMail")) {
				mailService.deleteSendMailToTrash(mailNo);
			}
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	//메일 삭제(휴지통으로, 여러개)
	@RequestMapping("/deleteMailToTrashAll")
	@ResponseBody
	public ResponseEntity<String> deleteMailToTrashAll(String mailNo, String mailDist) throws Exception {
		ResponseEntity<String> entity = null;
		
		String stringMailNo[] = mailNo.split(",");
		int mailNumbers[] = Arrays.stream(stringMailNo).mapToInt(Integer::parseInt).toArray();
		
		try {
			if(mailDist.equals("receiveMail")) {
				for(int i = 0; i < mailNumbers.length; i++) {
					mailService.deleteReceiveMailToTrash(mailNumbers[i]);
				}
			}else if(mailDist.equals("sendMail")) {
				for(int i = 0; i < mailNumbers.length; i++) {
					mailService.deleteSendMailToTrash(mailNumbers[i]);
				}
			}
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	//메일 삭제(완전 삭제, 한개)
	@RequestMapping("/deleteMail")
	@ResponseBody
	public ResponseEntity<String> deleteMail(int mailNo, String mailDist) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			if(mailDist.equals("tempMail")) {
				mailService.deleteTempMail(mailNo);
			}else if(mailDist.equals("trashReceiveMail")) {
				mailService.deleteTrashReceiveMail(mailNo);
			}else if(mailDist.equals("trashSendMail")) {
				mailService.deleteTrashSendMail(mailNo);		
			}else if(mailDist.equals("trashMineMail")) {
				mailService.deleteTrashSendMail(mailNo);
				mailService.deleteTrashReceiveMail(mailNo);
			}
			
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	//메일 삭제(완전 삭제, 여러개)
	@RequestMapping("/deleteMailAll")
	@ResponseBody
	public ResponseEntity<String> deleteMailAll(String mailNo, String mailDist) throws Exception {
		ResponseEntity<String> entity = null;
		
		String stringMailNo[] = mailNo.split(",");
		int mailNumbers[] = Arrays.stream(stringMailNo).mapToInt(Integer::parseInt).toArray();
		String stringMailDist[] = mailDist.split(",");
		
		try {
			for(int i = 0; i < stringMailDist.length; i++) {
				if(stringMailDist[i].equals("tempMail")) {
					mailService.deleteTempMail(mailNumbers[i]);
				}else if(stringMailDist[i].equals("trashReceiveMail")) {
					mailService.deleteTrashReceiveMail(mailNumbers[i]);
				}else if(stringMailDist[i].equals("trashSendMail")) {
					mailService.deleteTrashSendMail(mailNumbers[i]);
				}else if(stringMailDist[i].equals("trashMineMail")) {
					mailService.deleteTrashSendMail(mailNumbers[i]);
					mailService.deleteTrashReceiveMail(mailNumbers[i]);
				}
			}
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	//메일 등록
	@RequestMapping(value="/mailRegist", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String mailRegist(MailRegistCommand regData, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/app/myWork";
		
		String dist = regData.getDist();
		MailVO mailVO = regData.toMailVO();
		
		//사용량 
		String userId = mailVO.getUserFrom();
		double userUploadUsage = userService.getUser(userId).getUserUploadUsage();
		//총용량
		String planNo = paymentsBillService.getPlanNo(userId);
		double maxUploadCapacity = paymentsBillService.getMaxUploadCapacity(planNo);
		//추가용량
		double attachFileSize = GetAttachFilesSize.attachFileSize(regData.getAttachFile());
		
		double fullUsageSize = attachFileSize + userUploadUsage;
		
		if(maxUploadCapacity < fullUsageSize) {
			rttr.addFlashAttribute("from", "deniedRegistFileSize");
			return url;
		}else {
			UserVO userVO = new UserVO();
			userVO.setUserId(userId);
			userVO.setUserUploadUsage((int) fullUsageSize);
			userService.setUserUploadUsage(userVO);
			
			//저장 후 attachList 생성, MailVO 인가
			List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(regData.getAttachFile(), mailAttachPath);
			mailVO.setAttachList(attachList);
			
			if(dist.equals("temp")) {
				mailService.registTempMailAttachFile(mailVO);
				rttr.addFlashAttribute("from", "tempRegistAfter");
			}else if(dist.equals("send")) {
				mailService.registMailAttachFile(mailVO);
				rttr.addFlashAttribute("from", "sendRegistAfter");
			}
			return url;
		}
	}
	
	//임시메일 전송
	@RequestMapping(value="/tempMailRegist", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String tempMailRegist(TempMailRegistCommand modData, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/app/myWork";
		
		//사용량
		String userId = modData.getUserFrom();
		double userUploadUsage = userService.getUser(userId).getUserUploadUsage();
		//총용량
		String planNo = paymentsBillService.getPlanNo(userId);
		double maxUploadCapacity = paymentsBillService.getMaxUploadCapacity(planNo);
		
		//추가할 파일 용량
		double attachFileSize = GetAttachFilesSize.attachFileSize(modData.getAttachFile());
		
		//삭제할 파일 용량
		double deleteFileSize = 0;
		
		if(modData.getDeleteFile() != null && modData.getDeleteFile().length > 0) {
			for(int attachNo : modData.getDeleteFile()) {
				AttachVO attachVO = mailService.getAttachByAttachNo(attachNo);
				File deleteFile = new File(attachVO.getFilePath(), attachVO.getFileName());
				if(deleteFile.exists()) {
					deleteFileSize += deleteFile.length();
				}
			}
		}
		deleteFileSize = deleteFileSize / (1024 * 1024);
		double fullUsageSize = userUploadUsage + attachFileSize - deleteFileSize;
		
		if(maxUploadCapacity < fullUsageSize) {
			rttr.addFlashAttribute("from", "deniedTempRegistFileSize");
			return url;
		}else {
			UserVO userVO = new UserVO();
			userVO.setUserId(userId);
			userVO.setUserUploadUsage((int) fullUsageSize);
			userService.setUserUploadUsage(userVO);
			
			//파일 삭제
			if(modData.getDeleteFile() != null && modData.getDeleteFile().length > 0) {
				for(int attachNo : modData.getDeleteFile()) {
					AttachVO attachVO = mailService.getAttachByAttachNo(attachNo);
					File deleteFile = new File(attachVO.getFilePath(), attachVO.getFileName());
					if(deleteFile.exists()) {
						deleteFile.delete();		//파일삭제
					}
					mailService.deleteAttachByAttachNo(attachNo);
				}
			}
			
			//파일 저장
			List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(modData.getAttachFile(), mailAttachPath);
			
			//MailVO 세팅
			MailVO mailVO = modData.toMailVO();
			mailVO.setAttachList(attachList);
			
			//DB저장
			mailService.tempMailToSendMail(mailVO);
			rttr.addFlashAttribute("from", "tempToSendAfter");
			return url;
		}		
	}
}
