<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#myTaskOverlay {
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
		<div id="myTaskOverlay">
			<div class="row" id="fadeInTaskContent">
				<div class="col-md-12">
					<div class="x_panel">
						<div class="x_title row d-flex justify-content-between">
							<h5 class="title">
									<i class="fa fa-clone"></i> <span class="task-bold task-sm">업무 등록</span>
							</h5>
							<div class="clearfix">
								<button onclick="myOverlayOff('#myTaskOverlay')" class="btn btn-primary btn-sm">X</button>
							</div>
						</div>
						<div class="x_content">
							<div class="row">
								<!-- 내용저장 -->
								<div class="x_content row">
									<div class="col-sm-12">
										<form id="registMyTaskForm" method="post" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
											<!-- 프로젝트명 -->
											<div class="item form-group">
												<label class="col-form-label col-md-2 col-sm-2 label-align" for="projNo">프로젝트</label>
												<div class="col-md-10 col-sm-10">
													<select class="form-control form-control-sm" id="projTitle" name="projNo"></select>
												</div>
											</div>
											<div class="item form-group">
          										<label class="col-form-label col-md-2 col-sm-2 label-align" for="userNickname">담당자</label>
												<div class="col-md-10 col-sm-10">
													<input type="text" id="taskUserId" class="form-control form-control-sm" name="userId" value="" readonly>
	           										<!-- <select class="form-control form-control-sm" id="taskUserId" name="userId"></select> -->
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
													<input type="text" id="title" class="form-control form-control-sm" name="title">
												</div>
											</div>
											<div class="form-group">
												<label class="col-form-label col-md-2 col-sm-2 label-align">업무내용</label>
												<div class="col-md-10 col-sm-10"></div>
												<textarea class="taskOverlayContent" name="content"></textarea>
											</div>
											<div class="col-md-12 col-sm-12 m-1 p-1 text-right">
												<button type="button" class="btn btn-primary" onclick="registMyTask();">등록</button>
												<button type="button" class="btn btn-secondary" onclick="cancelMyTask();">취소</button>
											</div>
										</form>
									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 오버레이 끝 -->
		
		<script>
			window.addEventListener('load', function() {
				var sessionId = $("#sessionId").val();
				var selectedProjNo = null;
				$("#taskUserId").val(sessionId);
				
				$.ajax({
					url : "<%=request.getContextPath()%>/app/myWork/getProjectNameForSort",
					type : 'POST',
					datatype : 'text',
					data : {"userId" : sessionId},
					async : false,
					success : function(data) {
						$('#projTitle').empty();

						for(var i = 0; i < data.length; i++){
							var option = "<option value='" + data[i].projNo + "'>" + data[i].projTitle + "</option>";
							
							$('#projTitle').append(option);
							
							$("#projTitle option:eq(0)").prop("selected", true);
							
							selectedProjNo = $("#projTitle option:selected").val();
						}
					},
					error : function(error) {
						alert(error.status);
					}
				});
				
				<%-- $.ajax({
					url : "<%=request.getContextPath()%>/app/task/getTaskRegistInfoByProjNo",
					type : 'POST',
					datatype : 'text',
					data : {"projNo" : selectedProjNo},
					async : false,
					success : function(data) {
						$('#taskUserId').empty();
						var userList = data.userList;
						
						for(var i = 0; i < userList.length; i++){
							var option = "<option value='" + userList[i].userId + "'>" + userList[i].nickname + "</option>";
							
							$('#taskUserId').append(option);
							
							$("#taskUserId option:eq(0)").prop("selected", true);
						}
					},
					error : function(error) {
						alert(error.status);
					}
				}); --%>
			});
			
			function cancelMyTask(){
				myOverlayOff('#myTaskOverlay');
			}
			
			function registMyTask() {
				var taskVO = $('#registMyTaskForm').serialize();
				var selectedProjTitle = $("#projTitle option:selected").text();
				
				taskVO += "&projTitle=" + selectedProjTitle;
				
				$.ajax({
					url : "<%=request.getContextPath()%>/app/task/registTask",
					type : 'POST',
					datatype : 'text',
					data : taskVO,
					success : function(data) {
						alert("등록에 성공했습니다.");
						
						myOverlayOff('#myTaskOverlay');
						
						location.reload();
					},
					error : function(status) {
						alert("등록에 실패하였습니다.");
					}
				});
			}
		</script>
	</body>
</html>
	