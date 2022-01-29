

function on() {
	$("#popoverlay").fadeIn(300);
}

function off() {
	$("#popoverlay").fadeOut(300);
}

var prevTarget = [];

function getOverlayModifyTemplate(templateId, url) {

	on();
	
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
			var template = document.querySelector("#" + templateId).innerText;
			var bindTemplate = Handlebars.compile(template);
			var appe = document.querySelector('#popoverlay');
			var html = bindTemplate(data);
			console.log(html);
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.cprojSummnote'));
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
			getTemplate('/app/collabo/getCollboByProjNo','collaboDetailIntro','collaboDetailIntroTarget');
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