

function on() {
	$("#popoverlay").fadeIn(300);
}

function off() {
	$("#popoverlay").fadeOut(300);
}

var prevTarget = [];

function getOverlayAnyWhereMailRegistTemplate(userId) {
	anyWhereMailRegistOverlayMemory(userId);
	
	on();
	
	var template = document.querySelector("#anyWhereMailRegistFormTemplate").innerText;
	var bindTemplate = Handlebars.compile(template);
	var appe = document.querySelector('#popoverlay');
	appe.innerHTML = bindTemplate();
	$("#fadeInContent").fadeIn(300);
	summernote_go($('#anyWhereMailOverlayContent'));
}



//스푼 오버레이 실행 함수
function getOverlayAnyWhereSpoonTemplate(url) {
	console.log("url" + url);
	
	if (getCookie("projTab") == "task-tab") {
		on();
		$.ajax({
			type : 'GET',	
			url : url,
			data : {"projNo":projNo},
			success : function(data) {
				console.log("Handlebars success!!");
				console.log("data =>   " + JSON.stringify(data));
				var template = document.querySelector("#anyWhereSpoonTaskTemplate").innerText;
				var bindTemplate = Handlebars.compile(template);
				var appe = document.querySelector('#popoverlay');
				appe.innerHTML = bindTemplate(data);
				$("#fadeInContent").fadeIn(300);
				$("#selectTaskTitle").kendoMultiSelect({
					autoClose: false
				});
				
			},
			error : function(error) {
				console.log("Handlebars error!!");
			},
		});
		
	} else if (getCookie("projTab") == "issue-tab"){
		on();
		$.ajax({
			type : 'GET',	
			url : url,
			data : {"projNo":projNo},
			success : function(data) {
				console.log("Handlebars success!!");
				console.log("data =>   " + JSON.stringify(data));
				var template = document.querySelector("#anyWhereSpoonissueTemplate").innerText;
				var bindTemplate = Handlebars.compile(template);
				var appe = document.querySelector('#popoverlay');
				appe.innerHTML = bindTemplate(data);
				$("#fadeInContent").fadeIn(300);
				$("#selectTaskTitle").kendoMultiSelect({
					autoClose: false
				});
				
			},
			error : function(error) {
				console.log("Handlebars error!!");
			},
		});
	}
	
}

function SpoonTask_go() {
	alert("gg");
}


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
			console.log(html);
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.projSummnote'));
		},
		error : function(error) {
			console.log("Handlebars error!!");
		},
	});

}

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

function anyWhereMailRegistOverlayMemory(uid){
	var anyWhereMailMemoryCapacity = null;
	
	var userId = uid;

	$.ajax({
		url: "/app/myWork/getMemoryCapacity",
		type: "get",
		async: false,
		data: {
			"userId" : userId
		},
		success: function(data){
			anyWhereMailMemoryCapacity = data;
		},
		error: function(error){
			alert(error.status);
		}
	});
	
	$(document).on('change', '.anyWhereMailOverlayAttachFile', function(event){
		if(this.files[0].size > anyWhereMailMemoryCapacity * 1024 * 1024){
			alert("파일 용량은 " + anyWhereMailMemoryCapacity + "MB 이하만 가능합니다.");
			this.value="";
			$(this).click();
			return;
		}
	});
}
	

var dataNum = 0;

function addOverlayAnyWhereFile_go(){
	if($('input[class="anyWhereMailOverlayAttachFile"]').length >= 5){
		alert("파일 추가는 5개 까지만 가능합니다.");
		return;
	}

	var div = $('<div>').addClass("inputRow").addClass("mb-1").attr("data-no", dataNum);
	var input = $('<input>').attr({"type":"file", "name":"attachFile", "class":"anyWhereMailOverlayAttachFile"}).css("display", "inline");
	
	div.append(input).append("<button type='button' class='badge bg-red' onclick='removeOverlayAnyWhereAttachFile_go(" + dataNum + ")' style='border:0;outline:0;'>X</button>");
	$('.overlayFileAnyWhereInput').append(div);
	
	dataNum++;
}

function removeOverlayAnyWhereAttachFile_go(dataNum){
	$('div[data-no="' + dataNum + '"]').remove();
}

function mailOverlayAnyWhereRegist_go(dist, uFrom){
	var userTo = $("#anyWhereMailOverlayUserTo").val();
	var userFrom = uFrom;
	
	if(dist == "temp"){
		if(userTo == userFrom){
			$("#anyWhereOverlayDist").val("tempMine");
		}else{
			$("#anyWhereOverlayDist").val("temp");
		}
	}else if(dist == "send"){
		if(userTo == userFrom){
			$("#anyWhereOverlayDist").val("mine");
		}else{
			$("#anyWhereOverlayDist").val("send");
		}
	}
	
	var files = $('input[class="anyWhereMailOverlayAttachFile"]');
	for(var file of files){
		console.log(file.name + " : " + file.value);
		if(file.value == ""){
			alert("파일을 선택해주세요.");
			file.focus();
			file.click();
			return;
		}
	}

	if($("input[id='anyWhereMailOverlayTitle']").val() == ""){
		alert("제목을 입력해주세요.");
		$("input[id='anyWhereMailOverlayTitle']").focus();
		return;
	}
	if($("input[id='anyWhereMailOverlayUserTo']").val() == ""){
		alert("메일을 입력해주세요.");
		$("input[id='anyWhereMailOverlayUserTo']").focus();
		return;
	}
	if($("textarea[id='anyWhereMailOverlayContent']").val() == ""){
		alert("내용을 입력해주세요.");
		$("textarea[id='anyWhereMailOverlayContent']").focus();
		return;
	}
	if(dist == "send"){
		var receiverId = $("#anyWhereMailOverlayUserTo").val();
		var nickname = userFrom;
		mailAlarm(nickname, receiverId);
	}
	document.overlayAnyWhereMailRegistForm.submit();
}

function mailAlarm(nickname, receiverId){
	var nickname   = nickname;
	var where      = "메일";
	var target     = "메일";
	var whatTodo   = "전송";
	var projNo     = "0";
	var receiverId = receiverId;
	
	let mailRegistSocketData = {
		"nickname"   : nickname,
		"where"      : where,
		"target"     : target,
		"whatToDo"   : whatTodo,
		"projNo"     : projNo,
		"receiverId" : receiverId
	}
	
	if(socket){
		let mailRegistSocketMsg = mailRegistSocketData.nickname 
						  + "," + mailRegistSocketData.where 
						  + "," + mailRegistSocketData.target 
						  + "," + mailRegistSocketData.whatToDo 
						  + "," + mailRegistSocketData.projNo
						  + "," + mailRegistSocketData.receiverId;
		socket.send(mailRegistSocketMsg);
	}
}