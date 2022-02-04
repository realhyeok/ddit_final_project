<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#myTaskModifyOverlay {
				position: fixed;
				display: none;
				width: 500px;
				height: 100%;
				top: 0;
				right: 0;
				bottom: 0;
				border: 1px solid #ededed;
				background-color: white;
				z-index: 200;
			}
		</style>
	</head>
	<body>
		<!-- 오버레이 시작 -->
		<div id="myTaskModifyOverlay"></div>
		<!-- 오버레이 끝 -->
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
		<script type="text/x-handlebars-template" id="myTaskModifyFormTemplate">
			<div class="row" id="fadeInTaskModifyContent">
				<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title row d-flex justify-content-between">
								<h5 class="title">
										<i class="fa fa-clone"></i> <span class="task-bold task-sm">업무 수정</span>
								</h5>
								<div class="clearfix">
									<button onclick="myOverlayOff('#myTaskModifyOverlay')" class="btn btn-primary btn-sm">X</button>
								</div>
							</div>
							<div class="x_content">
								<div class="row">
									<!-- 내용저장 -->
									<div class="x_content row">
										<div class="col-sm-12">
											<form id="modifyMyTaskForm" method="post" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
												<!-- 프로젝트명 -->
												<div class="item form-group">
													<label class="col-form-label col-md-2 col-sm-2 label-align" for="projNo">프로젝트</label>
													<div class="col-md-10 col-sm-10">
														<input type="hidden" id="myTaskNo" class="form-control form-control-sm" name="taskNo" value="{{taskNo}}">
														<input type="hidden" id="myTaskProjNo" class="form-control form-control-sm" name="projNo" value="{{projNo}}">
														<input type="text" id="myTaskProjTitle" class="form-control form-control-sm" name="proTitle" value="{{projTitle}}" readonly>
													</div>
												</div>
												<div class="item form-group">
	          										<label class="col-form-label col-md-2 col-sm-2 label-align" for="userNickname">담당자</label>
													<div class="col-md-10 col-sm-10">
														<select class="form-control form-control-sm" id="userNickname" name="userId">
															{{#each userList}}
              													<option value="{{this.userId}}">{{this.nickname}}</option>
															{{/each}}
            											</select>
													</div>
	        									</div>
												<div class="item form-group">
	          										<label class="col-form-label col-md-2 col-sm-2 label-align" for="important">중요도</label>
													<div class="col-md-10 col-sm-10">
	            										<select class="form-control form-control-sm" id="important" name="important">
	              											<option value="B101">낮음</option>
	              											<option value="B102">보통</option>
	             											<option value="B103">높음</option>
	            										</select>
													</div>
	        									</div>
												<div class="item form-group">
			          								<label class="col-form-label col-md-2 col-sm-2 label-align" for="status">진행상태</label>
													<div class="col-md-10 col-sm-10">
			            								<select class="form-control form-control-sm" id="status" name="status">
			              									<option value="B201">예정</option>
			              									<option value="B202">진행중</option>
			             									<option value="B203">지연중</option>
			             									<option value="B204">완료</option>
			            								</select>
													</div>
			        							</div>
												<div class="item form-group">
													<label class="col-form-label col-md-2 col-sm-2 label-align" for="startdate">시작일</label>
													<div class="col-md-10 col-sm-10">
														<input type="date" id="startdate" name="startdate" class="form-control form-control-sm">
{{startdate}}
													</div>
												</div>
												<div class="item form-group">
													<label class="col-form-label col-md-2 col-sm-2 label-align" for="enddate">마감일</label>
													<div class="col-md-10 col-sm-10">
														<input type="date" id="enddate" name="enddate" class="form-control form-control-sm">
													</div>
												</div>
												<div class="item form-group">
													<label class="col-form-label col-md-2 col-sm-2 label-align" for="title">업무명</label>
													<div class="col-md-10 col-sm-10">
														<input type="text" id="title" class="form-control form-control-sm" name="title" value="{{title}}">
													</div>
												</div>
												<div class="form-group">
													<label class="col-form-label col-md-2 col-sm-2 label-align">업무내용</label>
													<div class="col-md-10 col-sm-10"></div>
													<textarea class="myTaskOverlayContentModify" name="content">{{content}}</textarea>
												</div>
												<div class="col-md-12 col-sm-12 m-1 p-1 text-right">
													<button type="button" class="btn btn-primary" onclick="modifyMyTask();">수정</button>
													<button type="button" class="btn btn-secondary" onclick="cancelMyTaskModify();">취소</button>
												</div>
											</form>
										</div>
									</div>	
								</div>
							</div>
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
			
			function myTaskModifyForm(data){
				printData(data, $('#myTaskModifyOverlay'), $('#myTaskModifyFormTemplate'));
			}
			
			function cancelMyTaskModify(){
				off('#myTaskModifyOverlay');
			}
			
			function modifyMyTask() {
				var taskVO = $('#modifyMyTaskForm').serialize();
				alert(taskVO);
				$.ajax({
					url : "<%=request.getContextPath()%>/app/task/modifyTaskDetailByTaskNo",
					type : 'POST',
					datatype : 'text',
					data : taskVO,
					success : function(data) {
						alert("수정에 성공했습니다.");
						myTaskDetail(data.taskNo, data.projNo);
						off('#myTaskModifyOverlay');
					},
					error : function(status) {
						alert("수정에 실패하였습니다.");
					}
				});
			}
		</script>
	</body>
</html>
	