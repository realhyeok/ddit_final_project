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