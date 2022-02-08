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

.seokFont{
font-family: 'Jua', sans-serif;
}
</style>

</head>
<body>
	<!-- 오버레이 시작 -->
	<div id="popoverlay"></div>
	<!-- 오버레이 끝 -->

<script type="text/x-handlebars-template" id="anyWhereMailRegistFormTemplate">
	<div class="row" style="display:none;" id="fadeInContent">
		<div class="col-md-12">
			<div class="x_panel">
				<div class="x_title row d-flex justify-content-between">
					<h5 class="title">
							<i class="fa fa-clone"></i> <span class="task-bold task-sm">메일 전송</span>
					</h5>
					<div class="clearfix">
						<button onclick="off()" class="btn btn-primary btn-sm">X</button>
					</div>
				</div>
				<div class="x_content">
					<div class="row">
						<!-- 내용저장 -->
						<div class="x_content row">
							<div class="col-sm-12">
								<form enctype="multipart/form-data" role="form" method="post" action="<%=request.getContextPath()%>/app/myWork/mailRegist" name="overlayAnyWhereMailRegistForm" class="form-horizontal form-label-left">
									<div class="inbox-body">
										<input type="hidden" id="anyWhereUserFrom" name="userFrom" value="${userVO.userId}">
										<input type="hidden" id="anyWhereOverlayDist" name="dist" value="">
										<input type="text" id="anyWhereMailOverlayUserTo" name="userTo" class="form-control form-control-sm mt-3 sendOverlayAnyWhereUserTo" placeholder="받는 사람:" value="">
										<br>
										<input type="text" id="anyWhereMailOverlayTitle" name="title" class="form-control form-control-sm sendOverlayAnyWhereTitle" placeholder="제목:">
										<br>
										<textarea id="anyWhereMailOverlayContent" name="content" rows="10" class="form-control content sendOverlayAnyWhereContent overlaySendAnyWhereContent" placeholder="내용을 입력하세요." style="display:none;"></textarea>
										<br>
									</div>
									<div class="card">
										<div class="card-header" style="background:#f7f7f7;border-bottom:none;">
											<button class="btn btn-sm btn-primary" onclick="addOverlayAnyWhereFile_go();" type="button" id="addFileBtn">파일첨부</button>
										</div>
										<div class="card-body overlayFileAnyWhereInput"></div>
										<div class="card-footer"></div>
									</div>
								</form>
							</div>
							<div class="col-sm-12 mt-3 pr-1" style="text-align:right;">
								<button type="button" id="mailAnyWhereTempSaveButton" class="btn btn-sm btn-dark" onclick="mailOverlayAnyWhereRegist_go('temp');return false;">임시저장</button>
								<button type="button" id="mailAnyWhereSendButton" class="btn btn-sm btn-primary" onclick="mailOverlayAnyWhereRegist_go('send', '${userVO.nickname}');return false;">전송</button>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
