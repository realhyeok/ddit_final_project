<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#popoverlay {
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
	<div id="popoverlay"></div>
	<!-- 오버레이 끝 -->

<!-- 콜라보프로젝트 수정 -->	
<script type="text/x-handlebars-template" id="collaboModifyFormTemplate">
	<div class="row" style="display:none;" id="fadeInContent">
<div class="col-md-12">
  <div class="x_panel">
    <div class="x_title row d-flex justify-content-between">
      <h5 class="title">
        <i class="fa fa-clone"></i>
        <span class="task-bold task-sm">콜라보 프로젝트 수정</span>
      </h5>
      <div class="clearfix">
        <button onclick="off()" class="btn btn-primary btn-sm">X</button>
      </div>
    </div>
    <div class="x_content">
      <div class="row">
        <div class="x_content">
			<form id="modifyCollaboForm" method="post" data-parsley-validate=""
				class="form-horizontal form-label-left" novalidate="">
			<!-- 프로젝트명 -->
					<div class="item form-group">
						<label class="col-form-label col-md-3 col-sm-3 label-align"
							for="title">콜라보명 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 ">
							<input type="text" id="title" required="required" class="form-control form-control-sm" name="title" value="{{title}}">
						</div>
					</div>
			<!-- 공개범위 -->
			<div class="item form-group">
          		<label class="col-form-label col-md-3 col-sm-3 label-align for="privacy">
					공개범위
				</label>
					<div class="col-md-6 col-sm-6 ">
            			<select class="form-control form-control-sm" required="required" name="privacy" id="privacy">
							<option value="A401"
							{{#ifCond privacy '==' "공개"}}
              					selected
							{{/ifCond}}
							>공개</option>
							<option value="A402"
							{{#ifCond privacy '==' "제한"}}
              					selected
							{{/ifCond}}
							>제한</option>
							<option value="A403"
							{{#ifCond privacy '==' "비공개"}}
              					selected
							{{/ifCond}}
							>비공개</option>
            			</select>
					</div>
        		</div>
			<!-- 시작일 -->
			<div class="item form-group">
				<label class="col-form-label col-md-3 col-sm-3 label-align"
					for="startdate">시작일 <span class="required">*</span>
				</label>
				<div class="col-md-6 col-sm-6 ">
					<input type="date" id="startdate" required="required" class="form-control form-control-sm" name="startdate" value={{startdate}}>
				</div>
			</div>
			<!-- 종료일 -->
			<div class="item form-group">
				<label class="col-form-label col-md-3 col-sm-3 label-align"
					for="enddate">마감일</span>
				</label>
				<div class="col-md-6 col-sm-6 ">
					<input type="date" id="enddate" class="form-control form-control-sm" name="enddate" value={{enddate}}>
				</div>
			</div>
			<!-- 프로젝트 소개 -->
			<div class=form-group">
				<label class=" label-align"> 콜라보 소개 </label>
				<textarea class="cprojSummernote" name="intro" required="required">{{intro}}</textarea>
			</div>
			<div class="col-md-7 col-sm-7 offset-md-3 mt-3">
				<button type="button" class="btn btn-success" onclick='modifyCollaboDetail()'>수정</button>
				<button class="btn btn-primary" type="button">취소</button>
				<button class="btn btn-primary" type="reset">리셋</button>
			</div>
		</form>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</script>	

<script type="text/x-handlebars-template" id="collaboNoticeModifyFormTemplate">
<div class="row" style="display:none;" id="fadeInContent">
<div class="col-md-12">
  <div class="x_panel">
    <div class="x_title row d-flex justify-content-between">
      <h5 class="title">
        <i class="fa fa-clone"></i>
        <span class="task-bold task-sm">공지사항 수정</span>
      </h5>
      <div class="clearfix">
        <button onclick="off()" class="btn btn-primary btn-sm">X</button>
      </div>
    </div>
    <div class="x_content">
      <div class="row">
        <div class="x_content">
			<form id="modifyCollaboNotice" method="post" data-parsley-validate=""
				class="form-horizontal form-label-left" novalidate="">
			<!-- 공지 제목 -->
					<div class="item form-group custom-validate">
						<label class="col-form-label col-md-3 col-sm-3 label-align"
							for="notice">공지 제목 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 ">
							<input type="text" id="notice" class="form-control form-control-sm" name="notice" cv="false" value={{{notice}}}>
								<small>제목은 필수입력사항입니다.</small>
						</div>
					</div>
			<!-- 공지 내용 -->
			<div class=form-group">
				<label class=" label-align">공지 내용 </label>
				<textarea class="cprojSummernote" name="noticeCont" required="required">{{{noticeCont}}}</textarea>
			</div>
			<div class="col-md-7 col-sm-7 offset-md-3 mt-3">
				<button type="button" class="btn btn-success" onclick='modifyCollaboNotice()'>수정</button>
				<button class="btn btn-primary" type="button" onclick='deleteProjectNotice()'>삭제</button>
				<button class="btn btn-primary" type="button">취소</button>
			</div>

		</form>
        </div>
      </div>
    </div>
  </div>
</div>
</div>	
</script>

	
</body>
</html>
