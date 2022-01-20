<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
     <!-- page content -->
      <div class="right_col" role="main">
        <!-- 프로젝트 바디 시작 -->
        <div class="x_panel">

          <div class="x_title">
            <h2><i class="fa fa-desktop"></i> 프로젝트 리스트</h2>
            <div class="clearfix"></div>
          </div>

          <div class="x_content">

            <div class="col-md-12">
              <div class="row project-list-sort">
                <div class="col-md-2">
                  <div class="dataTables_length" id="datatable-responsive_length">
                    <select name="datatable-responsive_length" aria-controls="datatable-responsive"
                      class="form-control input-sm">
                      <option value="10">이름 순</option>
                      <option value="25">상태 별</option>
                      <option value="50">날짜 순</option>
                    </select>

                  </div>
                </div>
                <div class="col-md-3">
                  <div id="datatable-responsive_filter" class="dataTables_filter">
                    <input type="search" class="form-control input-sm" placeholder="검색어를 입력하세요"
                      aria-controls="datatable-responsive">
                  </div>
                </div>
                <div class="col-md-7">
                  <div class="btn create-btn project-list-btn" data-toggle="modal" data-target="#createCollabo">
                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                      class="bi bi-plus project-list" viewBox="0 0 16 16">
                      <path
                        d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
                        class="cQfklM" />
                    </svg>
                  </div>
                </div>
              </div>


              <div class="tab-content">
                <div class="active tab-pane" id="activity">
					<div class="project-list row" id="project-list"></div>
              <!-- /.tab-pane -->
            </div><!-- /.tab-content -->
          </div><!-- col-md-12 끝-->
        </div><!-- x contents 끝-->
      </div>
      <!-- 프로젝트 바디 끝 -->
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


<script id="project-card-template" type="text/x-kendo-template">
                  <div class="project-list card">
                    <!-- Post -->
                    <div class="card-body project-list">
                      <div class="user-block mt-3 mb-3">
                        <h2><a href="<%= request.getContextPath() %>/app/project/main?no=" class="project-list-a">#:title#</a>
                          <span class="badge badge-success float-right">#:status#</span>
                        </h2>
                      </div>
                      <!-- /.user-block -->
                      <p class="overflow-auto">안녕</p>
                      <p><span class="ml-3">#:startdate#</span> <span class="ml-3">#:endDate#</span></p>
                      <div class="card-collabo d-flex justify-content-between">

                        <div class="d-flex align-items-center">
                          <span><i class="fa fa fa-heart-o fa-lg"></i> 177</span>
                          <h4 class="mb-0"><span class="badge badge-success ml-3">카테고리 예시</span></h4>
                          <span class="ml-3">#:updatedate#</span>
                        </div>
                        <div>
                          <ul class="list-inline d-flex ">
                            <li>
                              <img src="images/user.png" class="avatar" alt="">
                            </li>
                            <li>
                              <img src="images/user.png" class="avatar" alt="">
                            </li>
                            <li>
                              <img src="images/user.png" class="avatar" alt="">
                            </li>
                            <li>
                              <img src="images/user.png" class="avatar" alt="">
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <!-- /.post -->
                  </div>
</script>
