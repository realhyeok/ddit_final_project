

function myOverlayOn(dist) {
	$(dist).fadeIn(300);
}

function myOverlayOff(dist) {
	$(dist).fadeOut(300);
}

var prevTarget = [];

function getOverlayMailRegistTemplate(userFrom) {
	myOverlayOn("#myPopOverlay");
	$(".sendOverlayUserTo").val(userFrom);
	/*var appe = document.querySelector('#myPopOverlay');
	appe.innerHTML = html;*/
	$("#fadeInContent").fadeIn(300);
	
	summernote_go($('.overlaySendContent'));
}

function getOverlayTaskRegistTemplate(userFrom) {
	myOverlayOn("#myTaskOverlay");
	/*var appe = document.querySelector('#myTaskOverlay');
	appe.innerHTML = html;*/
	$("#fadeInTaskContent").fadeIn(300);
	
	summernote_go($('.taskOverlayContent'));
}

function getOverlayTaskModifyTemplate(taskNo, projNo) {
	myOverlayOn("#myTaskModifyOverlay");
	
	var taskVO = {
		"taskNo" : taskNo,
		"projNo" : projNo
	};
	
	$.ajax({
		type    : "GET",
		url     : "task/getTaskDetailByTaskNo",
		dataType: "JSON",
		data    : taskVO,
		success : function(data){
			console.log("MyTask ModifyForm - Handlebars success!!");
			myTaskModifyForm(data);
			summernote_go($('.myTaskOverlayContentModify'));
			$("#fadeInTaskModifyContent").fadeIn(300);
		},
		error   : function(error){
			console.log("MyTask ModifyForm - Handlebars error!!");
		}
	});
	
	/*$.ajax({
		type    : "GET",
		url     : "task/getTaskDetailByTaskNo",
		dataType: "JSON",
		data    : taskVO,
		success : function(data){
			console.log("MyTask ModifyForm - Handlebars success!!");
			
			alert("ㅋㅋㅋ");*/
			/*var template = document.querySelector("#myTaskModifyFormTemplate").innerText;
			var bindTemplate = Handlebars.compile(template);
			var appe = document.querySelector('#myTaskModifyOverlay');
			var html = bindTemplate(data);
			appe.innerHTML = html;
			$("#fadeInTaskModifyContent").fadeIn(300);
			*/
	/*	},
		error   : function(error){
			console.log("MyTask ModifyForm - Handlebars error!!");
		}
	});*/
	/*
	$("#fadeInTaskModifyContent").fadeIn(300);
	
	summernote_go($('.taskModifyOverlayContent'));*/
	
}
