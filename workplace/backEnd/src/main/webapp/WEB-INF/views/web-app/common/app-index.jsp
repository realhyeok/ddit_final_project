<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 변수 선언 시작 -->
<c:set var="dataUsage" value="${userVO.userUploadUsage/userMaxUploadCapacity*100}"/>
<c:choose>
	<c:when test="${userVO.userUploadUsage >= 1000}">
		<c:set var="dataType" value="GB"/>
		<fmt:formatNumber var="dataValue" value="${userVO.userUploadUsage/1000}" pattern="#.#"/>
	</c:when>
	<c:otherwise>
		<c:set var="dataType" value="MB"/>
		<c:set var="dataValue" value="${userVO.userUploadUsage}"/>
	</c:otherwise>
</c:choose>
<!-- 변수 선언 끝 -->

<!-- page content -->
<div class="right_col" role="main">

  <div class="clearfix"></div>

  <div class="row">
    <div class="col-md-12 col-sm-12">

      <!-- dashboard-stat start -->
      <div class="row">

        <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">

          <div class="dashboard-stat bordered grey-cararra fadeInDown animated">
            <div class="visual">
              <i class="fa fa-tasks"></i>
            </div>
            <div class="details">
              <h3 style="color:#5C9BD1;">21<small class="font-blue-sharp"></small></h3>
              <div class="noti-desc"> 내 작업 </div>
            </div>
            <a class="more" href="/ToDoList">
              View More <i class="fa fa-arrow-right"></i>
            </a>
          </div>

        </div>

        <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">

          <div class="dashboard-stat bordered grey-cararra fadeInDown animated">
            <div class="visual">
              <i class="fa fa-thumb-tack"></i>
            </div>
            <div class="details">
              <h3 style="color:#8877a9;">10 <small class="font-purple-soft"></small></h3>
              <div class="noti-desc"> 이슈 </div>
            </div>
            <a class="more" href="/Issue">
              View More <i class="fa fa-arrow-right"></i>
            </a>
          </div>

        </div>

        <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">

          <div class="dashboard-stat bordered grey-cararra fadeInDown animated">
            <div class="visual">
              <i class="fa fa-pencil-square"></i>
            </div>
            <div class="details">
              <h3 style="color:#4DB3A2;">0 <small class="font-green-sharp"></small></h3>
              <div class="noti-desc">

                변경요청
              </div>
            </div>
            <a class="more" href="/ProjectChangeRequest">
              View More <i class="fa fa-arrow-right"></i>
            </a>
          </div>

        </div>

        <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">

          <div class="dashboard-stat bordered grey-cararra fadeInDown animated">
            <div class="visual">
              <i class="fa fa-send"></i>
            </div>
            <div class="details">
              <h3 style="color:#f36a5a;">
                <span title="보낸 요청">8</span>
              </h3>
              <div class="noti-desc">

                메일
              </div>
            </div>
            <a class="more" href="/ProjectApproval">
              View More <i class="fa fa-arrow-right"></i>
            </a>
          </div>

        </div>

        <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">

          <div class="dashboard-stat bordered grey-cararra fadeInDown animated">
            <div class="visual">
              <i class="fa fa-group"></i>
            </div>
            <div class="details">
              <h3 style="color:#bfd042;">
                <span title="받은 요청">0</span>
              </h3>
              <div class="noti-desc">
                콜라보
              </div>
            </div>
            <a class="more" href="/File">
              View More <i class="fa fa-arrow-right"></i>
            </a>
          </div>

        </div>

        <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">

          <div class="dashboard-stat bordered grey-cararra fadeInDown animated">
            <div class="visual">
              <i class="fa fa-laptop"></i>
            </div>
            <div class="details">
              <h3 style="color:#5e738b;">
                <span title="보낸 요청">35</span>
              </h3>
              <div class="noti-desc">
                프로젝트
              </div>
            </div>
            <a class="more" href="/ProjectCenter">
              View More <i class="fa fa-arrow-right"></i>
            </a>
          </div>

        </div>



      </div>
      <!-- dashboard-stat end -->

      <!-- dashboard-table start -->
      <div class="row">
        <!-- dashboard-table left start -->
        <div class="col-md-6 col-sm-6">
          <div class="x_panel_origin">
            <div class="x_title">
              <h2>내 업무 </h2>
              <span style="float: right;"> <a href="#">more</a> </span>
              <div class="clearfix"></div>
            </div>
            <div class="x_content">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>업무</th>
                    <th>프로젝트</th>
                    <th>상태</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">러시아 고공낙하 장비 설계</th>
                    <td>한미 지상 훈련 프로젝트</td>
                    <td>진행중</td>
                  </tr>
                  <tr>
                    <th scope="row">매뚜기 수집</th>
                    <td>대전 생물 연구 프로젝트</td>
                    <td>진행중</td>
                  </tr>
                  <tr>
                    <th scope="row">모코코 수집 지도 작성</th>
                    <td>코코모를 위한 지침서</td>
                    <td>완료</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- dashboard-table left end -->
      
        <!-- dashboard-table right start -->
        <div class="col-md-6 col-sm-6">
          <div class="x_panel_origin">
            <div class="x_title">
              <h2>최근 작성한 문서</h2>
      
              <span style="float: right;"> <a href="#">more</a> </span>
              <div class="clearfix"></div>
            </div>
            <div class="x_content">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>업무</th>
                    <th>프로젝트</th>
                    <th>상태</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- dashboard-table right end -->
      </div>
      <!-- 그래프 row start -->
      <div class="row">
        <div class="col-md-3 widget widget_tally_box x_panel_origin widget_data">
          <div class="ui-ribbon-container" style="height: 440px;">
            <div class="x_title">
              <h2>데이터</h2>
              <div class="clearfix"></div>
            </div>
            <div class="x_content">
      
              <div style="text-align: center; margin-bottom: 17px">
                <span class="chart" data-percent="${dataUsage }">
                  <span class="percent"></span>
                </span>
              </div>
      
              <h3 class="name_title">데이터 사용량</h3>
              <div class="divider"></div>
      
              <p>
                <br/><br/> 해당 계정에서 사용할 수 있는 총 데이터 사용량을 표시합니다. <br/><br/>
                	현재 <strong>${userVO.nickname}</strong>님은 ${userMaxUploadCapacity}${dataType }중, <br/><strong>${dataValue}${dataType }</strong>를 사용중입니다. <br/><br/> 구독 서비스를 원하시면 <br/> <a href="" style="color: #5C9BD1;">여기</a>를 클릭해주세요.
              </p>
      
            </div>
          </div>
        </div>
        <div class="col-md-9 col-sm-8">
          <!-- 그래프 작업 바디 시작 -->
          <div class="x_panel_origin">
            <div class="x_title">
              <h2> 월별 프로젝트 진행상태 그래프</h2>
              <div class="clearfix"></div>
            </div>
            <div class="x_content">
              <!-- STACKED BAR CHART -->
              <div>
                <canvas id="custom_barChart"></canvas>
              </div>
              <!-- /.card -->
            </div>
          </div>
          <!-- 그래프 작업 바디 끝 -->
        </div>
      </div>
      <!-- 그래프 row end -->

      <!-- dashboard-table center start -->
      <div class="col-md-12 col-sm-12 p-0">
        <div class="x_panel_origin">
          <div class="x_title">
            <h2>참여 프로젝트</h2>
            <span style="float: right;"> <a href="#">more</a> </span>
            <div class="clearfix"></div>
          </div>
          <div class="x_content">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                  <td>Larry</td>
                  <td>the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>

          </div>
        </div>
      </div>
      <!-- dashboard-table center end -->
    </div>
  </div>

</div>
<!-- /page content -->