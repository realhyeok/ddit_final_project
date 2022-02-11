

function myOverlayOn(dist) {
	$(dist).fadeIn(300);
}

function myOverlayOff(dist) {
	$(dist).fadeOut(300);
}

var prevTarget = [];

function getOverlayMyMileRegistTemplate(userId) {
	myOverlayOn("#myMileOverlay");
	$.ajax({
		type    : "GET",
		url     : "/app/issue/getIssueListByUserId",
		dataType: "JSON",
		data    : {"userId" : userId},
		success : function(data){
			myMileRegistForm(data);
			summernote_go($('.myMileRegistSummernote'));
			changeProjectAndIssue();
		},
		error   : function(error){
			console.log("MyMile RegistForm - Handlebars error!!");
		}
	});	
}


function getOverlayMailRegistTemplate(userFrom) {
	myOverlayOn("#myPopOverlay");
	$(".sendOverlayUserTo").val(userFrom);
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
}

function changeProjectAndIssue(){
	var projNo = $('#registMyMileForm select[name="projNo"]').val(); 
	var userId = $('#registMyMileForm select[name="userId"]').val(); 
	
	$.ajax({
		type    : "GET",
		url     : "/app/issue/getIssueListByProjNoAndUserId",
		dataType: "JSON",
		data    : {
			"projNo" : projNo,
			"userId" : userId
		},
		success : function(data){
			var issueList = "";
			for(var i = 0; i < data.length; i++){
				issueList += "<option value='" + data[i].issueNo +"'>" + data[i].title + "</option>";
			}
			$("#myMileIssueTag").empty().append(issueList);
			$("#myMileIssueTag").kendoMultiSelect({
				autoClose: false
			});
		},
		error   : function(error){
			console.log(error.status);
		}
	});
	
	$('#registMyMileForm select[name="projNo"]').on("change", function(){
		projNo = $('#registMyMileForm select[name="projNo"]').val();
		
		$.ajax({
			type    : "GET",
			url     : "/app/issue/getIssueListByProjNoAndUserId",
			dataType: "JSON",
			data    : {
				"projNo" : projNo,
				"userId" : userId
			},
			success : function(data){
				var issueList = "";
				for(var i = 0; i < data.length; i++){
					issueList += "<option value='" + data[i].issueNo +"'>" + data[i].title + "</option>\n";
				}
				$("#MileIssueTagFormGroup").empty();
				$("#MileIssueTagFormGroup").append('<label class="label-align mt-3">이슈 등록</label><select id="myMileIssueTag" name="myIssueList" multiple="multiple" data-placeholder="추가하실 이슈를 선택해주세요."></select>');
				$("#myMileIssueTag").empty().append(issueList);
				$("#myMileIssueTag").kendoMultiSelect({
					autoClose: false
				});
			},
			error   : function(error){
				console.log(error.status);
			}
		});
	});
}



function registMyMilestone() {
	var userId = $('#registMyMileForm select[name="userId"]').val();
	var projNo = $('#registMyMileForm select[name="projNo"]').val();
	var status = $('#registMyMileForm select[name="status"]').val();
	var title = $('#registMyMileForm input[name="title"]').val();
	var content = $('#registMyMileForm textarea[name="content"]').val();
	var issueNoList = $('#registMyMileForm select[id="myMileIssueTag"]').val();
	
	var mileVO = {
		"userId"      : userId,
		"projNo"      : projNo,
		"status"      : status,
		"title"       : title,
		"content"     : content,
		"issueNoList" : issueNoList
	}
	
	$.ajax({
		url : "/app/milestone/registMilestoneDetail",
		type : 'POST',
		data : JSON.stringify(mileVO),
		contentType:'application/json;charset=UTF-8',
		success : function(data) {
			alert("등록에 성공했습니다.");
			document.getElementById('issue-tab').click();
			myOverlayOff('#myMileOverlay');
		}, // success
		error : function(xhr, status) {
			alert("fail");
			alert(xhr + " : " + status);
		}
	});
}




