</script>

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
							<div class="x_content">
								<form id="registTaskForm" method="post" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
								<!-- 프로젝트명 -->
								<div class="item form-group">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="projTitle">
										프로젝트명
									</label>
								<div class="col-md-6 col-sm-6 ">
									<input type="text" id="projTitle" required="required" class="form-control form-control-sm"
										name="projTitle" value="{{projTitle}}" disabled>
								</div>
							</div>
									<div class="item form-group">
          								<label class="col-form-label col-md-3 col-sm-3 label-align for="userNickname">
											담당자
										</label>
										<div class="col-md-6 col-sm-6 ">
            								<select class="form-control form-control-sm" id="userNickname" name="userId">
												{{#each userList}}
              									<option value="{{this.userId}}">{{this.nickname}}</option>
												{{/each}}
            								</select>
										</div>
        							</div>
									<div class="item form-group">
          								<label class="col-form-label col-md-3 col-sm-3 label-align for="important">
											중요도
										</label>
										<div class="col-md-6 col-sm-6 ">
            								<select class="form-control form-control-sm" id="important" name="important">
              									<option value="B101">낮음</option>
              									<option value="B102">보통</option>
             									<option value="B103">높음</option>
            								</select>
										</div>
        							</div>
									<div class="item form-group">
          								<label class="col-form-label col-md-3 col-sm-3 label-align for="status">
											진행상태
										</label>
										<div class="col-md-6 col-sm-6 ">
            								<select class="form-control form-control-sm" id="status" name="status">
              									<option value="B201">예정</option>
              									<option value="B202">진행중</option>
             									<option value="B203">지연중</option>
             									<option value="B204">완료</option>
            								</select>
										</div>
        							</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="startdate">시작일
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="date" id="startdate" name="startdate" class="form-control form-control-sm">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="enddate">마감일
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="date" id="enddate" name="enddate" class="form-control form-control-sm">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="title">업무 제목
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="text" id="title" class="form-control form-control-sm" name="title">
										</div>
									</div>
									<div class=form-group">
										<label class=" label-align"> 업무내용 </label>
										<textarea class="projSummnote" name="content" ></textarea>
									</div>
									<div class="col-md-7 col-sm-7 offset-md-3 mt-3">
										<button type="button" class="btn btn-success" onclick='registTask()'>등록</button>
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

<script type="text/x-handlebars-template" id="taskRegistFormTemplate">
		<div class="row" style="display:none;" id="fadeInContent">
		<div class="col-md-12">
			<div class="x_panel">
				<div class="x_title row d-flex justify-content-between">
					<h5 class="title">
							<i class="fa fa-clone"></i> <span class="task-bold task-sm">업무 수정</span>
					</h5>
					<div class="clearfix">
						<button onclick="off()" class="btn btn-primary btn-sm">X</button>
					</div>
				</div>
				<div class="x_content">
					<div class="row">
							<div class="x_content">
								<form id="registTaskForm" method="post" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
								<!-- 프로젝트명 -->
								<div class="item form-group">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="projTitle">
										프로젝트명
									</label>
								<div class="col-md-6 col-sm-6 ">
									<input type="text" id="projTitle" required="required" class="form-control form-control-sm"
										name="projTitle" value="{{projTitle}}" disabled>
								</div>
							</div>
									<div class="item form-group">
          								<label class="col-form-label col-md-3 col-sm-3 label-align for="userNickname">
											담당자
										</label>
										<div class="col-md-6 col-sm-6 ">
            								<select class="form-control form-control-sm" id="userNickname" name="userId">
												{{#each userList}}
              									<option value="{{this.userId}}">{{this.nickname}}</option>
												{{/each}}
            								</select>
										</div>
        							</div>
									<div class="item form-group">
          								<label class="col-form-label col-md-3 col-sm-3 label-align for="important">
											중요도
										</label>
										<div class="col-md-6 col-sm-6 ">
            								<select class="form-control form-control-sm" id="important" name="important">
              									<option value="B101">낮음</option>
              									<option value="B102">보통</option>
             									<option value="B103">높음</option>
            								</select>
										</div>
        							</div>
									<div class="item form-group">
          								<label class="col-form-label col-md-3 col-sm-3 label-align for="status">
											진행상태
										</label>
										<div class="col-md-6 col-sm-6 ">
            								<select class="form-control form-control-sm" id="status" name="status">
              									<option value="B201">예정</option>
              									<option value="B202">진행중</option>
             									<option value="B203">지연중</option>
             									<option value="B204">완료</option>
            								</select>
										</div>
        							</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="startdate">시작일
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="date" id="startdate" name="startdate" class="form-control form-control-sm">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="enddate">마감일
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="date" id="enddate" name="enddate" class="form-control form-control-sm">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="title">업무 제목
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="text" id="title" class="form-control form-control-sm" name="title">
										</div>
									</div>
									<div class=form-group">
										<label class=" label-align"> 업무내용 </label>
										<textarea class="projSummnote" name="content" ></textarea>
									</div>
									<div class="col-md-7 col-sm-7 offset-md-3 mt-3">
										<button type="button" class="btn btn-success" onclick='registTask()'>등록</button>
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


<script type="text/x-handlebars-template" id="taskModifyFormTemplate">
	<div class="row" style="display:none;" id="fadeInContent">
		<div class="col-md-12">
			<div class="x_panel">
				<div class="x_title row d-flex justify-content-between">
					<h5 class="title">
							<i class="fa fa-clone"></i> <span class="task-bold task-sm">업무 수정</span>
					</h5>
					<div class="clearfix">
						<button onclick="off()" class="btn btn-primary btn-sm">X</button>
					</div>
				</div>
				<div class="x_content">
					<div class="row">
							<div class="x_content">
								<form id="modifyTaskForm" method="post" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
								<!-- 프로젝트명 -->
								<div class="item form-group">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="title">
										프로젝트명
									</label>
								<div class="col-md-6 col-sm-6 ">
									<input type="text" id="title" required="required" class="form-control form-control-sm"
										name="projTitle" value="{{projTitle}}" disabled>
									<input type="hidden" name="taskNo" value="{{taskNo}}">
								</div>
							</div>
									<div class="item form-group">
          								<label class="col-form-label col-md-3 col-sm-3 label-align for="userNickname">
											담당자
										</label>
										<div class="col-md-6 col-sm-6 ">
            								<select class="form-control form-control-sm" id="userNickname" name="userId">
												{{#each userList}}
              									<option value="{{this.userId}}">{{this.nickname}}</option>
												{{/each}}
            								</select>
										</div>
        							</div>
									<div class="item form-group">
          								<label class="col-form-label col-md-3 col-sm-3 label-align for="important">
											중요도
										</label>
										<div class="col-md-6 col-sm-6 ">
            								<select class="form-control form-control-sm" id="important" name="important">
              									<option value="B101">낮음</option>
              									<option value="B102">보통</option>
             									<option value="B103">높음</option>
            								</select>
										</div>
        							</div>
									<div class="item form-group">
          								<label class="col-form-label col-md-3 col-sm-3 label-align for="status">
											진행상태
										</label>
										<div class="col-md-6 col-sm-6 ">
            								<select class="form-control form-control-sm" id="status" name="status">
              									<option value="B201">예정</option>
              									<option value="B202" selected>진행중</option>
             									<option value="B203">지연중</option>
             									<option value="B204">완료</option>
            								</select>
										</div>
        							</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="startdate">시작일
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="date" id="startdate" value="{{formatTime startdate "yyyy-MM-DD"}}" name="startdate" class="form-control form-control-sm">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="enddate">마감일
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="date" id="enddate" value="{{formatTime enddate "yyyy-MM-DD"}}" name="enddate" class="form-control form-control-sm">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"
											for="title">업무 제목
										</label>
										<div class="col-md-6 col-sm-6 ">
											<input type="text" id="title" value="{{title}}" class="form-control form-control-sm" name="title">
										</div>
									</div>
									<div class=form-group">
										<label class=" label-align"> 업무내용 </label>
										<textarea class="projSummnote" name="content" >{{{content}}}</textarea>
									</div>
									<div class="col-md-7 col-sm-7 offset-md-3 mt-3">
										<button type="button" class="btn btn-success" onclick='modifyTaskDetail()'>수정</button>
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
				<textarea class="projSummnote" name="noticeCont" required="required">{{{noticeCont}}}</textarea>
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


<!-- chatTest -->
<script type="text/x-handlebars-template" id="chatTemplate">



 <div id="overlayChat">
                        <div id="textChat">
                            <div id="roomWrap">
                                <div id="roomList">
                                        <div id="roomCreate" ><span style="font-size: 2.0em;">&nbsp;<i class="fa fa-comments"></i>channel &nbsp;<i class="fa fa-plus-square" data-toggle="modal" data-target="#createRoomModal"></i> </span></div>
                                     

                                        <div id="roomSelect">
                    					
   									    <div id="chatListSeok"></div>
                                            
                                    
                                       </div>
                                </div>
                            </div>
                             <span style="font-size: 1.5em;" id="offChatList" onclick="offChatList()">&nbsp;&nbsp;<i class="fa fa-chevron-circle-right"></i>&nbsp;접기</span>
                       
                            
           </div>
                            
</div>



</script>

<script type="text/x-handlebars-template" id="chatModalTemplate">
  <base href="https://demos.telerik.com/kendo-ui/listbox/index">
  <style>html { font-size: 14px; font-family: Arial, Helvetica, sans-serif; }</style>
 <style>
    .demo-section label {
        margin-bottom: 5px;
        font-weight: bold;
        display: inline-block;
    }

    #employees {
        width: 270px;
    }

    #example .demo-section {
        max-width: none;
        width: 600px;
    }

    #example .k-listbox {
        width: 236px;
        height: 350px;
    }

    #example .k-listbox:first-of-type {
        width: 270px;
        margin-right: 1px;
    }
</style>



<div id="createRoomModal" class="modal modal-default fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">채팅방 생성</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" data-rno>

				<form role="form" id="createChatForm" method="post" action="/chat/createRoom" name="createForm">
					<br>
					<div class="form-group row">


						  <label ><span class="required" >&nbsp;&nbsp;&nbsp;채팅방 이름 </span></label>
						<div class="col-lg-12">

							<input id="title" onclick="button_click();" class="form-control col-md-12 seokid" name="title" value="" placeholder="">
			
			            </div>
							
					</div>


		
					<div class="form-group row">
						  <label ><span class="required" >&nbsp;&nbsp;&nbsp;프로젝트 선택</span></label>
						<div class="col-lg-12">
			                    <select class="select2_single form-control" name="Ptitle" id="selectProject" tabindex="-1" >
									<option value=''>==내가속한 프로젝트 리스트==</option>
			                        {{#each.}}
										<option value="{{this}}">{{this}}</option>
									{{/each}}
			                    </select>
						</div>
					</div>
			
					<div class="form-group row">
						  <label ><span class="required" >&nbsp;&nbsp;&nbsp;멤버선택</span></label>
						<div class="col-lg-12" id="memberInvite">


	
							    <div id="example" role="application">	
   									 <div class="demo-section k-content wide">	
      									  <div>
           										 <label for="optional" id="employees">Employees</label>
         										   <label for="selected">Developers</label>
          											  <br />
          									  <select id="optional" >
           									   </select>
            					<select id="selected"></select>
        									</div>
   									 </div>	
   								 </div>	


						</div>



					</div>
					<span id="checkCreateRoom">가이드</span>
					<div class="float-right">
						<button type="button" class="btn btn-info" id="replyDelBtn"
							onclick="createRoom();">생성</button>
						<button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
					</div>	
					
				</form>
			</div>


		</div>

		<div class="modal-footer">

			
		</div>
	</div>
</div>


</script>


<!-- 채팅 테스트 템플릿 -->
<!-- <div id="overlayChat">
  <div id="textChat">
 	 <div id="roomWrap">
	  	 <div id="roomList">
	                <div id="roomCreate" data-toggle="modal" data-target="#createRoomModal">방만들기+</div>
	                <div id='roomHeader'>채팅 방 목록</div>
	                <div id="roomSelect">

						
						{{#each.}}
							<div class="roomEl" data-id="2" onclick="selectChatRoom('{{this.realRoom}}');">{{this.title}}</div>	
						{{/each}}	                  	

				
	              	</div>
	        </div>
        </div>
        
  <div id="offChatList" onclick="offChatList()">접기</div>
        
  </div>
  	
</div> -->

<!-- 채팅 기존 템플릿

 <div id="overlayChat">
                        <div id="textChat">
                            <div id="roomWrap">
                                <div id="roomList">
                                        <div id="roomCreate" ><span style="font-size: 2.0em;">&nbsp;<i class="fa fa-comments"></i>channel &nbsp;<i class="fa fa-plus-square" data-toggle="modal" data-target="#createRoomModal"></i> </span></div>
                                     

                                        <div id="roomSelect">
                    
                                            <table class="table table-hover">

												{{#each.}}
                                               		  <tr>
                                                	    <td class="active" onclick="selectChatRoom('{{this.realRoom}}');"><span class="seokFont" style="font-size: 1.2em;">{{this.title}}</span></td>
                                              		  </tr>
												{{/each}}	       	

                                            </table>
                                            
                                    
                                            </div>
                                </div>
                            </div>
                             <span style="font-size: 1.5em;" id="offChatList" onclick="offChatList()">&nbsp;&nbsp;<i class="fa fa-chevron-circle-right"></i>&nbsp;접기</span>
                       
                            
           </div>
                            
</div>














 --> 






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