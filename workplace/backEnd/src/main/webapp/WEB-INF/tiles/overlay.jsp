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



<script type="text/x-handlebars-template" id="issueRegistFormTemplate">
	<div class="row" style="display:none;" id="fadeInContent">
		<div class="col-md-12">
			<div class="x_panel">
				<div class="x_title row d-flex justify-content-between">
					<h5 class="title">
							<i class="fa fa-clone"></i> <span class="task-bold task-sm">이슈 등록</span>
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
											for="title">이슈 제목 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="text" id="title" required="required" class="form-control form-control-sm">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="content">이슈 내용 <span class="required">*</span>
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

<script type="text/x-handlebars-template" id="taskRegistFormTemplate">
	<div class="row" style="display:none;" id="fadeInContent">
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



<!-- 프로젝트 생성 타입 화면 -->
<script type="text/x-handlebars-template" id="projRegistTypeTemplate">
<div class="row" style="display:none;" id="fadeInContent">
  <div class="col-md-12">
    <div class="x_panel">
      <div class="x_title row d-flex justify-content-between">
        <h5 class="title">
          <i class="fa fa-clone"></i>
          <span class="task-bold task-sm">프로젝트 등록</span>
        </h5>
        <div class="clearfix">
          <button onclick="off()" class="btn btn-primary btn-sm">X</button>
        </div>
      </div>
      <div class="x_content">
        <div class="row">
          <div class="x_content">
			<div class="projRegistPicture rounded rounded-3" style="background-image: url('/resources/asserts/images/project-personal.png');"
				onclick="getOverlayTemplate('projRegistFormTemplate');">
			</div>
				<p class="text-center">개인 프로젝트 생성</p>
			<div class="projRegistPicture rounded rounded-3" style="background-image: url('/resources/asserts/images/project-team.png');"
				onclick="getOverlayTemplate('projInviteFormTemplate');">
			</div>
				<p class="text-center">구성원을 초대해 프로젝트 생성</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</script>

<script type="text/x-handlebars-template" id="projInviteFormTemplate">
        <div class="row" style="display:none;" id="fadeInContent">
  <div class="col-md-12">
    <div class="x_panel">
      <div class="x_title row d-flex justify-content-between">
        <h5 class="title">
          <i class="fa fa-clone"></i>
          <span class="task-bold task-sm">프로젝트 등록</span>
        </h5>
        <div class="clearfix">
			<button onclick="prev()" class="btn btn-primary btn-sm"><-</button>
          	<button onclick="off()" class="btn btn-primary btn-sm">X</button>
        </div>
      </div>
      <div class="x_content">
        <div class="row">
          <!-- 내용저장 -->
          <div class="x_content">
            <form>
			<div class="p-4">
              <p>콜라보 제안은 다른 프로젝트 팀과 협업 할 수 있는 곳입니다.</p>
              <p>다른 팀과 협업 공간을 만들고 함께 일해보세요.</p>
			</div>
              <div class="card-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">이메일로 초대</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="상대방의 이메일을 입력하세요.">
                </div>
                <!-- select -->
                <div class="form-group">
                  <label>접근 권한</label>
                  <select class="form-control">
                    <option value="" disabled selected hidden>접근 권한을 설정해 주세요.</option>
                    <option>Observer</option>
                    <option>Cooperator</option>
                    <option>Partner</option>
                    <option>Collaborator</option>
                  </select>
                </div>
                <!-- textarea -->
                <div class="form-group">
                  <label>보낼 메세지</label>
                  <textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
                </div>
              </div>
              <!-- /.card-body -->
              <button type="submit" class="btn  btn-outline-primary collabo-submit-btn">보내기</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</script>

<!-- 프로젝트 생성 -->
<script type="text/x-handlebars-template" id="projRegistFormTemplate">
<div class="row" style="display:none;" id="fadeInContent">
<div class="col-md-12">
  <div class="x_panel">
    <div class="x_title row d-flex justify-content-between">
      <h5 class="title">
        <i class="fa fa-clone"></i>
        <span class="task-bold task-sm">프로젝트 등록</span>
      </h5>
      <div class="clearfix">
		<button onclick="prev()" class="btn btn-primary btn-sm"><-</button>
        <button onclick="off()" class="btn btn-primary btn-sm">X</button>
      </div>
    </div>
    <div class="x_content">
      <div class="row">
        <div class="x_content">
			<form id="registProjectForm" method="post" data-parsley-validate=""
				class="form-horizontal form-label-left" novalidate="">
			<!-- 프로젝트명 -->
					<div class="item form-group">
						<label class="col-form-label col-md-3 col-sm-3 label-align"
							for="title">프로젝트명 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 ">
							<input type="text" id="title" required="required"
							placeholder="프로젝트명을 입력해주세요." class="form-control form-control-sm" name="title">
						</div>
					</div>
			<!-- 공개범위 -->
			<div class="item form-group">
          		<label class="col-form-label col-md-3 col-sm-3 label-align for="privacy">
					공개범위
				</label>
					<div class="col-md-6 col-sm-6 ">
            			<select class="form-control form-control-sm" required="required" name="privacy" id="privacy">
							<option value="A401" selected>공개</option>
							<option value="A402">제한</option>
							<option value="A403">비공개</option>
            			</select>
					</div>
        		</div>
			<!-- 시작일 -->
			<div class="item form-group">
				<label class="col-form-label col-md-3 col-sm-3 label-align"
					for="startdate">시작일 <span class="required">*</span>
				</label>
				<div class="col-md-6 col-sm-6 ">
					<input type="date" id="startdate" required="required" class="form-control form-control-sm" name="startdate">
				</div>
			</div>
			<!-- 종료일 -->
			<div class="item form-group">
				<label class="col-form-label col-md-3 col-sm-3 label-align"
					for="enddate">마감일</span>
				</label>
				<div class="col-md-6 col-sm-6 ">
					<input type="date" id="enddate" class="form-control form-control-sm" name="enddate">
				</div>
			</div>
			<!-- 프로젝트 소개 -->
			<div class=form-group">
				<label class=" label-align"> 프로젝트 소개 </label>
				<textarea class="projSummnote" name="intro" required="required"></textarea>
			</div>
			<div class="col-md-7 col-sm-7 offset-md-3 mt-3">
				<button type="button" class="btn btn-success" onclick='registProject()'>등록</button>
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


