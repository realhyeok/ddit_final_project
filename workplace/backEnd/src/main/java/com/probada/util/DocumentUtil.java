package com.probada.util;

import java.util.List;

import javax.annotation.Resource;

import com.probada.document.service.DocumentService;

public class DocumentUtil {

	@Resource(name="documentService")
	DocumentService documentService;

	/*public List<Object> getDocumentListByProjNo(String projNo) {

		documentService.getDocumentListForProjDetail(projNo);

	}*/
}
