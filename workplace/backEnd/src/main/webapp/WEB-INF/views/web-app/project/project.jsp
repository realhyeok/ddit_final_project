<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<!-- page content -->
<div class="right_col" role="main">
  <!-- 내 작업 바디 시작 -->
  <div class="x_panel">
    <div class="x_title">
      <h2><i class="fa fa-edit"></i>프로젝트</h2>
      <div class="clearfix"></div>
    </div>

    <div class="x_content">
      <ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">대시보드</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="detail-tab" data-toggle="tab" href="#detail" role="tab" aria-controls="detail" aria-selected="false">프로젝트 상세</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="task-tab" data-toggle="tab" href="#task" role="tab" aria-controls="task" aria-selected="false" onclick="setTimeout(readTask, 300);">업무</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="gantt-tab" data-toggle="tab" href="#ganttchart" role="tab" aria-controls="ganttchart" aria-selected="false" onclick="setTimeout(projGantt, 300);">간트차트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="issue-tab" data-toggle="tab" href="#issue" role="tab" aria-controls="issue" aria-selected="false" onclick="setTimeout(readIssue, 100);setTimeout(readMile, 100);">이슈</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="document-tab" data-toggle="tab" href="#document" role="tab" aria-controls="document" aria-selected="false" onclick="setTimeout(readDocument, 300);">문서관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="history-tab" data-toggle="tab" href="#history" role="tab" aria-controls="history" aria-selected="false">히스토리</a>
        </li>
      </ul>

      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show" id="home" role="tabpanel" aria-labelledby="home-tab">
          <%@ include file="/WEB-INF/views/web-app/project/project-dashboard.jsp" %>
        </div>
        <div class="tab-pane fade show" id="detail" role="tabpanel" aria-labelledby="detail-tab">
          <%@ include file="/WEB-INF/views/web-app/project/project-detail.jsp" %>
        </div>
        <div class="tab-pane fade show" id="task" role="tabpanel" aria-labelledby="task-tab">
          <%@ include file="/WEB-INF/views/web-app/project/project-task.jsp" %>
        </div>
        <div class="tab-pane fade show" id="ganttchart" role="tabpanel" aria-labelledby="gantt-tab">
          <div id="projGantt" style="z-index:0"></div>
        </div>
        <div class="tab-pane fade show" id="issue" role="tabpanel" aria-labelledby="issue-tab">
          <%@ include file="/WEB-INF/views/web-app/project/project-issue.jsp" %>
        </div>
         <div class="tab-pane fade show" id="document" role="tabpanel" aria-labelledby="document-tab">
           <%@ include file="/WEB-INF/views/web-app/project/project-document.jsp" %>
        </div>
        <div class="tab-pane fade show" id="history" role="tabpanel" aria-labelledby="history-tab">
          <%@ include file="/WEB-INF/views/web-app/project/project-history.jsp" %>
        </div>
      </div>
    </div>
  </div>
<!-- 내 작업 바디 끝 -->
</div>
<!-- /page content -->
<script>
var endPointBefore = "";

window.onload = function() {

	var endPoint = window.location.search;

	if(getCookie('endPoint')){
		if(getCookie('endPoint') != endPoint){
			delCookie('endPoint');
		}
	}

	document.cookie = "endPoint="+endPoint;

	if(getCookie('tab')){
		var curTab = getCookie('tab');
		document.getElementById(curTab).click();
	} else if(!getCookie('tab')) {
		document.getElementById('home-tab').click();
	}

	$('a[role="tab"]').on('click', function() {
		var id = this.id
		document.cookie = "tab="+id;
	})

}

function getCookie(name) {
	  let matches = document.cookie.match(new RegExp(
	    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
	  ));
	  return matches ? decodeURIComponent(matches[1]) : undefined;
	}

const delCookie = function delCookie_by_name(name){
    let date = new Date();
    date.setDate(date.getDate() - 100);
    let Cookie = `${name}=;Expires=${date.toUTCString()}`
    document.cookie = Cookie;
}
</script>
</body>