<!-- 프로젝트 수정 -->
<script type="text/x-handlebars-template" id="projModifyFormTemplate">


<div class="row" style="display:none;" id="fadeInContent">
<div class="col-md-12">
  <div class="x_panel">
    <div class="x_title row d-flex justify-content-between">
      <h5 class="title">
        <i class="fa fa-clone"></i>
        <span class="task-bold task-sm">프로젝트 수정</span>
      </h5>
      <div class="clearfix">
        <button onclick="off()" class="btn btn-primary btn-sm">X</button>
      </div>
    </div>
    <div class="x_content">
      <div class="row">
        <div class="x_content">
			<form id="modifyProjectForm" method="post" data-parsley-validate=""
				class="form-horizontal form-label-left" novalidate="">
			<!-- 프로젝트명 -->
					<div class="item form-group">
						<label class="col-form-label col-md-3 col-sm-3 label-align"
							for="title">프로젝트명 <span class="required">*</span>
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
				<label class=" label-align"> 프로젝트 소개 </label>
				<textarea class="projSummnote" name="intro" required="required">{{intro}}</textarea>
			</div>
			<div class="col-md-7 col-sm-7 offset-md-3 mt-3">
				<button type="button" class="btn btn-success" onclick='modifyProjectDetail()'>수정</button>
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

<!-- 프로젝트 공지 수정 -->
<script type="text/x-handlebars-template" id="noticeRegistFormTemplate">


<div class="row" style="display:none;" id="fadeInContent">
<div class="col-md-12">
  <div class="x_panel">
    <div class="x_title row d-flex justify-content-between">
      <h5 class="title">
        <i class="fa fa-clone"></i>
        <span class="task-bold task-sm">공지사항 등록</span>
      </h5>
      <div class="clearfix">
        <button onclick="off()" class="btn btn-primary btn-sm">X</button>
      </div>
    </div>
    <div class="x_content">
      <div class="row">
        <div class="x_content">
			<form id="modifyProjectNotice" method="post" class="form-horizontal form-label-left">
			<!-- 공지 제목 -->
					 <div class="item form-group custom-validate">
						<label class="col-form-label col-md-3 col-sm-3 label-align"
							for="notice">공지 제목 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 ">
							<input type="text" id="notice" class="form-control form-control-sm" name="notice" cv="false">
								<small>제목은 필수입력사항입니다.</small>
						</div>

					</div>

			<div class="form-group custom-validate">
				<label class=" label-align">공지 내용 </label>
				<textarea class="projSummnote" name="noticeCont"></textarea>
			</div>
			<div class="col-md-7 col-sm-7 offset-md-3 mt-3">
				<button type="button" class="btn btn-success" onclick='modifyProjectNotice()'>등록</button>
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

<!-- 프로젝트 공지 수정 -->
<script type="text/x-handlebars-template" id="noticeModifyFormTemplate">


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
			<form id="modifyProjectNotice" method="post" data-parsley-validate=""
				class="form-horizontal form-label-left" novalidate="">
			<!-- 공지 제목 -->
					<div class="item form-group">
						<label class="col-form-label col-md-3 col-sm-3 label-align"
							for="notice">공지 제목 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 ">
							<input type="text" id="notice" required="required" class="form-control form-control-sm" name="notice" value="{{notice}}">
						</div>
					</div>
			<!-- 공지 내용 -->
			<div class=form-group">
				<label class=" label-align">공지 내용 </label>
				<textarea class="projSummnote" name="noticeCont" required="required">{{noticeCont}}</textarea>
			</div>
			<div class="col-md-7 col-sm-7 offset-md-3 mt-3">
				<button type="button" class="btn btn-success" onclick='modifyProjectNotice()'>수정</button>
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

<!-- 템플레이트
<div class="row" style="display:none;" id="fadeInContent">
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
							<div class="x_content">
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 -->