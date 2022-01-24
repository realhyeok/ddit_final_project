<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 내 작업 히스토리관리입니다. -->
<div id="example">
    <div id="projectHistory"></div>
</div>
<!-- 내 작업 히스토리관리입니다. 끝 -->

<script id="projectHistory-template" type="text/x-kendo-template">
	<div class="media event">
		<img src='<%=request.getContextPath()%>/resources/asserts/images/img.jpg' alt='img' style='margin:5px 10px 5px 3px;height:50px;width:50px;border-radius:100%;'/>
		<div class="media-body">
			<p class="mt-1">#:msg#</p>
			<p>#:regDate#</p>
		</div>
		<button type="button" class="btn btn-sm btn-dark mt-1" style="height:40px;width:38px;" onclick="location.href='<%=request.getContextPath()%>/app/myWork/#:url#'">이동</button>
	</div>
</script>