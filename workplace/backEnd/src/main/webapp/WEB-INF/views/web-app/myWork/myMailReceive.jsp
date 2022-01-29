<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>    

<div id="receiveMail" class="row">
	<div class="col-md-4">
		<div id="receiveMailList" class="mail_list_column" style="height:auto;"></div>	
	</div>
	<div class="col-md-8">
		<div id="receiveMailDetail" class="mail_view border-left-0" style="height:auto;">
		</div>
	</div>
</div>

<script id="receiveMailList-template" type="text/x-kendo-template">
	<div class="mail_list m-0 border-bottom-0">
		<div class="left">
			<input class="receiveCheck" type="checkbox" value="#:mailNo#">
			# if(attachList.length != 0){ #
				<i class="fa fa-paperclip"></i>
			# } #
		</div>
		<div class="right" style="height:40px;">
			<h3>#:userFrom#<small>#:regDate#</small></h3>
			<a href="javascript:receiveMailDetail(#:mailNo#);"><p>#:title#</p></a>
		</div>
	</div>
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="receive-mail-detail-template" >
	<div class="inbox-body">
		<div class="mail_heading row">
			<div class="col-md-8">
				<div class="btn-group">
					<button type="button" class="btn btn-sm btn-dark" onclick="getOverlayMailRegistTemplate('{{userFrom}}');"><i class="fa fa-reply"></i>&nbsp;&nbsp;답장</button>
					<button type="button" class="btn btn-sm btn-dark btn-append" onclick="deleteReceiveMailOne({{mailNo}});"><i class="fa fa-times-circle-o"></i>&nbsp;&nbsp;삭제</button>	
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
					<a href="javascript:allReceiveAttachDownload();">all downloads</a>		
				</p>
			{{/if}}
			
			<div class="row">
				{{#each attachList}}
					<a href="<%=request.getContextPath()%>/app/myWork/attachDownload?attachNo={{attachNo}}" class="col-md-2 row m-2 p-1 rounded bg-warning String downloadReceiveAttaches">
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
	
	function receiveMailDetail(mailNo){
		$.ajax({
			url : "<%=request.getContextPath()%>/app/myWork/getReceiveMailDetail?mailNo=" + mailNo,
			type : "get",
			dataType : "json",
			success : function(data){
				printData(data, $('#receiveMailDetail'), $('#receive-mail-detail-template'));
			},
			error : function(error){
				alert(error.status);
			}
		});
	}
	
	function receiveAllCheck(){
		all = $("#receiveAllCheckButton").is(":checked");
		
		if(all){
			$(".receiveCheck").prop("checked", true);
		}else{
			$(".receiveCheck").prop("checked", false);
		}
	}
	
	function deleteReceiveMailOne(mailNo){
		deleteOneConfirm = confirm("삭제하시겠습니까?");
		
		if(deleteOneConfirm){
			$.ajax({
				url : "<%=request.getContextPath()%>/app/myWork/deleteMailToTrash",
				type: "get",
				data: {
					"mailNo"   : mailNo,
					"mailDist" : "receiveMail"
				},
				success: function(data){
					alert("성공");
					$('#receiveMailList').data("kendoGrid").dataSource.read();
					$('#trashMailList').data("kendoGrid").dataSource.read();
				},
				error: function(error){
					alert(error.status);
				}
			});
		}
	}
	
	function deleteReceiveMailAll(){
		deleteAllConfirm = confirm("삭제하시겠습니까?");
		var mailNo = "";
		if(deleteAllConfirm){
			$(".receiveCheck:checked").each(function(){
				mailNo += $(this).val() + ",";
			});
			
			$.ajax({
				url : "<%=request.getContextPath()%>/app/myWork/deleteMailToTrashAll",
				type: "get",
				data: {
					"mailNo" : mailNo,
					"mailDist" : "receiveMail"	
				},
				success: function(data){
					$("#receiveAllCheckButton").prop("checked", false);
					alert("성공");
		
					$('#receiveMailList').data("kendoGrid").dataSource.read();
					$('#trashMailList').data("kendoGrid").dataSource.read();
				},
				error: function(error){
					alert(error.status);
				}
			});
		}
	}
	
	function allReceiveAttachDownload(){
		var attachFileCount = $('.downloadReceiveAttaches').length;
		for(var i = 0; i < attachFileCount; i++){
			$('.downloadReceiveAttaches').get(i).click();
		}
	}
</script>