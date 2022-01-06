<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<title>내 업무</title>

<head></head>

<body>
<!-- page content -->
<div class="right_col" role="main">
	<!-- 프로젝트 바디 시작 -->
	<div class="x_panel">
		<div class="x_title">
			<h2>
				<i class="fa fa-desktop"></i> 프로젝트 상세 <small>* 커스터 마이징 해주세요.</small>
			</h2>
			<div class="clearfix"></div>
		</div>

		<div class="x_content">
			<ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					id="dash-board-tab" data-toggle="tab" href="#dash-board" role="tab"
					aria-controls="dash-board" aria-selected="true">대시보드</a>
				</li>
				<li class="nav-item"><a class="nav-link" id="project-list-tab"
					data-toggle="tab" href="#project-outline" role="tab"
					aria-controls="project-outline" aria-selected="false">프로젝트
						개요</a></li>
				<li class="nav-item"><a class="nav-link" id="project-task-tab"
					data-toggle="tab" href="#project-task" role="tab"
					aria-controls="project-task" aria-selected="false">업무</a>
				</li>
				<li class="nav-item"><a class="nav-link" id="gantt-tab"
					data-toggle="tab" href="#gantt" role="tab" aria-controls="gantt"
					aria-selected="false">간트차트</a></li>
				<li class="nav-item"><a class="nav-link" id="issue-tab"
					data-toggle="tab" href="#issue" role="tab" aria-controls="issue"
					aria-selected="false">이슈</a></li>
				<li class="nav-item"><a class="nav-link" id="history-tab"
					data-toggle="tab" href="#history" role="tab"
					aria-controls="history" aria-selected="false">히스토리</a>
				</li>
				<li class="nav-item"><a class="nav-link" id="document-tab"
					data-toggle="tab" href="#document" role="tab"
					aria-controls="document" aria-selected="false">문서관리</a>
				</li>
				<!-- 여기서부터 지울것 여기에요 -->
				<li class="nav-item"><a class="nav-link"
					id="project-member-list-tab" data-toggle="tab"
					href="#project-member-list" role="tab"
					aria-controls="project-member-list" aria-selected="false">멤버리스트</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					id="project-task-detail-tab" data-toggle="tab"
					href="#project-task-detail" role="tab"
					aria-controls="project-task-detail" aria-selected="false">업무상세</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					id="project-regist-tab" data-toggle="tab" href="#project-regist"
					role="tab" aria-controls="project-regist" aria-selected="false">프로젝트
						등록</a></li>
				<!-- 여기지워 -->
			</ul>

			<div class="tab-content" id="myTabContent">
				<!-- 프로젝트 대시보드 예시입니다. 시작 -->
				<div class="tab-pane fade show active" id="dash-board"
					role="tabpanel" aria-labelledby="dash-board-tab">
					
					<%@ include file="/WEB-INF/views/web-app/project/project-dashboard.jsp" %>
					
				</div>
				<!-- 프로젝트 대시보드 예시입니다. 끝 -->

				<!-- 프로젝트 개요 예시입니다. 시작-->
				<div class="tab-pane fade" id="project-outline" role="tabpanel"
					aria-labelledby="project-outline">
					<%@ include file="/WEB-INF/views/web-app/project/project-detail.jsp" %>
				</div>
				<!-- 프로젝트 개요 예시입니다. 끝 -->

				<div class="tab-pane fade" id="project-task" role="tabpanel"
					aria-labelledby="project-task-tab">
					<%@ include file="/WEB-INF/views/web-app/project/project-task.jsp" %>
				</div>

				<!-- 간트 차트 예시입니다. 시작 -->
				<div class="tab-pane fade" id="gantt" role="tabpanel"
					aria-labelledby="gantt-tab">
					<%@ include file="/WEB-INF/views/web-app/project/project-gantt.jsp" %>
				</div>
				<!-- 간트 차트 예시입니다. 끝 -->

				<div class="tab-pane fade" id="issue" role="tabpanel"
					aria-labelledby="issue-tab">
					<%@ include file="/WEB-INF/views/web-app/project/project-issue.jsp" %>
				</div>

				<!-- include project_history.html start -->
				<div class="tab-pane fade" id="history" role="tabpanel"
					aria-labelledby="history-tab">
					<%@ include file="/WEB-INF/views/web-app/project/project-history.jsp" %>
				</div>
				<!-- include project_history.html end -->

				<!-- for make member-list 나중에 지울것 -->
				<div class="tab-pane fade" id="project-member-list" role="tabpanel"
					aria-labelledby="project-member-list-tab">
					<%@ include file="/WEB-INF/views/web-app/project/project-member-list.jsp" %>
				</div>
				<!-- for make member-list 나중에 지울것 -->

				<!-- 프로젝트 등록 나중에 지울것 -->
				<div class="tab-pane fade" id="project-regist" role="tabpanel"
					aria-labelledby="project-regist-tab">
					<%@ include file="/WEB-INF/views/web-app/project/project-regist.jsp" %>
				</div>
				<!-- 프로젝트 등록 나중에 지울것 -->
				<div class="tab-pane fade" id="project-task-detail" role="tabpanel"
					aria-labelledby="project-task-detail-tab">
					<%@ include file="/WEB-INF/views/web-app/project/project-task-detail.jsp" %>
				</div>
			</div>
		</div>
	</div>
	<!-- 프로젝트 바디 끝 -->
</div>
<!-- /page content -->
</body>
