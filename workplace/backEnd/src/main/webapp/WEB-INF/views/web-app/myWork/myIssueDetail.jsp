<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>    

<div id="myIssueDetailFormTarget"></div>

<script id="myIssueDetailForm" type="text/x-handlebars-template">
    <!-- 제목 시작 -->
	<div class="x_title">
		<h2><i class="glyphicon glyphicon-exclamation-sign"></i>&nbsp;&nbsp;&nbsp;이슈 - 상세</h2>
		<div class="clearfix">
			<button type="button" class="btn btn-sm btn-secondary float-right" onclick="document.getElementById('issue-tab').click();">목록</button>
			<button type="button" class="btn btn-sm btn-primary float-right" onclick="getOverlayIssueModifyTemplate('issueModifyFormTemplate','/app/issue/getIssueByIssueNo','{{issueVO.issueNo}}')">수정</button>
			<button type="button" class="btn btn-sm btn-danger float-right">삭제</button>
		</div>
	</div>
	<!-- 제목 끝 -->
	<!-- 이슈 디테일 시작 -->
	<div class="form-group row">
		<div class="col-sm-6">
			<label>제목 :</label>
			<input type="hidden" id="issueNo" value="{{issueVO.issueNo}}">
			<div class="form-control form-control-sm form-control-view">{{issueVO.title}}</div>
		</div>
		<div class="col-sm-6">
			<label>프로젝트명 :</label>
			<div class="form-control form-control-sm form-control-view">{{projTitle}}</div>
			<input type="hidden" id="myIssueDetailProjNo" value="{{issueVO.projNo}}">
		</div>
	</div>

	<div class="form-group row">
		<div class="col-sm-6">
			<label>담당자</label>
			<input type="text" class="form-control form-control-sm form-control-view" value="{{issueVO.nickname}}">
		</div>
		<div class="col-sm-6">
			<label class="control-label">중요도</label>
			<div class="form-control form-control-sm form-control-view">{{issueVO.important}}</div>
		</div>
	</div>

	<div class="form-group row">
		<div class="col-sm-6">
			<label>발생일자 :</label>
			<div class="form-control form-control-sm form-control-view">{{formatTime issueVO.startdate "YYYY년 MM월 DD일"}}</div>
		</div>
		<div class="col-sm-6">
			<label>마감일자 :</label>
			<div class="form-control form-control-sm form-control-view">{{formatTime issueVO.enddate "YYYY년 MM월 DD일"}}</div>
		</div>
	</div>

	<div class="form-group row">
		<div class="col-sm-12">
			<label>이슈 내용 :</label>
			<div class="form-control form-control-sm form-control-view" style="height:120px;">{{{issueVO.content}}}</div>
		</div>
	</div>


	<div class="form-group row">
		<div class="col-sm-12">
			<label>첨부파일 :</label>
			<div class="form-control form-control-sm form-control-view" style="height:120px;">
				<li>
					<i class="glyphicon glyphicon-floppy-disk"></i>
					<span>업무파일.jpg</span>
				</li>
				<li>
					<i class="glyphicon glyphicon-floppy-disk"></i>
					<span>jabra.html</span>
				</li>
			</div>
		</div>
	</div>
	<!-- 이슈 디테일 끝 -->
</script>

<!-- 이슈 디테일 댓글 시작 -->
<div class="form-group row">
	<div class="col-sm-12">
		<div class="card mb-2">
			<div class="card-header bg-light">
				<div class="input-group" style="margin:0px;">
					<input type="text" name="content" id="myIssueReplyRegistContent" class="form-control input-group" style="margin:0px;" placeholder="댓글을 입력하세요.">
					<button type="button" class="btn btn-dark input-group-append" onclick="myIssueReplyRegist('${userVO.userId}');" style="margin-right:0px;">작성</button>
				</div>
			</div>
			<div class="card-body">
				<div id="myIssueReplyFormTarget"></div>
			</div>
			<div class="card-footer bt-light"></div>
		</div>
	</div>
</div>
<!-- 댓글 작성폼 끝 -->
    
