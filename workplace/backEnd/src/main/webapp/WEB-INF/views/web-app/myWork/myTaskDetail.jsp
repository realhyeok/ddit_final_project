<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<div id="myTaskDetailFormTarget"></div>

<script id="myTaskDetailForm" type="text/x-handlebars-template">
      	<div class="x_title">
			<h2><i class="glyphicon glyphicon-exclamation-sign"></i>&nbsp;&nbsp;&nbsp;업무 상세</h2>
			<div class="clearfix">
				<button type="button" class="btn btn-sm btn-secondary float-right" onclick="returnMyTaskList();">목록</button>
				<button type="button" class="btn btn-sm btn-primary float-right" onclick="getOverlayTaskModifyTemplate('{{taskNo}}', '{{projNo}}')">수정</button>
				<button type="button" class="btn btn-sm btn-danger float-right" onclick="deleteMyTaskByTaskNo('{{taskNo}}')">삭제</button>
			</div>
		</div>

		<div class="form-group row">
			<div class="col-sm-6">
				<label>제목 :</label>
				<div class="form-control form-control-sm form-control-view">{{title}}</div>
			</div>
			<div class="col-sm-6">
				<label>프로젝트명 :</label>
				<div class="form-control form-control-sm form-control-view">{{projTitle}}</div>
			</div>
		</div>

		<div class="form-group row">
			<div class="col-sm-6">
				<label>담당자</label>
					<input type="text" class="form-control form-control-sm form-control-view"
					value="{{userId}}">
			</div>
			<div class="col-sm-6">
				<label class="control-label">중요도</label>
				<div class="form-control form-control-sm form-control-view">{{important}}</div>
			</div>
		</div>

		<div class="form-group row">
			<div class="col-sm-6">
				<label>시작일 :</label> <input type="text" class="form-control form-control-sm form-control-view"
					value="{{formatTime startdate "YYYY년 MM월 DD일"}}">
			</div>
			<div class="col-sm-6">
				<label>마감일 :</label> <input type="text" class="form-control form-control-sm form-control-view"
					value="{{formatTime enddate "YYYY년 MM월 DD일"}}">
			</div>
		</div>

		<div class="form-group row">
			<div class="col-sm-12">
				<label>업무 내용 :</label>
				<div class="form-control form-control-sm form-control-view" style="height: 120px;">
					{{{content}}}
				</div>
			</div>
		</div>

		<div class="form-group row">
			<div class="col-sm-12">
				<label>첨부파일 :</label>
				<div class="form-control form-control-sm form-control-view" style="height: 150px;">
					<ul class="row list-unstyled task-files">
					{{#ifCond fileList.length "!=" 0}}
						{{#each fileList}}
							<li class="d-flex align-items-center">
								<div class="btn files-btn d-flex flex-wrap flex-column align-items-center justify-content-center"  style="width:200px;height:140px">
									<a style="cursor:pointer;" onclick="taskDocumentDownload('{{{name}}}{{{extension}}}','{{{../title}}}','{{{../projTitle}}}');"><i class="fa fa-file-text fa-5x text-dark"></i></a>
									<div class="mt-2 d-flex"><span class="text-truncate" style="display:inline-block;max-width:70px;">{{{name}}}</span><span>{{{extension}}}</span></div>
								</div>
							</li>
						{{/each}}
					{{/ifCond}}
					{{#ifCond fileList.length "==" 0}}
						<div class="m-3">
							<span>첨부파일이 없습니다.</span>
						<div>
					{{/ifCond}}
					</ul>
				</div>
			</div>
		</div>
	</script>
	
	<script>
		window.addEventListener('load', function() {
			Handlebars.registerHelper('formatTime', function (date, format) {
			    var mmnt = moment(date);
			    return mmnt.format(format);
			});
		});
		function deleteMyTaskByTaskNo(taskNo){
			var myTaskDeleteConfirm = confirm("삭제하시겠습니까?");
			
			if(myTaskDeleteConfirm){
				location.href="<%=request.getContextPath()%>/app/myWork/deleteMyTaskByTaskNo?taskNo=" + taskNo;
			}
		}
		
		function returnMyTaskList(){
			document.getElementById('task-tab').click();
		}
	</script>