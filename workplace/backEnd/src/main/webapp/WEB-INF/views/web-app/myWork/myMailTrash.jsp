<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>    

<div id="trashMail" class="row">
	<div class="col-md-4">
		<div id="trashMailList" class="mail_list_column" style="height:auto;"></div>	
	</div>
	<div class="col-md-8">
		<div id="trashMailDetail" class="mail_view border-left-0" style="height:auto;">
		</div>
	</div>
</div>

<script id="trashMailList-template" type="text/x-kendo-template">
	<div class="mail_list m-0 border-bottom-0">
		<div class="left">
			# if(userTo == "realhyuk@ddit.com"){ #
				<input class="trashCheck" type="checkbox" value="#:mailNo#" data-mailType="trashReceiveMail">
			# }else if(userFrom == "realhyuk@ddit.com"){ #
				<input class="trashCheck" type="checkbox" value="#:mailNo#" data-mailType="trashSendMail">
			# } #
			# if(docContNo){ #
				<i class="fa fa-paperclip"></i>
			# } #
		</div>
		<div class="right" style="height:40px;">
			<h3>
				# if(userTo == "realhyuk@ddit.com"){ #
					받은 메일
				# }else if(userFrom == "realhyuk@ddit.com"){ #
					보낸 메일
				# } #
				<small>#:regDate#</small>
			</h3>
			<a href="javascript:trashMailDetail(#:mailNo#);"><p>#:title#</p></a>
		</div>
	</div>
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="trash-mail-detail-template" >
	<div class="inbox-body">
		<div class="mail_heading row">
			<div class="col-md-8">
				<div class="btn-group">
					<button type="button" class="btn btn-sm btn-dark" onclick="returnTrashMailOne('{{mailNo}}', '{{userTo}}', '{{userFrom}}');"><i class="fa fa-reply"></i>&nbsp;&nbsp;복구</button>	
					<button type="button" class="btn btn-sm btn-dark btn-append" onclick="deleteTrashMailOne('{{mailNo}}', '{{userTo}}', '{{userFrom}}');"><i class="fa fa-times-circle-o"></i>&nbsp;&nbsp;삭제</button>
				</div>
			</div>
			<div class="col-md-4 text-right">
				<p class="date">{{regDate}}</p>
			</div>
			<div class="col-md-12">
				<h4> {{title}}</h4>
			</div>
		</div>
		<div class="sender-info">
			<div class="row">
				<div class="col-md-12 text-right">
					<strong>받은 사람 : {{userTo}}</strong>
					<strong>보낸 사람 : {{userFrom}}</strong>
				</div>
			</div>
		</div>
		<br>
		<div class="view-mail" style="min-height:280px;">
			{{{content}}}
		</div>
		<div class="attachment">
			{{#if attachList}}
				<p>
					<span><i class="fa fa-paperclip"></i> {{attachList.length}} attachments - </span>
					<a href="javascript:allDownload();">all downloads</a>		
				</p>
			{{/if}}
			
			<div class="row">
				{{#each attachList}}
					<a href="<%=request.getContextPath()%>/app/myWork/attachDownload?uploadPath={{uploadPath}}" class="col-md-2 row m-2 p-1 rounded bg-warning String downloadAttaches">
						<div class="col-3 p-0 text-center">
							<h2><i class="fa fa-paperclip"></i></h2>						
						</div>
						<div class="col-9 p-0">
							<div class="col-12 m-0 p-0" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
								{{fileName}}{{fileType}}
							</div>					
							<div class="col-12 m-0 p-0">
								{{docSize}} Byte			
							</div>		
						</div>
					</a>
				{{/each}}
			</div>
		</div>
	</div>
</script>

<script>
	function printData(data, target, templateObject){
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(data);
		target.html('').html(html);
	}
	
	function trashMailDetail(mailNo){
		$.ajax({
			url : "<%=request.getContextPath()%>/app/myWork/getMailDetail?mailNo=" + mailNo,
			type : "get",
			dataType : "json",
			success : function(data){
				printData(data, $('#trashMailDetail'), $('#trash-mail-detail-template'));
			},
			error : function(error){
				alert(error.status);
			}
		});
	}
	
	function trashAllCheck(){
		all = $("#trashAllCheckButton").is(":checked");
		
		if(all){
			$(".trashCheck").prop("checked", true);
		}else{
			$(".trashCheck").prop("checked", false);
		}
	}
	
	function returnTrashMailOne(mailNo, userTo, userFrom){
		var mailDist = null;
		if(userTo == "realhyuk@ddit.com"){
			mailDist = "receiveMail";
		}else if(userFrom == "realhyuk@ddit.com"){
			mailDist = "sendMail";
		}
		
		returnOneConfirm = confirm("메일을 복구하시겠습니까?");
		if(returnOneConfirm){
			$.ajax({
				url : "<%=request.getContextPath()%>/app/myWork/returnMail",
				type: "get",
				data: {
					"mailNo"  : mailNo,
					"mailDist": mailDist
				},
				success: function(data){
					alert("성공");
					$('#trashMailList').data("kendoGrid").dataSource.read();
					$('#receiveMailList').data("kendoGrid").dataSource.read();
					$('#sendMailList').data("kendoGrid").dataSource.read();
				},
				error: function(error){
					alert(error.status);
				}
			});
		}
	}
	
	function deleteTrashMailOne(mailNo, userTo, userFrom){
		var mailDist = null;
		if(userTo == "realhyuk@ddit.com"){
			mailDist = "trashReceiveMail";
		}else if(userFrom == "realhyuk@ddit.com"){
			mailDist = "trashSendMail";
		}
		
		deleteOneConfirm = confirm("휴지통의 메일은 완전히 삭제됩니다.\n삭제하시겠습니까?");
		if(deleteOneConfirm){
			$.ajax({
				url : "<%=request.getContextPath()%>/app/myWork/deleteMail",
				type: "get",
				data: {
					"mailNo"  : mailNo,
					"mailDist": mailDist
				},
				success: function(data){
					alert("성공");
					$('#trashMailList').data("kendoGrid").dataSource.read();
					$('#receiveMailList').data("kendoGrid").dataSource.read();
					$('#sendMailList').data("kendoGrid").dataSource.read();
				},
				error: function(error){
					alert(error.status);
				}
			});
		}
	}
	
	function deleteTrashMailAll(){
		var mailNo = "";
		var mailDist = "";
		
		$(".trashCheck:checked").each(function(){
			mailNo += $(this).val() + ",";
			
		});
		
		alert(mailNo);
		
		var deleteAllConfirm = confirm("휴지통의 메일은 완전히 삭제됩니다.\n삭제하시겠습니까?");
		if(deleteAllConfirm){
			
			$.ajax({
				url : "<%=request.getContextPath()%>/app/myWork/deleteMailAll",
				type: "get",
				data: {
					"mailNo"  : mailNo,
					"mailDist": "trashMail"
				},
				success: function(data){
					alert("성공");
					$('#trashMailList').data("kendoGrid").dataSource.read();
					$('#receiveMailList').data("kendoGrid").dataSource.read();
					$('#sendMailList').data("kendoGrid").dataSource.read();
				},
				error: function(error){
					alert(error.status);
				}
			});
		}
	}
	
	function allDownload(){
		var attachFileCount = $('.downloadAttaches').length;
		for(var i = 0; i < attachFileCount; i++){
			$('.downloadAttaches').get(i).click();
		}
	}
</script>