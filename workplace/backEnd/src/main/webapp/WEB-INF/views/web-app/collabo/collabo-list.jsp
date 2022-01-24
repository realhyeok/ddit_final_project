<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- page content -->
<div class="right_col" role="main">
	<!-- 콜라보 프로젝트 바디 시작 -->
	<div class="x_panel">

		<div class="x_title">
			<h2>
				<img src="https://img.icons8.com/ios/30/000000/handshake--v2.png" />
				콜라보 프로젝트 리스트
			</h2>
			<div class="clearfix"></div>
		</div>

		<div class="x_content">

			<div class="col-md-12">
				<div class="row collabo-list-sort">
					<div class="col-md-2">
						<div class="dataTables_length" id="datatable-responsive_length">
							<select name="datatable-responsive_length"
								aria-controls="datatable-responsive"
								class="form-control input-sm">
								<option value="10">이름 순</option>
								<option value="25">상태 별</option>
								<option value="50">날짜 순</option>
							</select>

						</div>
					</div>
					<div class="col-md-3">
						<div id="datatable-responsive_filter" class="dataTables_filter">
							<input type="search" class="form-control input-sm"
								placeholder="검색어를 입력하세요" aria-controls="datatable-responsive">
						</div>
					</div>
					<div class="col-md-7">
						<div class="btn create-btn collabo-list-btn" data-toggle="modal"
							data-target="#createCollabo">
							<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
								fill="currentColor" class="bi bi-plus collabo-list"
								viewBox="0 0 16 16">
                      <path
									d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
									class="cQfklM" />
                    </svg>
						</div>
					</div>
				</div>


				<div class="tab-content">
					<div class="active tab-pane" id="activity">
						<div class="collabo-list card">
							<!-- Post -->
							<div class="card-body collabo-list">
								<div class="user-block">
									<h2>
										<a href="<%= request.getContextPath() %>/app/collabo/main" class="collabo-list-a">Sample 콜라보 프로젝트명</a>
										<button type="button"
											class="btn btn-default dropdown-toggle dropdown-toggle-split"
											data-toggle="dropdown" aria-expanded="false">
											<span class="sr-only">Toggle Dropdown</span>
										</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">하위 프로젝트1</a> <a
												class="dropdown-item" href="#">하위 프로젝트2</a>
										</div>

										<span class="badge badge-success float-right">상태 badge</span>
									</h2>
								</div>
								<!-- /.user-block -->
								<p class="overflow-auto">한줄 소개글 항목 글자 제한 있을 거임 아마도</p>
								<p>
									<span class="ml-3">Started day</span> <span class="ml-3">End
										day</span>
								</p>
								<div class="card-collabo d-flex justify-content-between">

									<div class="d-flex align-items-center">
										<span><img
											src="https://img.icons8.com/material-outlined/24/000000/like--v2.png" />177</span>
										<h4 class="mb-0">
											<span class="badge badge-success ml-3">카테고리 예시</span>
										</h4>
										<span class="ml-3">Updated date</span>
									</div>

									<div>

										<ul class="list-inline d-flex ">
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
										</ul>
									</div>
								</div>

								<!-- <p>
                            <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                            <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                            <span class="float-right">
  
                            </span>
                          </p> -->

							</div>
							<!-- /.post -->
						</div>

						<div class="collabo-list card">
							<!-- Post -->
							<div class="card-body collabo-list">
								<div class="user-block">
									<h2>
										<a href="" class="collabo-list-a">PMS Probada 프로젝트</a>
										<button type="button"
											class="btn btn-default dropdown-toggle dropdown-toggle-split"
											data-toggle="dropdown" aria-expanded="false">
											<span class="sr-only">Toggle Dropdown</span>
										</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">ganttCart 제작 프로젝트</a> <a
												class="dropdown-item" href="#">backend 개발 프로젝트</a>
										</div>
										<span class="badge badge-success float-right">진행 중</span>
									</h2>
								</div>
								<!-- /.user-block -->

								<p class="overflow-auto">기존 PMS 서비스에 콜라보 기능을 추가한 새로운 PMS 제작
								</p>
								<p>
									<span class="ml-3">21-12-16</span> <span class="ml-3">22-02-16</span>
								</p>
								<div class="card-collabo d-flex justify-content-between">

									<div class="d-flex align-items-center">
										<span><img
											src="https://img.icons8.com/material-outlined/24/000000/like--v2.png" />1</span>
										<h4 class="mb-0">
											<span class="badge badge-success ml-3">협업 툴</span>
										</h4>
										<span class="ml-3">22-01-15</span>
									</div>

									<div>

										<ul class="list-inline d-flex ">
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
										</ul>
									</div>
								</div>

								<!-- <p>
                            <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                            <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                            <span class="float-right">
  
                            </span>
                          </p> -->

							</div>
							<!-- /.post -->
						</div>

						<div class="collabo-list card">
							<!-- Post -->
							<div class="card-body collabo-list">
								<div class="user-block">
									<h2>
										<a href="" class="collabo-list-a">전기차 프로젝트</a>
										<button type="button"
											class="btn btn-default dropdown-toggle dropdown-toggle-split"
											data-toggle="dropdown" aria-expanded="false">
											<span class="sr-only">Toggle Dropdown</span>
										</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#">현대 자동차 전기차 주행성능 개선 프로젝트</a>
											<a class="dropdown-item" href="#">엘지화학 배터리 성능 개선 프로젝트</a>
										</div>
										<span class="badge badge-danger float-right">중단</span>
									</h2>
								</div>
								<!-- /.user-block -->
								<p class="overflow-auto">현대 자동차와 엘지 화학의 협력으로 주행 거리 및 배터리 성능을
									개선한 전기차 개발 프로젝트</p>
								<p>
									<span class="ml-3">2021-04-25</span><span class="ml-3">22-05-19</span>
								</p>
								<div class="card-collabo d-flex justify-content-between">

									<div class="d-flex align-items-center">
										<span><img
											src="https://img.icons8.com/material-outlined/24/000000/like--v2.png" />177</span>
										<h4 class="mb-0">
											<span class="badge badge-success ml-3">자동차</span>
										</h4>
										<span class="ml-3">22-01-15</span>
									</div>

									<div>

										<ul class="list-inline d-flex ">
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
											<li><img src="images/user.png" class="avatar" alt="">
											</li>
										</ul>
									</div>
								</div>

								<!-- <p>
                            <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                            <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                            <span class="float-right">
  
                            </span>
                          </p> -->

							</div>
							<!-- /.post -->
						</div>
					</div>

					<div class="collabo-list card">

						<!-- Post -->
						<div class="card-body collabo-list">
							<div class="user-block">
								<h2>
									<a href="" class="collabo-list-a">전기차 프로젝트</a>
									<button type="button"
										class="btn btn-default dropdown-toggle dropdown-toggle-split"
										data-toggle="dropdown" aria-expanded="false">
										<span class="sr-only">Toggle Dropdown</span>
									</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">현대 자동차 전기차 주행성능 개선 프로젝트</a>
										<a class="dropdown-item" href="#">엘지화학 배터리 성능 개선 프로젝트</a>
									</div>
									<span class="badge badge-warning float-right">지연</span>
								</h2>
							</div>
							<!-- /.user-block -->

							<p class="overflow-auto">현대 자동차와 엘지 화학의 협력으로 주행 거리 및 배터리 성능을
								개선한 전기차 개발 프로젝트</p>
							<p>
								<span class="ml-3">2021-04-25</span><span class="ml-3">22-05-19</span>
							</p>
							<div class="card-collabo d-flex justify-content-between">

								<div class="d-flex align-items-center">
									<span><img
										src="https://img.icons8.com/material-outlined/24/000000/like--v2.png" />177</span>
									<h4 class="mb-0">
										<span class="badge badge-success ml-3">자동차</span>
									</h4>
									<span class="ml-3">22-01-15</span>
								</div>

								<div>

									<ul class="list-inline d-flex ">
										<li><img src="images/user.png" class="avatar" alt="">
										</li>
										<li><img src="images/user.png" class="avatar" alt="">
										</li>
										<li><img src="images/user.png" class="avatar" alt="">
										</li>
										<li><img src="images/user.png" class="avatar" alt="">
										</li>
									</ul>
								</div>
							</div>

							<!-- <p>
                            <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                            <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                            <span class="float-right">
  
                            </span>
                          </p> -->

						</div>
						<!-- /.post -->
					</div>
				</div>
				<!-- /.tab-pane -->



			</div>
			<!-- /.tab-content -->


		</div>
		<!-- col-md-12 끝-->


	</div>
	<!-- x contents 끝-->

</div>
<!-- 프로젝트 바디 끝 -->