/**
 * 기본 템플레이트 가져오기
 * @param templateId
 * @returns
 */
function getOverlayTemplate(templateId) {

	on();
	var template = document.querySelector("#" + templateId).innerText;
	var bindTemplate = Handlebars.compile(template);
	var appe = document.querySelector('#popoverlay');
	var html = bindTemplate();
	appe.innerHTML = html;
	$("#fadeInContent").fadeIn(300);
	prevTarget.push(templateId);
	console.log(prevTarget);

	if (templateId == "projRegistFormTemplate")  {
		summernote_go($('.projSummnote'));
	}

}
/**
 * 프로젝트 수정 템플레이트 가져오기
 * @param templateId
 * @param url
 * @returns
 */
function getOverlayModifyTemplate(templateId, url) {

	on();
	$.ajax({
		type : 'GET',
		url : url,
		dataType : "JSON",
		data : {
			"projNo" : projNo
		},
		success : function(data) {
			console.log("Handlebars success!!");
			var template = document.querySelector("#" + templateId).innerText;
			var bindTemplate = Handlebars.compile(template);
			var appe = document.querySelector('#popoverlay');
			var html = bindTemplate(data);
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.projSummnote'));
		},
		error : function(error) {
			console.log("Handlebars error!!");
		},
	});

}


/**
 * 업무 등록 템플레이트 가져오기
 * @param templateId
 * @param url
 * @returns
 */
function getOverlayRegistTaskTemplate(templateId, url) {

	on();
	$.ajax({
		type : 'GET',
		url : url,
		dataType : "JSON",
		data : {
			"projNo" : projNo
		},
		success : function(data) {
			console.log("Handlebars success!!");
			var template = document.querySelector("#" + templateId).innerText;
			var bindTemplate = Handlebars.compile(template);
			var appe = document.querySelector('#popoverlay');
			var html = bindTemplate(data);
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.projSummnote'));
		},
		error : function(error) {
			console.log("Handlebars error!!");
		},
	});

}

/**
 * 업무 수정 템플레이트 가져오기
 * @param templateId
 * @param url
 * @param taskNo
 * @returns
 */
function getOverlayTaskModifyTemplate(templateId, url, taskNo) {

	var taskVO = {"projNo": projNo, "taskNo": taskNo};

	on();
	$.ajax({
		type : 'GET',
		url : url,
		dataType : "JSON",
		data : taskVO,
		success : function(data) {
			console.log("Handlebars success!!");
			var template = document.querySelector("#" + templateId).innerText;
			var bindTemplate = Handlebars.compile(template);
			var appe = document.querySelector('#popoverlay');
			var html = bindTemplate(data);
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.projSummnote'));
		},
		error : function(error) {
			console.log("Handlebars error!!");
		},
	});

}

/**
 * 이슈 수정 템플레이트
 * @param templateId
 * @param url
 * @param IssueNo
 * @returns
 */
function getOverlayIssueModifyTemplate(templateId, url, IssueNo) {

	var issueVO = {"projNo": projNo, "IssueNo": IssueNo};

	on();
	$.ajax({
		type : 'GET',
		url : url,
		dataType : "JSON",
		data : issueVO,
		success : function(data) {
			console.log("Handlebars success!!");
			var template = document.querySelector("#" + templateId).innerText;
			var bindTemplate = Handlebars.compile(template);
			var appe = document.querySelector('#popoverlay');
			var html = bindTemplate(data);
			appe.empty();
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.projSummnote'));
		},
		error : function(error) {
			console.log("Handlebars error!!");
		},
	});

}

/* ------------------------------------------- SUBMIT 용 -------------------------------------------*/


function modifyProjectDetail() {
	var projectVO = $('#modifyProjectForm').serialize();
	projectVO += '&projNo='+projNo;
	console.log(projectVO);

	$.ajax({
		url : "/app/project/modifyProjectDetail",
		type : 'POST',
		datatype : 'text',
		data : projectVO,
		success : function(data) {
			alert("수정에 성공했습니다.");
			getTemplate('/app/project/getProjectByProjNo','projectDetailIntro','projectDetailIntroTarget');
			off();
		}, // success
		error : function(xhr, status) {
			alert("fail");
			alert(xhr + " : " + status);
		}
	});
}

function modifyTaskDetail() {
	var taskVO = $('#modifyTaskForm').serialize();
	console.log(taskVO);
	taskVO += '&projNo='+projNo;
	console.log(taskVO);

	$.ajax({
		url : "/app/task/modifyTaskDetailByTaskNo",
		type : 'POST',
		datatype : 'text',
		data : taskVO,
		success : function(data) {
			alert("수정에 성공했습니다.");
			getTaskTemplate('/app/task/getTaskDetailByTaskNo',data.taskNo,'taskDetailForm','taskDetailFormTarget')
			off();
		}, // success
		error : function(xhr, status) {
			alert("fail");
			alert(xhr + " : " + status);
		}
	});
}

function modifyProjectNotice() {

	console.log("hello");

	checkValidate("modifyProjectNotice", "notice");

	var noticeVal = $('#modifyProjectNotice [name="notice"]').val();

	if(noticeVal == ""){

		$('#modifyProjectNotice [name="notice"]').parents('div.custom-validate').attr('class','item form-group custom-validate error');

		return

	} else {
		$('#modifyProjectNotice [name="notice"]').parents('div.custom-validate').attr('class','item form-group custom-validate');
	}

	var projectVO = $('#modifyProjectNotice').serialize();

	projectVO += '&projNo='+projNo;

	$.ajax({
		url : "/app/project/modifyProjectNotice",
		type : 'POST',
		datatype : 'text',
		data : projectVO,
		success : function(data) {
			alert("요청이 완료되었습니다.");
			getTemplate('/app/project/getProjectByProjNo','projectDetailNotify','projectDetailNotifyTarget');
			off();
		}, // success
		error : function(xhr, status) {
			alert("요청에 실패했습니다.");
		}
	});

};



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

function registTask() {
	var taskVO = $('#registTaskForm').serialize();

	taskVO += '&projNo='+projNo;
	console.log(taskVO);

	$.ajax({
		url : "/app/task/registTask",
		type : 'POST',
		datatype : 'text',
		data : taskVO,
		success : function(data) {
			alert("등록에 성공했습니다.");
			if(getCookie('tab') == 'task-tab'){
				setTimeout(readTask, 100);
			} else if(getCookie('tab') == 'gantt-tab'){
				setTimeout(ganttRefresh, 300);
			}
			off();
		}, // success
		error : function(xhr, status) {
			alert("등록에 실패하였습니다.");
		}
	});

}

function registTaskOnGantt() {
	var taskVO = $('#registTaskForm').serialize();

	taskVO += '&projNo='+projNo;
	console.log(taskVO);

	$.ajax({
		url : "/app/task/registTask",
		type : 'POST',
		datatype : 'text',
		data : taskVO,
		success : function(data) {
			alert("등록에 성공했습니다.");

			off();
		}, // success
		error : function(xhr, status) {
			alert("등록에 실패하였습니다.");
		}
	});

}

/* ------------------------------------------- 필수 함수들 -------------------------------------------*/

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
