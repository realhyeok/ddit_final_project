<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="row">
	<!--  컬럼 시작 -->
	<div class="col-sm-12">
		<div class="collabo-detail d-flex flex-column ">

			<!-- 프로젝트 소개 시작 -->
			<div id="collaboDetailIntroTarget"></div>
			<script type="text/x-handlebars-template" id="collaboDetailIntro">
						<div class="collabo-detail-body mb-3 p-3">
							<div class="x_title">
								<h2 class="title">
									<i class="fa fa-gears fa-lg"></i> <span class="">
										{{title}} </span>
								</h2>
								<div class="clearfix">
									<div class="clearfix header-title justify-content-end">
										<i class="fa fa-edit fa-2x" onclick="getOverlayModifyTemplate('collaboModifyFormTemplate','/app/collabo/getCollaboByCprojNo')"></i>
									</div>
								</div>
							</div>
							<div class="x_content mb-3" >
								<span class="collabo-intro">
									{{{intro}}}
									</span>
							</div>
						</div>

						<div class="collabo-detail-body mb-3 px-3">
							<div class="panel-body">
								<div class="task_detail mb-3">
									<div class="col-sm-12 p-0">
										<div class="col-sm-6">
											<h4 class="title">
												<i class="fa fa-calendar-o"></i> 시작일
											</h4>
											<p>{{formatTime startdate "YYYY년 MM월 DD일"}}</p>
											<div class="boxed">
												<h4 class="title">
													<i class="fa fa-unlock-alt fa-lg"></i> 공개범위
												</h4>
												<p>{{privacy}}</p>
											</div>
										</div>
										<div class="col-sm-6">
											<h4 class="title">
												<i class="fa fa-calendar-check-o"></i> 마감일
											</h4>
											<p>{{formatTime enddate "YYYY년 MM월 DD일"}}</p>
											<h4 class="title">
												<i class="fa fa-question-circle-o"></i> 진행상태
											</h4>
											<p>{{status}}</p>
										</div>

									</div>
									<div class="col-sm-12 mb-3">
										<h2 class="title">
											<i class="fa fa-hashtag"></i> 태그
										</h2>
									
										<span class="badge badge-success">1</span>
									
									</div>
								</div>
							</div>
						</div>

           				<!-- start accordion -->
    		<div class="accordion" id="accordion1" role="tablist" aria-multiselectable="true">
				<div class="panel">
					<a class="panel-heading collabo-detail-a" role="tab" id="headingOne1" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1" aria-expanded="true"
						aria-controls="collapseOne">
						<h4 class="panel-title" onclick="subProjList('{{cprojNo}}');">
							<i class="fa fa-object-group"></i> 연관 프로젝트
						</h4>
					</a>
					<div id="collapseOne1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<table class="table table-striped">

								<tbody id="selectSubProject">
									<tr>
										<td><a href="" class="collabo-detail-a">하위 프로젝트 1</a></td>
									</tr>

									<tr>
										<td><a href="" class="collabo-detail-a">하위 프로젝트 2</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
          		  		<!-- end of accordion -->
						</script>
			<!-- 프로젝트 소개 끝 -->
			
			

			<!-- 프로젝트 공지사항 본문 시작 -->
			<div id="collaboDetailNotifyTarget"></div>
			<script type="text/x-handlebars-template" id="collaboDetailNotify">

						<div class="collabo-detail-body collabo-notice p-3">
							<div class="x_title">
								<h2 class="title">
									<i class="fa fa-sticky-note"></i> 공지사항
								</h2>
								<div class="clearfix">
							{{#ifCond notice '!=' NULL}}
									<div class="clearfix header-title justify-content-end">
										<i class="fa fa-edit fa-2x" onclick="getOverlayModifyTemplate('collaboNoticeModifyFormTemplate','/app/collabo/getCollaboByCprojNo')"></i>
									</div>
							{{/ifCond}}
								</div>
							</div>
							{{#ifCond notice '!=' NULL}}
							<div class="border round round-3 p-3 mb-3">
								<!-- 프로젝트 공지사항 예시 시작 -->
								<div class="x_title">
									<h5 class="title">
										<span>{{{notice}}}</span>
									</h5>
									<div class="clearfix"></div>
								</div>
								<div class="collabo-detail-body collabo-notice-content">
									&nbsp;{{{noticeCont}}}</div>
							</div>
							<!-- 프로젝트 공지사항 예시 끝 -->
							{{/ifCond}}
							{{#ifCond notice '==' NULL}}
                    	<div class="btn create-btn collabo-bg-btn" style="width:80%;" onclick="getOverlayModifyTemplate('collaboNoticeModifyFormTemplate','/app/collabo/getCollaboByCprojNo')">
                      		<span class="text-dark">새로운 공지사항을 등록해보세요!</span>
						</div>
							{{/ifCond}}
				</script>


			<!-- 중요첨부 파일 시작 -->
			<div id="collaboDetailDocumentTarget"></div>
			<script type="text/x-handlebars-template" id="collaboDetailDocument">
				<div class="collabo-detail-body">
					<div class="x_title">
						<h2 class="title">
							<i class="glyphicon glyphicon-hdd"></i> 중요첨부파일
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="col-sm-12">
						<ul class="row list-unstyled project-files">
							{{#each .}}
								{{#ifCond @index "<" 3}}
							<li class="d-flex align-items-center">
								<div class="btn files-btn d-flex flex-wrap align-items-center justify-content-center"  style="width:140px;height:140px">
									<i class="fa fa-file-text fa-5x text-dark"></i>
									<div class="mt-2" style="font-size:0.8em;">{{{name}}}{{{extension}}}</div>
								</div>
							</li>
								{{/ifCond}}
							{{/each}}
							{{#ifCond this.length "<=" 2}}
							<li>
								<div class="btn create-btn files-btn">
									<i class="fa fa-plus fa-lg text-dark"></i>
								</div>
							</li>
							{{/ifCond}}
						</ul>
						</div>
					<br />
				</div>

				</script>

		</div>
		<!-- 프로젝트 공지사항 본문 끝 -->




		<!-- 구성원 시작-->
		<div class="collabo-detail-body">
			<div class="x_title header-title">
				<h2 class="title">
					<i class="fa fa-users"></i> 구성원
				</h2>
				<div class="clearfix header-title">
					<a href="" data-toggle="modal" data-target="#collabo-member-add"><i
						class="fa fa-user-plus fa-2x"></i></a>
				</div>
			</div>
			<td>
				<ul class="list-inline" style="display: inline-flex">
					<!-- 구성원 단위 시작 -->
					<li class="collabo-member nav-item dropdown open">
						<div class="d-flex flex-column">
							<span>PL</span><br /> <a href="javascript:;"
								class="collabo-member " aria-haspopup="true" id="navbarDropdown"
								data-toggle="dropdown" aria-expanded="false"> <img
								src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
								class="img-circle" alt="Avatar" />
							</a>
							<div class="dropdown-menu dropdown-membermenu pull-right"
								aria-labelledby="navbarDropdown">
								<!-- 프로필 상세 드롭다운 -->
								<div class="col-md-3   widget widget_tally_box">
									<div class="fixed_height_390">
										<div class="x_content">
											<div class="flex">
												<ul class="list-inline widget_profile_box">
													<li></li>
													<li class="d-flex justify-content-center"><img
														src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
														alt="..." class="img-circle profile_img"></li>
													<li></li>
												</ul>
											</div>
											<div>
												<h3 class="d-flex justify-content-center mt-3">RealHyukPL</h3>
											</div>
											<div class="flex">
												<ul
													class="list-inline count2 d-flex justify-content-between">
													<li><span class="badge badge-primary">Projects</span>
														<h3>8</h3></li>
													<li><span class="badge badge-danger">Likes</span>
														<h3>3</h3></li>
													<li><span class="badge badge-info">Tasks</span>
														<h3>83</h3></li>
												</ul>
											</div>
											<div class="p-1"
												style="height: 100px; background-color: #e5e5e5;">
												<p class="mt-2 mb-2">안녕하세요. 3팀 프로젝트 리더를 맡고있는 김진혁입니다. 저는
													java와 자바스크립트를 다룰줄압니다. 잘부탁드립니다.</p>
											</div>
											<div class="text-center mt-3">
												<button type="button" class="btn btn-success btn-sm">
													<i class="fa fa-pencil-square"> 권한</i>
												</button>
												<button type="button" class="btn btn-primary btn-sm">
													<i class="fa fa-user-times"> 제명</i>
												</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 프로필 상세 드롭다운 -->
							</div>
							<span>RealHyukPL</span>
						</div>
					</li>
					<li class="collabo-member nav-item dropdown open">
						<div class="d-flex flex-column">
							<span>PL</span><br /> <a href="javascript:;"
								class="collabo-member " aria-haspopup="true" id="navbarDropdown"
								data-toggle="dropdown" aria-expanded="false"> <img
								src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
								class="img-circle" alt="Avatar" />
							</a>
							<div class="dropdown-menu dropdown-membermenu pull-right"
								aria-labelledby="navbarDropdown">
								<!-- 프로필 상세 드롭다운 -->
								<div class="col-md-3   widget widget_tally_box">
									<div class="fixed_height_390">
										<div class="x_content">
											<div class="flex">
												<ul class="list-inline widget_profile_box">
													<li></li>
													<li class="d-flex justify-content-center"><img
														src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
														alt="..." class="img-circle profile_img"></li>
													<li></li>
												</ul>
											</div>
											<div>
												<h3 class="d-flex justify-content-center mt-3">RealHyukPL</h3>
											</div>
											<div class="flex">
												<ul
													class="list-inline count2 d-flex justify-content-between">
													<li><span class="badge badge-primary">Projects</span>
														<h3>8</h3></li>
													<li><span class="badge badge-danger">Likes</span>
														<h3>3</h3></li>
													<li><span class="badge badge-info">Tasks</span>
														<h3>83</h3></li>
												</ul>
											</div>
											<div class="p-1"
												style="height: 100px; background-color: #e5e5e5;">
												<p class="mt-2 mb-2">안녕하세요. 3팀 프로젝트 리더를 맡고있는 김진혁입니다. 저는
													java와 자바스크립트를 다룰줄압니다. 잘부탁드립니다.</p>
											</div>
											<div class="text-center mt-3">
												<button type="button" class="btn btn-success btn-sm">
													<i class="fa fa-pencil-square"> 권한</i>
												</button>
												<button type="button" class="btn btn-primary btn-sm">
													<i class="fa fa-user-times"> 제명</i>
												</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 프로필 상세 드롭다운 -->
							</div>
							<span>RealHyukPL</span>
						</div>
					</li>
					<li class="collabo-member nav-item dropdown">
						<div class="d-flex flex-column">
							<span>PL</span><br /> <a href="javascript:stopPropagation();"
								class="collabo-member " aria-haspopup="true" id="navbarDropdown"
								data-toggle="dropdown" aria-expanded="false"> <img
								src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
								class="img-circle" alt="Avatar" />
							</a>
							<div class="dropdown-menu dropdown-membermenu pull-right"
								aria-labelledby="navbarDropdown">
								<!-- 프로필 상세 드롭다운 -->
								<div class="col-md-3   widget widget_tally_box">
									<div class="fixed_height_390">
										<div class="x_content">
											<div class="flex">
												<ul class="list-inline widget_profile_box">
													<li></li>
													<li class="d-flex justify-content-center"><img
														src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
														alt="..." class="img-circle profile_img"></li>
													<li></li>
												</ul>
											</div>
											<div>
												<h3 class="d-flex justify-content-center mt-3">RealHyukPL</h3>
											</div>
											<div class="flex">
												<ul
													class="list-inline count2 d-flex justify-content-between">
													<li><span class="badge badge-primary">Projects</span>
														<h3>8</h3></li>
													<li><span class="badge badge-danger">Likes</span>
														<h3>3</h3></li>
													<li><span class="badge badge-info">Tasks</span>
														<h3>83</h3></li>
												</ul>
											</div>
											<div class="p-1"
												style="height: 100px; background-color: #e5e5e5;">
												<p class="mt-2 mb-2">안녕하세요. 3팀 프로젝트 리더를 맡고있는 김진혁입니다. 저는
													java와 자바스크립트를 다룰줄압니다. 잘부탁드립니다.</p>
											</div>
											<div class="text-center mt-3">
												<button type="button" class="btn btn-success btn-sm">
													<i class="fa fa-pencil-square"> 권한</i>
												</button>
												<button type="button" class="btn btn-primary btn-sm">
													<i class="fa fa-user-times"> 제명</i>
												</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 프로필 상세 드롭다운 -->
							</div>
							<span>RealHyukPL</span>
						</div>
					</li>
					<li class="collabo-member nav-item dropdown open">
						<div class="d-flex flex-column">
							<span>PL</span><br /> <a href="javascript:;"
								class="collabo-member " aria-haspopup="true" id="navbarDropdown"
								data-toggle="dropdown" aria-expanded="false"> <img
								src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
								class="img-circle" alt="Avatar" />
							</a>
							<div class="dropdown-menu dropdown-membermenu pull-right"
								aria-labelledby="navbarDropdown">
								<!-- 프로필 상세 드롭다운 -->
								<div class="col-md-3   widget widget_tally_box">
									<div class="fixed_height_390">
										<div class="x_content">
											<div class="flex">
												<ul class="list-inline widget_profile_box">
													<li></li>
													<li class="d-flex justify-content-center"><img
														src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
														alt="..." class="img-circle profile_img"></li>
													<li></li>
												</ul>
											</div>
											<div>
												<h3 class="d-flex justify-content-center mt-3">RealHyukPL</h3>
											</div>
											<div class="flex">
												<ul
													class="list-inline count2 d-flex justify-content-between">
													<li><span class="badge badge-primary">Projects</span>
														<h3>8</h3></li>
													<li><span class="badge badge-danger">Likes</span>
														<h3>3</h3></li>
													<li><span class="badge badge-info">Tasks</span>
														<h3>83</h3></li>
												</ul>
											</div>
											<div class="p-1"
												style="height: 100px; background-color: #e5e5e5;">
												<p class="mt-2 mb-2">안녕하세요. 3팀 프로젝트 리더를 맡고있는 김진혁입니다. 저는
													java와 자바스크립트를 다룰줄압니다. 잘부탁드립니다.</p>
											</div>
											<div class="text-center mt-3">
												<button type="button" class="btn btn-success btn-sm">
													<i class="fa fa-pencil-square"> 권한</i>
												</button>
												<button type="button" class="btn btn-primary btn-sm">
													<i class="fa fa-user-times"> 제명</i>
												</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 프로필 상세 드롭다운 -->
							</div>
							<span>RealHyukPL</span>
						</div>
					</li>

					<!-- 구성원 단위 끝 -->
					<!-- 구성원 더보기 버튼 시작 -->
					<li class="collabo-member d-flex align-items-center mr-3"><a
						href="../project/project-member-list.html"> <i
							class="fa fa-ellipsis-h fa-2x"></i>
					</a></li>
					<!-- 구성원 더보기 버튼 끝 -->
				</ul>
			</td>

		</div>
		<!-- 구성원 끝 -->
	</div>
</div>
<!-- 왼쪽 컬럼 끝 -->



<!-- 공지사항 등록 모달-->
<!-- Button to Open the Modal
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createCollabo">
      Open modal
    </button> -->
<div class="modal" id="collabo-notice-regist" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content-collabo">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title modalTitle">공지사항 등록</h4>
				<button type="button" class="close" data-dismiss="modal">
					&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="x_content">
					<!-- form start -->
					<form>
						<p>프로젝트 공지사항을 입력하는 공간입니다.</p>
						<p>프로젝트에는 하나의 공지사항만 등록할 수 있습니다.</p>
						<div class="card-body">
							<div class="form-group-collabo">
								<label for="notice_title_input">공지사항 제목</label> <input
									type="text" class="form-control-collabo" id="notice_title_input"
									placeholder="제목을 입력해주세요." />
							</div>
							<!-- textarea -->
							<div class="form-group-collabo">
								<label>공지사항 내용</label>
								<textarea class="form-control-collabo" rows="5" placeholder="내용을 입력해주세요"></textarea>
							</div>
						</div>
						<!-- /.card-body -->
						<button type="submit"
							class="btn btn-outline-primary collabo-submit-btn">보내기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 공지사항 등록 모달 끝-->

<!-- 프로젝트 구성원 추가 모달 시작-->
<div class="modal" id="collabo-member-add" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content-collabo">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title modalTitle">구성원 초대</h4>
				<button type="button" class="close" data-dismiss="modal">
					&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="x_content">
					<!-- form start -->
					<form>
						<p>프로젝트를 함께 할 구성원들을 초대해보세요.</p>
						<div class="card-body">
							<div class="form-group-collabo">
								<label for="exampleInputEmail1">이메일로 초대</label> <input
									type="email" class="form-groupcollabo" id="exampleInputEmail1"
									placeholder="상대방의 이메일을 입력하세요." />
							</div>
							<!-- select -->
							<div class="form-group-collabo">
								<label>접근 권한</label> <select class="form-control-collabo">
									<option value="" disabled selected hidden>접근 권한을 설정해
										주세요.</option>
									<option>Observer</option>
									<option>Cooperator</option>
									<option>Partner</option>
									<option>Collaborator</option>
								</select>
							</div>
							<!-- textarea -->
							<div class="form-group-collabo">
								<label>보낼 메세지</label>
								<textarea class="form-control-collabo" rows="3" placeholder="내용을 입력해주세요"></textarea>
							</div>
						</div>
						<!-- /.card-body -->
						<button type="submit"
							class="btn btn-outline-primary collabo-submit-btn">보내기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 프로젝트 구성원 제안 모달 끝-->

<!-- 프로젝트 수정 모달 시작-->
<div class="modal" id="collabo-modify" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content-collabo">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title modalTitle">프로젝트정보 수정</h4>
				<button type="button" class="close" data-dismiss="modal">
					&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="x_content">
					<!-- form start -->
					<form>
						<p>프로젝트 정보를 수정할 수 있습니다.</p>
						<div class="card-body">
							<div class="form-group-collabo">
								<label for="collabo-name-for-modify">프로젝트명</label> <input
									type="text" class="form-control-collabo" id="collabo-name-for-modify"
									value="남양(주) 사이트 유지보수" />
							</div>
							<!-- select -->
							<div class="form-group-collabo">
								<label>공개범위</label> <select class="form-control-collabo">
									<option value="" disabled selected hidden>공개범위을 설정해
										주세요.</option>
									<option>Public</option>
									<option selected>Private</option>
									<option>Protected</option>
								</select>
							</div>
							<!-- textarea -->
							<div class="form-group-collabo">
								<label>프로젝트 소개</label>
								<textarea class="form-control-collabo" rows="10"> 주식회사 남양의 사이트 유지보수를 진행하는 프로젝트 입니다. 프론트엔드와 백엔드 각각 3명씩 구성되어 있으며, 2022년 2월까지 프로젝트 마감 예정입니다. 모르는게 있으면 서로 물어보며 진행하는 팀 분위기를 만들어 갑니다.
                  </textarea>
							</div>
						</div>
						<!-- /.card-body -->
						<button type="submit"
							class="btn btn-outline-primary collabo-submit-btn">보내기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 프로젝트 수정 모달 끝-->

<!-- 구성원 권한부여 모달 시작-->
<div class="modal" id="collabo-member-modify" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content-collabo">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title modalTitle">구성원 권한부여</h4>
				<button type="button" class="close" data-dismiss="modal">
					&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="x_content">
					<!-- form start -->
					<form>
						<p>프로젝트 구성원의 권한을 변경할 수 있습니다.</p>
						<!-- 팀장 설정시 visible로 -->
						<p>팀장을 양도할 경우 현 프로젝트에서 팀장으로써의 모든 권한을 잃게 됩니다!</p>
						<!-- 팀장 설정시 visible로 -->
						<div class="card-body">
							<div class="xtitle">
								<div class="form-group-collabo">
									<p>유저명 : RealHyukPL</p>
								</div>
							</div>
							<!-- select -->
							<div class="form-group-collabo">
								<label>권한 : </label> <select class="form-control-collabo">
									<option value="" disabled selected hidden>변경할 권한을
										설정해주세요</option>
									<option>방문자</option>
									<option selected>팀원</option>
									<option>팀장</option>
								</select>
							</div>
						</div>
						<!-- /.card-body -->
						<button type="submit"
							class="btn btn-outline-primary collabo-submit-btn">확인</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 구성원 권한부여 모달 끝-->

<!-- 구성원 제명 모달 시작-->
<div class="modal" id="collabo-member-delete" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content-collabo">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title modalTitle">구성원 제명</h4>
				<!-- <h4 class="modal-title modalTitle">구성원 탈퇴</h4> -->
				<button type="button" class="close" data-dismiss="modal">
					&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="x_content">
					<!-- form start -->
					<form>
						<span class="font-weight-bold">정말로 해당 구성원을 제명하시겠습니까?</span>
						<p>*해당 구성원이 작성한 업무와 문서는 삭제되지 않습니다.</p>
						<div class="card-body">
							<div class="form-group-collabo">
								<p>유저명 : RealHyukPL</p>
							</div>
							<!-- textarea -->
							<div class="form-group-collabo">
								<label>제명 사유</label>
								<textarea class="form-control-collabo" rows="10"
									placeholder="제명 사유를 적어주세요."></textarea>
							</div>
							<!-- textarea -->
							<div class="form-group-collabo">
								<label for="collabo-member-delete">확인을 위해 "<strong
									class="text-danger">프로젝트 탈퇴</strong>" 를 입력해주세요.
								</label> <input type="text" class="form-control-collabo"
									id="collabo-member-delete"/>
							</div>

						</div>
						<!-- /.card-body -->
						<button type="submit"
							class="btn btn-outline-primary collabo-submit-btn">확인</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 구성원 제명 모달 끝-->