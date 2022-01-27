<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>    

<div id="tempMail" class="row">
	<div class="col-md-4">
		<div id="tempMailList" class="mail_list_column" style="height:auto;"></div>	
	</div>
	<div class="col-md-8">
		<div id="tempMailDetail" class="mail_view border-left-0" style="height:auto;">
		</div>
	</div>
</div>

<script id="tempMailList-template" type="text/x-kendo-template">
	<div class="mail_list m-0 border-bottom-0">
		<div class="left">
			<input class="tempCheck" type="checkbox" value="#:mailNo#">
			# if(attachList){ #
				<i class="fa fa-paperclip"></i>
			# } #
		</div>
		<div class="right" style="height:40px;">
			<h3>#:userTo#<small>#:regDate#</small></h3>
			<a href="javascript:tempMailDetail(#:mailNo#);"><p>#:title#</p></a>
		</div>
	</div>
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="temp-mail-detail-template" >
	<div class="inbox-body">
		<div class="mail_heading row">
			<div class="col-md-8">
				<div class="btn-group">
					<button type="button" class="btn btn-sm btn-dark"><i class="fa fa-reply"></i>&nbsp;&nbsp;전송</button>	
					<button type="button" class="btn btn-sm btn-dark btn-append" onclick="deleteTempMailOne({{mailNo}});"><i class="fa fa-times-circle-o"></i>&nbsp;&nbsp;삭제</button>
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
					<strong>{{userTo}}</strong>
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
					<a href="javascript:allTempAttachDownload();">all downloads</a>		
				</p>
			{{/if}}
			
			<div class="row">
				{{#each attachList}}
					<a href="<%=request.getContextPath()%>/app/myWork/attachDownload?filePath={{filePath}}/{{fileName}}" class="col-md-2 row m-2 p-1 rounded bg-warning String downloadTempAttaches">
						<div class="col-3 p-0 text-center text-dark font-weight-bold">
							<h2><i class="fa fa-paperclip"></i></h2>						
						</div>
						<div class="col-9 p-0">
							<div class="col-12 m-0 p-0 text-dark" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
								{{fileName}}
							</div>					
							<div class="col-12 m-0 p-0 text-dark">
								{{fileSize}} Byte			
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
	
	function tempMailDetail(mailNo){
		$.ajax({
			url : "<%=request.getContextPath()%>/app/myWork/getMailDetail?mailNo=" + mailNo,
			type : "get",
			dataType : "json",
			success : function(data){
				printData(data, $('#tempMailDetail'), $('#temp-mail-detail-template'));
			},
			error : function(error){
				alert(error.status);
			}
		});
	}
	
	function tempAllCheck(){
		all = $("#tempAllCheckButton").is(":checked");
		
		if(all){
			$(".tempCheck").prop("checked", true);
		}else{
			$(".tempCheck").prop("checked", false);
		}
	}
	
	function deleteTempMailOne(mailNo){
		deleteOneConfirm = confirm("임시저장된 메일은 완전히 삭제됩니다.\n삭제하시겠습니까?");
		
		if(deleteOneConfirm){
			$.ajax({
				url : "<%=request.getContextPath()%>/app/myWork/deleteMail",
				type: "get",
				data: {
					"mailNo"  : mailNo,
					"mailDist": "tempMail"
				},
				success: function(data){
					alert("성공");
					$('#tempMailList').data("kendoGrid").dataSource.read();
					$('#receiveMailList').data("kendoGrid").dataSource.read();
					$('#sendMailList').data("kendoGrid").dataSource.read();
				},
				error: function(error){
					alert(error.status);
				}
			});
		}
	}
	
	function deleteTempMailAll(){
		deleteAllConfirm = confirm("임시저장된 메일은 완전히 삭제됩니다.\n삭제하시겠습니까?");
		var mailNo = "";
		if(deleteAllConfirm){
			$(".tempCheck:checked").each(function(){
				mailNo += $(this).val() + ",";
			});
			
			$.ajax({
				url : "<%=request.getContextPath()%>/app/myWork/deleteMailAll",
				type: "get",
				data: {
					"mailNo"  : mailNo,
					"mailDist": "tempMail"
				},
				success: function(data){
					alert("성공");
					$('#tempMailList').data("kendoGrid").dataSource.read();
					$('#receiveMailList').data("kendoGrid").dataSource.read();
					$('#sendMailList').data("kendoGrid").dataSource.read();
				},
				error: function(error){
					alert(error.status);
				}
			});
		}
	}
	
	function allTempAttachDownload(){
		var attachFileCount = $('.downloadTempAttaches').length;
		for(var i = 0; i < attachFileCount; i++){
			$('.downloadTempAttaches').get(i).click();
		}
	}
</script>