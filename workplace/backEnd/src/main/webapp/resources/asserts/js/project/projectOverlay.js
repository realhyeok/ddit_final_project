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
			uploadForm('projectTaskUpload');
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
 * 이슈 등록 템플레이트
 * @param templateId
 * @param url
 * @param IssueNo
 * @returns
 */
function getOverlayIssueRegistTemplate(templateId, url) {

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
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.projSummnote'));
		},
		error : function(error) {
			console.log("Handlebars error!!");
		},
	});

}

function getOverlayMileRegistTemplate(templateId, url) {

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
			$("#mileIssueTag").kendoMultiSelect({
				autoClose: false
			});

		},
		error : function(error) {
			console.log("Handlebars error!!");
		},
	});

}


function getOverlayMileModifyTemplate(templateId, url, mileNo) {

	var mileVO = {"mileNo": mileNo};

	on();
	$.ajax({
		type : 'GET',
		url : url,
		dataType : "JSON",
		data : mileVO,
		success : function(data) {
			console.log("Handlebars success!!");
			var template = document.querySelector("#" + templateId).innerText;
			var bindTemplate = Handlebars.compile(template);
			var appe = document.querySelector('#popoverlay');
			var html = bindTemplate(data);
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.projSummnote'));
			var issueTitle = [];
			var issueNo = [];
			console.log(data.mileVO.issueList);
			if(data.mileVO.issueList != null){
				for(var i = 0; i < data.mileVO.issueList.length; i++){
					issueTitle.push(data.mileVO.issueList[i].title);
					issueNo.push(data.mileVO.issueList[i].issueNo);
					console.log(issueTitle);
				}
				$("#mileIssueTag").kendoMultiSelect({
					autoClose: false,
					value:issueNo,
				});
			} else {
				$("#mileIssueTag").kendoMultiSelect({
					autoClose: false
				});
			}


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

function modifyIssueDetail() {
	var issueVO = $('#modifyIssueForm').serialize();
	console.log(issueVO);
	issueVO += '&projNo='+projNo;
	console.log(issueVO);

	$.ajax({
		url : "/app/issue/modifyIssueByIssueNo",
		type : 'POST',
		datatype : 'text',
		data : issueVO,
		success : function(data) {
			alert("수정에 성공했습니다.");
			console.log(data.issueNo);
			getIssueTemplate('/app/issue/getIssueByIssueNo',data.issueNo,'issueDetailForm','issueDetailFormTarget')
			off();
		}, // success
		error : function(xhr, status) {
			alert("fail");
			alert(xhr + " : " + status);
		}
	});
}

function modifyMileDetail() {
	var mileNo = $('#modifyMileForm input[name="mileNo"]').val();
	var userId = $('#modifyMileForm select[name="userId"]').val();
	var status = $('#modifyMileForm select[name="status"]').val();
	var title = $('#modifyMileForm input[name="title"]').val();
	var content = $('#modifyMileForm textarea[name="content"]').val();

	var issueNoList = $('#modifyMileForm select[name="issueList"]').val();

	console.log(issueNoList);

	var mileVO = {
		"mileNo":mileNo,
		"userId":userId,
		"status":status,
		"title":title,
		"content":content,
		"projNo":projNo,
		"issueNoList":issueNoList
	}
	console.log(mileVO);
	$.ajax({
		url : "/app/milestone/modifyMilestoneByMileNo",
		type : 'POST',
		data : JSON.stringify(mileVO),
		contentType:'application/json;charset=UTF-8',
		success : function(data) {
			alert("수정에 성공했습니다.");
			document.getElementById('issue-tab').click();
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
	var taskVO = $('#registTaskForm')[0];
	var formData = new FormData(taskVO);
	formData.append("projNo",projNo);
	
	console.log(taskVO);
	console.log(formData);

	$.ajax({
		url : "/app/task/registTask",
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

function registIssue() {
	var issueVO = $('#registIssueForm').serialize();
	console.log(issueVO);
	issueVO += '&projNo='+projNo;
	console.log(issueVO);

	$.ajax({
		url : "/app/issue/registIssue",
		type : 'POST',
		datatype : 'text',
		data : issueVO,
		success : function(data) {
			alert("등록에 성공했습니다.");
			console.log(data.issueNo);
			getIssueTemplate('/app/issue/getIssueByIssueNo',data.issueNo,'issueDetailForm','issueDetailFormTarget')
			off();
		}, // success
		error : function(xhr, status) {
			alert("fail");
			alert(xhr + " : " + status);
		}
	});
}

function registMileDetail() {
	var mileNo = $('#registMileForm input[name="mileNo"]').val();
	var userId = $('#registMileForm select[name="userId"]').val();
	var status = $('#registMileForm select[name="status"]').val();
	var title = $('#registMileForm input[name="title"]').val();
	var content = $('#registMileForm textarea[name="content"]').val();

	var issueNoList = $('#registMileForm select[name="issueList"]').val();

	console.log(issueNoList);

	var mileVO = {
		"mileNo":mileNo,
		"userId":userId,
		"status":status,
		"title":title,
		"content":content,
		"projNo":projNo,
		"issueNoList":issueNoList
	}
	console.log(mileVO);
	$.ajax({
		url : "/app/milestone/registMilestoneDetail",
		type : 'POST',
		data : JSON.stringify(mileVO),
		contentType:'application/json;charset=UTF-8',
		success : function(data) {
			alert("등록에 성공했습니다.");
			document.getElementById('issue-tab').click();
			off();
		}, // success
		error : function(xhr, status) {
			alert("fail");
			alert(xhr + " : " + status);
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

$(document).ready(function(){
	var endPoint = window.location.search;

	if(getCookie('endPoint')){
		if(getCookie('endPoint') != endPoint){
			delCookie('endPoint');
		}
	}

	document.cookie = "endPoint="+endPoint;

	if(getCookie('projTab')){
		var curTab = getCookie('projTab');
		curTab = curTabCheck(curTab);
		document.getElementById(curTab).click();
	} else if(!getCookie('projTab')) {
		document.getElementById('home-tab').click();
	}

	$('a[role="tab"]').on('click', function() {
		var id = this.id
		document.cookie = "projTab="+id;
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
