<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!-- page content -->
  <div class="right_col" role="main">
    <!-- 콜라보 프로젝트 바디 시작 -->
	
	
	
    <div class="x_title">
      <h2>
        <img src="https://img.icons8.com/ios/30/000000/handshake--v2.png" />
        				콜라보 프로젝트 리스트
      </h2>
      <div class="clearfix"></div>
    </div>

    <div class="x_content">
      <div class="col-md-12">
        <!-- sort 기능(아직 미구현)-->
			<div class="collabo-list" id="collabo-list"></div>

          </div><!-- /.tab-pane -->
        </div><!-- /.tab-content -->
      </div><!-- col-md-12 끝-->


    <!-- The Modal -->
    <div class="modal" id="createCollabo" data-backdrop="static">
      <div class="modal-dialog">
        <div class="modal-content-collabo">

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
                  <div class="form-group-collabo">
                    <label for="exampleInputEmail1">이메일로 초대</label>
                    <input type="email" class="form-control-collabo" id="exampleInputEmail1" placeholder="상대방의 이메일을 입력하세요.">
                  </div>
                  <!-- select -->
                  <div class="form-group-collabo">
                    <label>접근 권한</label>
                    <select class="form-control-collabo">
                      <option value="" disabled selected hidden>접근 권한을 설정해 주세요.</option>
                      <option>게스트</option>
                      <option>팀원</option>
                    </select>
                  </div>
                  <!-- textarea -->
                  <div class="form-group-collabo">
                    <label>보낼 메세지</label>
                    <textarea class="form-control-collabo" rows="3" placeholder="Enter ..."></textarea>
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


    <script id="collaboCardTemplate" type="text/x-kendo-template">
        <div class="collabo-list card">
          <div class="card-body collabo-list">
            <div class="user-block mt-3 mb-3">
              <h2>
                <a href="<%= request.getContextPath() %>/app/collabo/main?cprojNo=#:cprojNo#"
                  class="collabo-list-a">#:title#</a> <span
                  class="badge badge-success float-right">#:status#</span>
              </h2>
            </div>
            <!-- /.user-block -->
            <div class="text-truncate">#:xssPurify(intro)#</div>
			<div class="col-sm-4 text-right">
            <p>
              <span class="ml-3">시작일 : #:kendo.toString(startdate,"yyyy년 MM월 dd일")#</span>
              <span class="ml-3">마감일 : #:kendo.toString(enddate,"yyyy년 MM월 dd일")#</span>
            </p>
			</div>
            <div class="card-collabo mb-3 d-flex justify-content-evenly">
                <div><span><i class="fa fa fa-heart-o fa-lg"></i> #:likeCount#</span></div>
                <div class="ml-3 d-flex align-items-center"><h4 class="mb-0">
                  <span class="badge badge-success">1</span>
                </h4></div>
                <div class="d-flex justify-content-end"><span class="ml-3">갱신일 : #:kendo.toString((updatedate),"yyyy년 MM월 dd일")#</span></div>
            </div>
          </div>
        </div>
		
    </script>