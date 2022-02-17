function on() {
	$("#popoverlay").fadeIn(300);
}

function off() {
	$("#popoverlay").fadeOut(300);
}

var prevTarget = [];

function prev() {
	var currPage = prevTarget.pop();
	var prevPage = prevTarget.pop();
	console.log(prevPage);
	getOverlayTemplate(prevPage);
}

function checkValidate(FormId, targetName) {

		var validateValue = $('#'+FormId+' [name="'+targetName+'"]').val();

		console.log(validateValue);

		if(validateValue == ""){

			$('#'+FormId+' [name="'+targetName+'"]').parents('div.custom-validate').attr('class','item form-group custom-validate error');

			return

		} else {
			$('#'+FormId+' [name="'+targetName+'"]').parents('div.custom-validate').attr('class','item form-group custom-validate');
		}

}

$(document).ready(function(){
	var endPoint = window.location.search;

	if(getCookie('endPoint')){
		if(getCookie('endPoint') != endPoint){
			delCookie('endPoint');
		}
	}

	document.cookie = "endPoint="+endPoint;

	if(getCookie('cprojTab')){
		var curTab = getCookie('cprojTab');
		curTab = curTabCheck(curTab);
		document.getElementById(curTab).click();
	} else if(!getCookie('cprojTab')) {
		document.getElementById('home-tab').click();
	}

	$('a[role="tab"]').on('click', function() {
		var id = this.id
		document.cookie = "cprojTab="+id;
	})

// 상세 탭일경우 리스트로 돌려줌 (각 상세폼에 추가)
function curTabCheck(curTab){
	if(curTab == 'taskDetail-tab'){
		curTab = 'task-tab';
	} else if (curTab == 'issueDetail-tab'){
		curTab = 'issue-tab';
	}
		return curTab;
}

})


function getCookie(name) {
	  let matches = document.cookie.match(new RegExp(
	    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
	  ));
	  return matches ? decodeURIComponent(matches[1]) : undefined;
	}

const delCookie = function delCookie_by_name(name){
    let date = new Date();
    date.setDate(date.getDate() - 100);
    let Cookie = `${name}=;Expires=${date.toUTCString()}`
    document.cookie = Cookie;
}

//------------------------------------------------------------------------------------------------------

function getOverlayTemplate(templateId) {

	on();
	var template = document.querySelector("#" + templateId).innerText;
	var bindTemplate = Handlebars.compile(template);
	var appe = document.querySelector('#popoverlay');
	var html = bindTemplate();
	console.log(html);
	appe.innerHTML = html;
	$("#fadeInContent").fadeIn(300);
	prevTarget.push(templateId);
	console.log(prevTarget);

	if (templateId == "projRegistFormTemplate")  {
		summernote_go($('.projSummnote'));
	}

}

//콜라보 프로젝트 수정폼
function getOverlayModifyTemplate(templateId, url) {
	on();
	alert("수정폼이다");
	console.log("templateId" + templateId);
	console.log("url" + url);
	
	$.ajax({
		type : 'GET',
		url : url,
		dataType : "JSON",
		data : {
			"cprojNo" : cprojNo
		},
		success : function(data) {
			console.log("Handlebars success!!");
			console.log(document.querySelector("#" + templateId));
			var template = document.querySelector("#" + templateId).innerText;
			var bindTemplate = Handlebars.compile(template);
			var appe = document.querySelector('#popoverlay');
			var html = bindTemplate(data);
			console.log(html);
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.cprojSummernote'));
		},
		error : function(error) {
			console.log("Handlebars error!!");
		},
	});

}

//콜라보 프로젝트 수정폼
function modifyCollaboDetail() {
	var collaboVO = $('#modifyCollaboForm').serialize();
	collaboVO += '&cprojNo='+cprojNo;
	console.log(collaboVO);

	$.ajax({
		url : "/app/collabo/modifyCollaboDetail",
		type : 'POST',
		datatype : 'text',
		data : collaboVO,
		success : function(data) {
			alert("수정에 성공했습니다.");
			getTemplate('/app/collabo/getCollaboByCprojNo','collaboDetailIntro','collaboDetailIntroTarget');
			off();
			location.reload();
		}, // success
		error : function(xhr, status) {
			alert("fail");
			alert(xhr + " : " + status);
		}
	});

}

function deleteProjectNotice() {
}

//콜라보 프로젝트 공지 수정폼
function modifyCollaboNotice() {
	console.log("hello");

	checkValidate("modifyCollaboNotice", "notice");

	var noticeVal = $('#modifyCollaboNotice [name="notice"]').val();

	if(noticeVal == ""){

		$('#modifyCollaboNotice [name="notice"]').parents('div.custom-validate').attr('class','item form-group custom-validate error');

		return

	} else {
		$('#modifyCollaboNotice [name="notice"]').parents('div.custom-validate').attr('class','item form-group custom-validate');
	}

	var CollaboVO = $('#modifyCollaboNotice').serialize();

	CollaboVO += '&cprojNo='+cprojNo;

	$.ajax({
		url : "/app/collabo/modifyCollaboNotice",
		type : 'POST',
		datatype : 'text',
		data : CollaboVO,
		success : function(data) {
			alert("요청이 완료되었습니다.");
			getTemplate('/app/collabo/getCollaboByCprojNo','collaboDetailNotify','collaboDetailNotifyTarget');
			off();
			location.reload()
		}, // success
		error : function(xhr, status) {
			alert("요청에 실패했습니다.");
		}
	});

};


//-------------------------------------------------------------------------------------

