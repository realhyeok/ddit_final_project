package com.probada.mail.web;

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
import com.probada.mail.service.MailService;
import com.probada.mail.utils.GetAttachesByMultipartFileAdapter;
import com.probada.mail.vo.AttachVO;
import com.probada.mail.vo.MailVO;

@Controller
@RequestMapping("app/myWork")
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	@Resource(name="mailAttachPath")
	private String mailAttachPath;
	
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
	public ResponseEntity<MailVO> mailDetailTOJSON(String mailNo) throws Exception {
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
	public ResponseEntity<MailVO> receiveMailDetailTOJSON(String mailNo) throws Exception {
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
	public String attachDownload(String filePath, Model model) throws Exception {
		String url = "downloadFile";
		
		String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
		filePath = filePath.substring(3);
		
		model.addAttribute("savedPath", filePath);
		model.addAttribute("fileName", fileName);
		
		return url;
	}
	
	//메일 복구(한개)
	@RequestMapping("/returnMail")
	@ResponseBody
	public ResponseEntity<String> returnMail(String mailNo, String mailDist) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			if(mailDist.equals("receiveMail")) {
				mailService.returnReceiveMail(mailNo);
			}else if(mailDist.equals("sendMail")) {
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
	public ResponseEntity<String> deleteMailToTrash(String mailNo, String mailDist) throws Exception {
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
		
		String mailNumbers[] = mailNo.split(",");
		
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
	public ResponseEntity<String> deleteMail(String mailNo, String mailDist) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			if(mailDist.equals("tempMail")) {
				mailService.deleteTempMail(mailNo);
			}else if(mailDist.equals("trashReceiveMail")) {
				mailService.deleteTrashReceiveMail(mailNo);
			}else  if(mailDist.equals("trashSendMail")) {
				mailService.deleteTrashSendMail(mailNo);				
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
		
		String mailNumbers[] = mailNo.split(",");
		
		try {
			if(mailDist.equals("tempMail")) {
				for(int i = 0; i < mailNumbers.length; i++) {
					mailService.deleteTempMail(mailNumbers[i]);
				}
			}else if(mailDist.equals("trashReceiveMail")) {
				for(int i = 0; i < mailNumbers.length; i++) {
					mailService.deleteTrashReceiveMail(mailNumbers[i]);
				}
			}else if(mailDist.equals("trashSendMail")) {
				for(int i = 0; i < mailNumbers.length; i++) {
					mailService.deleteTrashSendMail(mailNumbers[i]);
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
	public String mailRegist(MailRegistCommand regData) throws Exception {
		String url = "redirect:/app/myWork/";
		
		MailVO mailVO = regData.toMailVO();
		
		//저장 후 attachList 생성, MailVO 인가
		List<AttachVO> attachList = GetAttachesByMultipartFileAdapter.save(regData.getAttachFile(), mailAttachPath);
		mailVO.setAttachList(attachList);
		
		mailService.registMailAttachFile(mailVO);
		
		return url;
	}
}
