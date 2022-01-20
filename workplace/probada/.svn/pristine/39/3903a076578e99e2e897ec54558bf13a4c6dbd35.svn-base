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
	cursor: pointer;
}
</style>

</head>
<body>
	<!-- 오버레이 시작 -->
	<div id="popoverlay">
		  <div class="row">
			<div class="col-md-12">
				<div class="x_panel">
					<div class="x_title row d-flex justify-content-between">
						<h5 class="title">
							<i class="fa fa-clone"></i> <span class="task-bold task-sm">업무
								등록</span>

						</h5>
						<div class="clearfix">
							<button onclick="off()" class="btn btn-primary btn-sm">X</button>
						</div>
					</div>
					<div class="x_content">
						<div class="row">
							<!-- 내용저장 -->
							<div class="x_content">
								<br>
								<form id="demo-form2" data-parsley-validate=""
									class="form-horizontal form-label-left" novalidate="">
									<div class="item form-group">
										<label for="middle-name"
											class="col-form-label col-md-3 col-sm-3 label-align">Middle
											Name / Initial</label>
										<div class="col-md-6 col-sm-6 ">
											<input id="middle-name" class="form-control" type="text"
												name="middle-name">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align">Gender</label>
										<div class="col-md-6 col-sm-6 ">
											<div id="gender" class="btn-group" data-toggle="buttons">
												<label class="btn btn-secondary"
													data-toggle-class="btn-primary"
													data-toggle-passive-class="btn-default"> <input
													type="radio" name="gender" value="male" class="join-btn"
													data-parsley-multiple="gender"> &nbsp; Male &nbsp;
												</label> <label class="btn btn-primary"
													data-toggle-class="btn-primary"
													data-toggle-passive-class="btn-default"> <input
													type="radio" name="gender" value="female" class="join-btn"
													data-parsley-multiple="gender"> Female
												</label>
											</div>
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align">Date
											Of Birth <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input id="birthday" class="date-picker form-control"
												placeholder="dd-mm-yyyy" type="text" required="required"
												onfocus="this.type='date'" onmouseover="this.type='date'"
												onclick="this.type='date'" onblur="this.type='text'"
												onmouseout="timeFunctionLong(this)">
											<script>
												function timeFunctionLong(input) {
													setTimeout(function() {
														input.type = 'text';
													}, 60000);
												}
											</script>
										</div>
									</div>
									<div class="ln_solid"></div>
									<div class="item form-group">
										<div class="col-md-6 col-sm-6 offset-md-3">
											<button class="btn btn-primary" type="button">Cancel</button>
											<button class="btn btn-primary" type="reset">Reset</button>
											<button type="submit" class="btn btn-success">Submit</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	 </div>
	<!-- 오버레이 끝 -->



	<script type="text/x-handlebars-template" id="formTemplate">
	<div class="row">
		<div class="col-md-12">
			<div class="x_panel">
				<div class="x_title row d-flex justify-content-between">
					<h5 class="title">
							<i class="fa fa-clone"></i> <span class="task-bold task-sm">{{dist}} 등록</span>
					</h5>
					<div class="clearfix">
						<button onclick="off()" class="btn btn-primary btn-sm">X</button>
					</div>
				</div>
				<div class="x_content">
					<div class="row">
							<!-- 내용저장 -->
							<div class="x_content">
								<br>
								<form id="demo-form2" data-parsley-validate=""
									class="form-horizontal form-label-left" novalidate="">
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="project">프로젝트 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 ">
											<select name="project" class="form-control form-control-sm" readonly>
												<option>프로젝트AA</option>
              									<option>프로젝트BB</option>
             									<option>프로젝트CC</option>
											</select>
										</div>
									</div>
									{{#ifCond dist '==' "이슈"}}
									{{!-- 이슈 등록시 추가 --}}
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="project">업무 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 ">
											<select name="project" class="form-control form-control-sm" id="project">
												<option>업무AA</option>
              									<option>업무BB</option>
             									<option>업무CC</option>
											</select>
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="mile">마일스톤 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="text" name="mile" required="required" class="form-control form-control-sm">
										</div>
									</div>
									{{/ifCond}}
									<div class="item form-group">
          								<label class="col-form-label col-md-3 col-sm-3 label-align for="userNickname">
											담당자
										</label>
										<div class="col-md-6 col-sm-6 ">
            								<select class="form-control form-control-sm" id="userNickname">
              									<option>RealHyukPL</option>
              									<option>EnergyWookAA</option>
             									<option>SpearWaterDA</option>
            								</select>
										</div>
        							</div>
									<div class="item form-group">
          								<label class="col-form-label col-md-3 col-sm-3 label-align for="important">
											중요도
										</label>
										<div class="col-md-6 col-sm-6 ">
            								<select class="form-control form-control-sm" id="important">
              									<option>낮음</option>
              									<option>보통</option>
             									<option>높음</option>
            								</select>
										</div>
        							</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="startdate">시작일 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="date" id="startdate" required="required" class="form-control form-control-sm ">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="enddate">마감일 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="date" id="enddate" required="required" class="form-control form-control-sm">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="title">{{dist}} 제목 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="text" id="title" required="required" class="form-control form-control-sm">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="content">{{dist}} 내용 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 ">
											<textarea class="form-control form-control-sm" name="content" style="height:120px;"></textarea>
										</div>
									</div>
									<div class="item form-group">
        								<div class="col-sm-12">
          									<label class="col-form-label col-md-3 col-sm-3 label-align">첨부파일 :</label>
          									<form action="form_upload.html" class="dropzone dz-clickable">
            							<div class="dz-default dz-message">
              							<span>파일을 등록해주세요.</span>
            						</div>
								</form>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</script>
