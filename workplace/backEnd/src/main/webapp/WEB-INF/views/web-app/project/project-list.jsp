<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
     <!-- page content -->
      <div class="right_col" role="main">
        <!-- 프로젝트 바디 시작 -->

          <div class="x_title">
            <h2><i class="fa fa-desktop"></i> 프로젝트 리스트</h2>
            <div class="clearfix"></div>
          </div>

          <div class="x_content">
            <div class="col-md-12">
					<div class="project-list row" id="project-list"></div>
        	</div><!-- x contents 끝-->
      </div>
    <!-- /page content -->

    <!-- The Modal -->
<div class="modal" id="createCollabo" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title modalTitle">프로젝트 생성</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>

      <!-- Modal body -->
      <div class="modal-body">

        <div class="x_content">
          <!-- form start -->
          <form>
            <p>프로젝트는 여러 사람들과 함께 작업을 효율적으로 같이 하기위한 공간입니다.</p>
            <p>프로젝트를 함께할 멤버를 초대해주세요.</p>
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
                  <option>게스트</option>
                  <option>팀원</option>
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
<!-- 콜라보 제안 모달 끝-->


<script id="projectCardTemplate" type="text/x-kendo-template">
	<div class="project-list card">
		<div class="card-body project-list">
			<div class="user-block mt-3 mb-3">
				<h2>
					<a href="<%= request.getContextPath() %>/app/project/main?projNo=#:projNo#"
						class="project-list-a">#:title#</a> <span
						class="badge badge-success float-right">#:status#</span>
				</h2>
			</div>
			<!-- /.user-block -->
			<div class="col-sm-8 text-truncate">#: xssPurify(intro)#</div>
			<div class="col-sm-4 text-right">
				<p>
					<span class="ml-3 rounded rounded-2" style="background:rgb(239,239,239);">마감일 : #:kendo.toString(enddate,"yyyy년 MM월 dd일")#</span>
				</p>
			</div>
			<div class="col-sm-8 row d-flex justify-content-evenly">
					<div><span><i class="fa fa fa-heart-o fa-lg"></i> #:likeCount#</span></div>
					<div class="ml-3 d-flex align-items-center"><h4 class="mb-0">
				#for (var i=0, len=tagNames.length; i<len; i++){#
						<span class="badge badge-success" onclick="sortingProjectByTag('#:tagNames[i]#');">#:tagNames[i]#</span>
				#}#
					</h4></div>
					<div class="d-flex justify-content-end"><span class="ml-3">갱신일 : #:kendo.toString((updatedate),"yyyy년 MM월 dd일")#</span></div>
			</div>
			<div class="col-sm-4 ml-3 text-right" style="height:50px">
					<ul class="list-inline" style="display: inline-flex">
				# for(var i=0, len=member.length; i<len; i++) { #
						# if(i < 5) { #
							<!-- 구성원 단위 시작 -->
							<li class="project-member nav-item dropdown open ml-3">
								<div class="d-flex flex-column">
									<a href="" class="project-member " aria-haspopup="true"
									id="navbarDropdown" data-toggle="dropdown"	aria-expanded="false">
										# if(member[i].picture == null){ #
										<img src="/resources/asserts/images/img.jpg" class="img-circle" alt="Avatar" />
										# } else { #
										<img src="/resources/asserts/images/#:member[i].picture#.jpg" class="img-circle" alt="Avatar" />
										# } #
									</a>
									<div class="dropdown-menu dropdown-membermenu pull-right" aria-labelledby="navbarDropdown">
									<div class="col-md-3   widget widget_tally_box">
										<div class="fixed_height_390">
											<div class="x_content">
												<div class="flex">
													<ul class="list-inline widget_profile_box">
														<li></li>
														<li class="d-flex justify-content-center">
															# if(member[i].picture == null){ #
															<img src="/resources/asserts/images/img.jpg" alt="" class="img-circle profile_img"></li>
															# } else { #
															<img src="/resources/asserts/images/#: member[i].picture #.jpg" alt="" class="img-circle profile_img"></li>
															# } #
														<li></li>
													</ul>
												</div>
												<div>
													<h3 class="d-flex justify-content-center mt-3">#: member[i].nickname #</h3>
												</div>
												<div class="flex">
													<ul	class="list-inline count2 d-flex justify-content-between">
													<li><span class="badge badge-primary">Projects</span>
														<h3>#: member[i].projectCount #</h3></li>
													<li><span class="badge badge-danger">Likes</span>
														<h3>#: member[i].likeCount #</h3></li>
													<li><span class="badge badge-info">Tasks</span>
														<h3>#: member[i].taskCount #</h3></li>
													</ul>
												</div>
												<div class="p-1"
													style="height: 100px; background-color: rgb(229,229,229)">
													<p class="mt-2 mb-2">#= member[i].intro #</p>
												</div>
											</div>
										</div>
									</div>
									</div>
								</div>
							</li>
						# } #
				# } #
					</ul>
			</div>
		</div>
	</div>
</script>