<script type="text/x-handlebars-template" id="myIssueReplyForm">
	{{#each .}}
	<div class="block bg-light d-flex">
		<div class="block_content" style="width:100%">
			<div class="col-sm-2 pt-2">
				<img src="<%=request.getContextPath()%>/user/getPictureById?userId={{userId}}" alt="img" style="height:31px;width:31px;border-radius:100%;"/>
				<span>{{userVO.nickname}}</span>
			</div>
			<div class="col-sm-7">
				<p class="excerpt mt-3" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">{{content}}</p>
			</div>
			<div class="col-sm-3">
				<p class="mt-3" style="display:inline-block;">{{formatTime updatedate "YYYY년 MM월 DD일"}}</p>
				{{#ifCond userId "==" "${userVO.userId}"}}
				<button type="button" class="btn btn-sm btn-danger float-right" style="margin-top:9px;" onclick="myIssueReplyRemove('{{issueResNo}}');">삭제</button>
				<button type="button" class="btn btn-sm btn-primary float-right" style="margin-top:9px;" data-toggle="modal" data-target=".myIssueReplyModifyModal" onclick="myIssueReplyModifyForm_go('{{issueResNo}}', '{{content}}');">수정</button>
				{{/ifCond}}
			</div>
		</div>
	</div>
	{{/each}}
</script>
	
<!-- 댓글 수정폼 시작 -->
<div class="myIssueReplyModifyModal modal fade modify-modal-lg" tabindex="-1" role="dialog" aria-modal="true" style="display:none;" >
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">댓글 수정</h4>
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
			</div>
			<div class="modal-body">
				<input type="text" name="content" id="myIssueReplyModifyContent" class="form-control input-group" style="margin:0px;" placeholder="댓글을 입력하세요.">
				<input type="hidden" name="issueResNo" id="myIssueReplyModifyIssueResNo">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-primary" onclick="myIssueReplyModify();">저장</button>
				<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 댓글 수정폼 끝 -->

<script>
	Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {
	    switch (operator) {
	        case '==':
	            return (v1 == v2) ? options.fn(this) : options.inverse(this);
	        case '===':
	            return (v1 === v2) ? options.fn(this) : options.inverse(this);
	        case '!=':
	            return (v1 != v2) ? options.fn(this) : options.inverse(this);
	        case '!==':
	            return (v1 !== v2) ? options.fn(this) : options.inverse(this);
	        case '<':
	            return (v1 < v2) ? options.fn(this) : options.inverse(this);
	        case '<=':
	            return (v1 <= v2) ? options.fn(this) : options.inverse(this);
	        case '>':
	            return (v1 > v2) ? options.fn(this) : options.inverse(this);
	        case '>=':
	            return (v1 >= v2) ? options.fn(this) : options.inverse(this);
	        case '&&':
	            return (v1 && v2) ? options.fn(this) : options.inverse(this);
	        case '||':
	            return (v1 || v2) ? options.fn(this) : options.inverse(this);
	        default:
	            return options.inverse(this);
	    }
	});

	function xssPurify(html) {
	    const extractTextPattern = /(<([^>]+)>)/gi;
	    var newhtml = html.replace(extractTextPattern, "");
	    return newhtml;
	}
	
	function printData(data, target, templateObject){
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(data);
		target.html('').html(html);
	}
	
	function myIssueReplyModifyForm_go(issueResNo, content){
		$("#myIssueReplyModifyContent").val(content);
		$("#myIssueReplyModifyIssueResNo").val(issueResNo);		
	}
	
	function myIssueReplyModify(){
		var issueResNo = $("#myIssueReplyModifyIssueResNo").val();
		var content = $("#myIssueReplyModifyContent").val();
		var issueNo = $("#issueNo").val();
		var projNo = $("#myIssueDetailProjNo").val();
		var issueReplyVO = {
				"issueResNo" : issueResNo,	
				"content"    : content
			}
		
		var myIssueReplyModifyConfirm = confirm("수정하시겠습니까?");
		
		if(myIssueReplyModifyConfirm){
			$.ajax({
				type   : "POST",
				url    : "<%=request.getContextPath()%>/app/issueReply/modifyIssueReply",
				data   : issueReplyVO,
				success: function(data){
					if(data == "success"){
						alert("수정 완료");
						myIssueDetail(issueNo, projNo);
					}
				},
				error  : function(error){
					console.log("댓글 수정 실패 " + error.status + " 에러");
				}
			});
		}
	}
	
	function myIssueReplyRemove(issueResNo){
		var issueNo = $("#issueNo").val();
		var projNo = $("#myIssueDetailProjNo").val();
		
		var myIssueReplyRemoveConfirm = confirm("삭제하시겠습니까?");
		
		if(myIssueReplyRemoveConfirm){
			$.ajax({
				type   : "POST",
				url    : "<%=request.getContextPath()%>/app/issueReply/removeIssueReply",
				data   : { "issueResNo" : issueResNo },
				success: function(data){
					if(data == "success"){
						alert("삭제 완료");
						myIssueDetail(issueNo, projNo);
					}
				},
				error  : function(error){
					console.log("댓글 삭제 실패 " + error.status + " 에러");
				}
			});
		}
	}
	
	function myIssueReplyRegist(uid){
		var issueNo = $("#issueNo").val();
		var content = $("#myIssueReplyRegistContent").val();
		var userId = uid;
		var projNo = $("#myIssueDetailProjNo").val();
		var issueReplyVO = {
			"issueNo" : issueNo,	
			"content" : content,	
			"userId" : userId,	
			"projNo" : projNo
		}
		
		if(!content){
			alert("댓글을 입력해주세요.");
			return;
		}
		
		$.ajax({
			type   : "POST",
			url    : "<%=request.getContextPath()%>/app/issueReply/registIssueReply",
			data   : issueReplyVO,
			success: function(data){
				if(data == "success"){
					alert("등록 완료");
					myIssueDetail(issueNo, projNo);
				}
			},
			error  : function(error){
				console.log("댓글 등록 실패 " + error.status + " 에러");
			}
		});
	}
</script>