//콜라보 업무 등록 템플레이트 가져오기
function getOverlayRegistCollaboTaskTemplate(templateId, url) {

	on();
	$.ajax({
		type : 'GET',
		url : url,
		dataType : "JSON",
		data : {
			"cprojNo" : cprojNo
		},
		success : function(data) {
			console.log("Handlebars success!!");
			var template = document.querySelector("#" + templateId).innerText;
			var bindTemplate = Handlebars.compile(template);
			var appe = document.querySelector('#popoverlay');
			var html = bindTemplate(data);
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.cprojSummnote'));
			uploadForm('cprojTaskUpload');
		},
		error : function(error) {
			console.log("Handlebars error!!");
		},
	});

}
//콜라보 업무 등록 기능
function registTask() {
	var collaboTaskVO = $('#registTaskForm')[0];
	var formData = new FormData(collaboTaskVO);
	formData.append("cprojNo",cprojNo);

	console.log(collaboTaskVO);
	console.log(formData);

	//파일 개수 체크
	var uploadFileList = document.querySelectorAll('.k-upload-files li');
	var remainFileList = document.querySelectorAll('.task-files li');
	var multiFileList = document.querySelectorAll('.k-file-name-size-wrapper');
	var refileLen = remainFileList.length;
	var upFileLen = uploadFileList.length;
	var muFileLen = multiFileList.length;

	if((refileLen+upFileLen+muFileLen)>6){
		alert('파일은 총 5개까지만 업로드 할 수 있습니다.');
		return;
	}

	$.ajax({
		url : "/app/collabo/registTask",
		type : 'POST',
		data : formData,
		success : function(data) {
			alert("등록에 성공했습니다.");
			if(getCookie('projTab') == 'task-tab'){
				setTimeout(readTask, 100);
			} else if(getCookie('projTab') == 'gantt-tab'){
				setTimeout(ganttRefresh, 300);
			}
			off();
		}, // success
		error : function(xhr, status) {
			alert("등록에 실패하였습니다.");
		},
		cache:false,
		contentType:false,
		processData:false
	});

}



//콜라보 업무 수정 출력 폼
function getOverlayCollaboTaskModifyTemplate(templateId, url, taskNo) {
	
	console.log("templateId  => " + templateId);
	console.log("url  => " + url);
	console.log("taskNo  => " + taskNo);
	
	var collaboTaskVO = {"cprojNo": cprojNo, "taskNo": taskNo};

	on();
	$.ajax({
		type : 'GET',
		url : url,
		dataType : "JSON",
		data : collaboTaskVO,
		success : function(data) {
			console.log("Handlebars success!!");
			var template = document.querySelector("#" + templateId).innerText;
			var bindTemplate = Handlebars.compile(template);
			var appe = document.querySelector('#popoverlay');
			var html = bindTemplate(data);
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.cprojSummnote'));
			uploadForm('cprojTaskUpload',data);
		},
		error : function(error) {
			console.log("Handlebars error!!");
		},
	});
};

//콜라보 업무 수정에서 수정하기 버튼
function modifyCollaboTaskDetail() {
	console.log("수정버튼 클릭히히히히")
	
	var collaboTaskVO = $('#modifyCollaboTaskForm')[0];
	var formData = new FormData(collaboTaskVO);
	formData.append("cprojNo",cprojNo);

	//파일 개수 체크
	var uploadFileList = document.querySelectorAll('.k-upload-files li');
	var remainFileList = document.querySelectorAll('.task-files li');
	var multiFileList = document.querySelectorAll('.k-file-name-size-wrapper');
	var refileLen = remainFileList.length;
	var upFileLen = uploadFileList.length;
	var muFileLen = multiFileList.length;

	if((refileLen+upFileLen+muFileLen)>6){
		alert('파일은 총 5개까지만 업로드 할 수 있습니다.');
		return;
	}

	$.ajax({
		url : "/app/collabo/modifyTaskDetailByTaskNo",
		type : 'POST',
		data : formData,
		success : function(data) {
			alert("수정에 성공했습니다.");
			console.log("data.taskNo = > " + data.taskNo);
			getTaskTemplate('/app/collabo/getTaskDetailByTaskNo',data.taskNo,'collaboTaskDetailForm','collaboTaskDetailFormTarget');
			off();
		}, // success
		error : function(xhr, status) {
			alert("fail");
		},
		cache:false,
		contentType:false,
		processData:false
	});
}

//-------------------------------------------------------------------------------------

function registProject() {
	var projectVO = $('#registProjectForm').serialize();
	console.log(projectVO);

	 $.ajax({
         url : "/app/project/registProject",
         type : 'POST',
         datatype : 'text',
         data : projectVO,
         success : function(data) {
        	 alert("등록에 성공했습니다.");
        	 console.log(data.projNo);
        	 location.href="project/main?projNo="+data.projNo;
        	 off();
         }, // success
         error : function(xhr, status) {
        	 alert("등록에 실패하였습니다.");
         }
     });

}



function prev() {
	var currPage = prevTarget.pop();
	var prevPage = prevTarget.pop();
	console.log(prevPage);
	getOverlayTemplate(prevPage);
}

function checkValidate(FormId, targetName) {

		var validateValue = $('#'+FormId+' [name="'+targetName+'"]').val();

		console.log(validateValue);

		if(validateValue == ""){

			$('#'+FormId+' [name="'+targetName+'"]').parents('div.custom-validate').attr('class','item form-group custom-validate error');

			return

		} else {
			$('#'+FormId+' [name="'+targetName+'"]').parents('div.custom-validate').attr('class','item form-group custom-validate');
		}

}

//-------------------------------------------------------------------------------------




