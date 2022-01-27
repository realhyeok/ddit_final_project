<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<div class="row">
	<div class="col-sm-12 mail_view border-left-0">
		<div class="col-sm-12">
			<div class="col-md-12 col-sm-12" style="text-align:right;">
				<button type="button" class="btn btn-sm btn-dark">임시저장</button>
				<button id="mailSendButton" type="button" class="btn btn-sm btn-primary" onclick="mailRegist_go();return false;">전송</button>
				<button type="button" class="btn btn-sm btn-secondary" onclick="history.go(-1);">취소</button>
			</div>
		</div>
		<div class="col-sm-12">
			<!-- 메일 작성 시작 -->
			<form enctype="multipart/form-data" role="form" method="post" action="myWork/mailRegist" name="mailRegistForm" class="form-horizontal form-label-left">
				<div class="inbox-body">
					<input type="hidden" id="userFrom" name="userFrom" value="realhyuk@ddit.com">
					<input type="text" id="userTo" name="userTo" class="form-control form-control-sm mt-3" placeholder="받는 사람:">
					<br>
					<input type="text" id="title" name="title" class="form-control form-control-sm" placeholder="제목:">
					<br>
					<textarea id="content" name="content" rows="10" class="form-control" placeholder="내용을 입력하세요." style="display:none;"></textarea>
					<br>
				</div>
				<div class="card">
					<div class="card-header" style="background:#f7f7f7;border-bottom:none;">
						<button class="btn btn-sm btn-primary" onclick="addFile_go();" type="button" id="addFileBtn">파일첨부</button>
					</div>
					<div class="card-body fileInput"></div>
					<div class="card-footer"></div>
				</div>
			</form>		
			<!-- 메일 작성 끝 -->
		</div>
	</div>
</div>

<script>
	window.onload = function(){
		$('.fileInput').on('change', 'input[type="file"]', function(event){
			if(this.files[0].size > 1024 * 1024 * 40){
				alert("파일 용량은 40MB 이하만 가능합니다.");
				this.value="";
				$(this).click();
				return;
			}
		});
	}	

	var dataNum = 0;

	function addFile_go(){
		if($('input[name="attachFile"]').length >= 5){
			alert("파일 추가는 5개 까지만 가능합니다.");
			return;
		}
	
		var div = $('<div>').addClass("inputRow").attr("data-no", dataNum);
		var input = $('<input>').attr({"type":"file", "name":"attachFile"}).css("display", "inline");
		
		div.append(input).append("<button type='button' class='badge bg-red' onclick='remove_go(" + dataNum + ")' style='border:0;outline:0;'>X</button>");
		$('.fileInput').append(div);
		
		dataNum++;
	}

	function remove_go(dataNum){
		$('div[data-no="' + dataNum + '"]').remove();
	}

	function mailRegist_go(){
		var files = $('input[name="attachFile"]');
		for(var file of files){
			console.log(file.name + " : " + file.value);
			if(file.value == ""){
				alert("파일을 선택해주세요.");
				file.focus();
				file.click();
				return;
			}
		}
	
		if($("input[name='title']").val() == ""){
			alert("제목을 입력해주세요.");
			$("input[name='title']").focus();
			return;
		}
		if($("input[name='userTo']").val() == ""){
			alert("수신자 메일을 입력해주세요.");
			$("input[name='userTo']").focus();
			return;
		}
		if($("textarea[name='content']").val() == ""){
			alert("내용을 입력해주세요.");
			$("textarea[name='content']").focus();
			return;
		}
		document.mailRegistForm.submit();
	}
</script>
