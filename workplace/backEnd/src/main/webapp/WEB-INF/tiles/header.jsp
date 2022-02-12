<%@page import="com.probada.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 석기현 테스트 -->

  <style>html { font-size: 14px; font-family: Arial, Helvetica, sans-serif; }
  
  
  /* 프로젝트 입력 창 */
     /* 자동 완성창 덮는 것 */
     .autocomplete-items {
      position: absolute;
      border: 1px solid #d4d4d4;
      border-bottom: none;
      border-top: none;
      z-index: 99;
      /*position the autocomplete items to be the same width as the container:*/
      top: 100%;
      left: 0;
      right: 0;
    }

    /* 자동 완성창 CSS */
    .autocomplete-items div {
      padding: 10px;
      cursor: pointer;
      background-color: #fff;
      border-bottom: 1px solid #d4d4d4;
    }

    /* 자동 완성창 hover*/
    .autocomplete-items div:hover {
      background-color: #e9e9e9;
    }

    /*when navigating through the items using the arrow keys:*/
    .autocomplete-active {
      background-color: DodgerBlue !important;
      color: #ffffff;
    }
  
  
  

  
  </style>


<!-- 석기현 테스트 -->



<!-- 변수 선언 시작 -->
<c:set var="nickname" value="${userVO.nickname}"/>
<c:set var="userId" value="${userVO.userId}"/>
<c:set var="userPicture" value="${userVO.picture}"/>

<!-- 변수 선언 끝 -->

<!DOCTYPE html>
<html>
<head>
</head>
<body>
  <body class="nav-sm">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col menu_fixed">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="<%=request.getContextPath() %>/app/index" class="site_title"><img src="https://img.icons8.com/ios-filled/30/3598db/lighthouse.png"/> <span> <small>prodaba</small> </span></a>
            </div>

            <div class="clearfix"></div>


            <br />

 <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <ul class="nav side-menu">
                  <li><a href="<%=request.getContextPath() %>/app/index"><i class="fa fa-home"></i> 홈</a>
                  </li>
                  <li><a id="myWorkMenu" href="<%=request.getContextPath()%>/app/myWork"><i class="fa fa-edit"></i> 내 작업 </a>
                  </li>
                  <li><a href="<%=request.getContextPath()%>/app/project-list"><i class="fa fa-desktop"></i> 프로젝트</a>
                  </li>
                  <li><a id="OwnCollabo" href="<%=request.getContextPath()%>/app/collabo-none"><i class="fa fa-group"></i> 콜라보</a>
                  </li>
                  <!-- <li><a href="javascript:meeting_newteb();"><i class="fa fa-video-camera"></i> 온라인 회의</a>
                  </li> -->
                  <li><a href="javascript:getOverlayTemplateChatList('chatTemplate');"><i class="fa fa-comments-o"></i> 채팅</a>
                  </li>
                </ul>
              </div>

              <div class="menu_section">
                <h3>내 프로젝트</h3>
                <ul class="nav side-menu">
                  <!-- <li><a><i class="fa fa-bug"></i> 개인 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu user_task_list">
                      리스트 추가
                      alertIndex.js의 showAsideBarList() 메서드가 처리중..
                    </ul>
                  </li> -->
                  <li><a><i class="fa fa-windows"></i> 그룹 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu user_project_list">
                      <!-- 리스트 추가 -->
                     <!-- alertIndex.js의 showAsideBarList() 메서드가 처리중.. -->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> 콜라보 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu user_collabo_list">
                        <!-- alertIndex.js의 showAsideBarList() 메서드가 처리중.. -->
                    </ul>
                  </li>
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="알림설정">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="유료 구독" href="<%=request.getContextPath()%>/app/pricing">
                <span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="로그아웃" href="<%=request.getContextPath()%>/logout.do" id="logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <div class="nav toggle">
                  <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>
                <nav class="nav navbar-nav">



			<ul class=" navbar-right">

				<div class="search-box">
					<button class="btn-search">
						<i class="fa fa-search"></i>
					</button>
					<input type="text" class="input-search" placeholder="프로젝트명 또는 닉네임을 입력해주세요...">
				</div>

				<!--begin: Quick Actions -->
                  <!-- 퀵 버튼 -->
                  <div class="kt-header__topbar-item dropdown open">
                    <div class="kt-header__topbar-wrapper" data-toggle="dropdown" data-offset="30px,0px" aria-expanded="true">
                        <span class="kt-header__topbar-icon">
                          <i class="fa fa-rocket kt-svg-icon"></i>
                        </span>
                    </div>
                    <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-top-unround dropdown-menu-xl open" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-306px, 64px, 0px);">
                        <!--begin: Head -->
                        <div class="kt-head kt-head--skin-dark" style="background-image: url(http://pms.projectpoint.co.kr/assets/metronic6.1.8/media/misc/bg-1.jpg)">
                            <h4 class="kt-head__title">
                                User Quick Actions
                            </h4>
                        </div>
                        <!--end: Head -->
                        <!--begin: Grid Nav -->
                        <div class="kt-grid-nav kt-grid-nav--skin-light">
                            <div class="kt-grid-nav__row">
                                <a href="<%=request.getContextPath() %>/app/project" class="kt-grid-nav__item">
                                    <span class="kt-grid-nav__icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon kt-svg-icon--info kt-svg-icon--lg">
                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                <rect id="bound" x="0" y="0" width="24" height="24"></rect>
                                                <path d="M4,9.67471899 L10.880262,13.6470401 C10.9543486,13.689814 11.0320333,13.7207107 11.1111111,13.740321 L11.1111111,21.4444444 L4.49070127,17.526473 C4.18655139,17.3464765 4,17.0193034 4,16.6658832 L4,9.67471899 Z M20,9.56911707 L20,16.6658832 C20,17.0193034 19.8134486,17.3464765 19.5092987,17.526473 L12.8888889,21.4444444 L12.8888889,13.6728275 C12.9050191,13.6647696 12.9210067,13.6561758 12.9368301,13.6470401 L20,9.56911707 Z" id="Combined-Shape" fill="#000000"></path>
                                                <path d="M4.21611835,7.74669402 C4.30015839,7.64056877 4.40623188,7.55087574 4.5299008,7.48500698 L11.5299008,3.75665466 C11.8237589,3.60013944 12.1762411,3.60013944 12.4700992,3.75665466 L19.4700992,7.48500698 C19.5654307,7.53578262 19.6503066,7.60071528 19.7226939,7.67641889 L12.0479413,12.1074394 C11.9974761,12.1365754 11.9509488,12.1699127 11.9085461,12.2067543 C11.8661433,12.1699127 11.819616,12.1365754 11.7691509,12.1074394 L4.21611835,7.74669402 Z" id="Path" fill="#000000" opacity="0.3"></path>
                                            </g>
                                        </svg>
                                    </span>
                                    <span class="kt-grid-nav__title">Projects</span>
                                    <span class="kt-grid-nav__desc">프로젝트 등록</span>
                                </a>
                                <a href="<%=request.getContextPath() %>/app/myWork/issueRegistForm	" class="kt-grid-nav__item">
                                    <span class="kt-grid-nav__icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon kt-svg-icon--info kt-svg-icon--lg">
                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                <rect id="bound" x="0" y="0" width="24" height="24"></rect>
                                                <path d="M12,2 L12,2 C15.3137085,2 18,4.6862915 18,8 L18,16 C18,16.5522847 17.5522847,17 17,17 L7,17 C6.44771525,17 6,16.5522847 6,16 L6,8 C6,4.6862915 8.6862915,2 12,2 Z" id="Rectangle-115" fill="#000000"></path>
                                                <path d="M10.5,19 L13.5,19 L13.5,21.5 C13.5,22.3284271 12.8284271,23 12,23 L12,23 C11.1715729,23 10.5,22.3284271 10.5,21.5 L10.5,19 Z" id="Rectangle" fill="#000000" opacity="0.3"></path>
                                            </g>
                                        </svg>
                                    </span>
                                    <span class="kt-grid-nav__title">Issue</span>
                                    <span class="kt-grid-nav__desc">이슈 등록</span>
                                </a>
                            </div>
                            <div class="kt-grid-nav__row">
                                <a href="<%=request.getContextPath() %>/app/myWork" class="kt-grid-nav__item">
                                    <span class="kt-grid-nav__icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon kt-svg-icon--info kt-svg-icon--lg">
                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                <polygon id="Shape" points="0 0 24 0 24 24 0 24"></polygon>
                                                <path d="M5.85714286,2 L13.7364114,2 C14.0910962,2 14.4343066,2.12568431 14.7051108,2.35473959 L19.4686994,6.3839416 C19.8056532,6.66894833 20,7.08787823 20,7.52920201 L20,20.0833333 C20,21.8738751 19.9795521,22 18.1428571,22 L5.85714286,22 C4.02044787,22 4,21.8738751 4,20.0833333 L4,3.91666667 C4,2.12612489 4.02044787,2 5.85714286,2 Z" id="Combined-Shape" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                                <rect id="Rectangle" fill="#000000" x="6" y="11" width="9" height="2" rx="1"></rect>
                                                <rect id="Rectangle-Copy" fill="#000000" x="6" y="15" width="5" height="2" rx="1"></rect>
                                            </g>
                                        </svg>
                                    </span>
                                    <span class="kt-grid-nav__title">Document</span>
                                    <span class="kt-grid-nav__desc">업무 등록</span>
                                </a>
                                <a href="<%=request.getContextPath() %>/app/myWork/mailRegistForm" class="kt-grid-nav__item">
                                    <span class="kt-grid-nav__icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" class="bi bi-envelope kt-svg-icon kt-svg-icon--info kt-svg-icon--lg" viewBox="0 0 16 16" version="1.1" style="width: 32px; height: 32px;">
                                          <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z" id="Combined-Shape" fill="#000000"/>
                                            <!-- <rect id="Rectangle-23" fill="#000000" opacity="0.3" x="10" y="16" width="4" height="4" rx="2"></rect> -->
                                          </g>
                                        </svg>
                                    </span>
                                    <span class="kt-grid-nav__title">Mail</span>
                                    <span class="kt-grid-nav__desc">메일 등록</span>
                                </a>
                            </div>
                        </div>
                        <!--end: Grid Nav -->
                    </div>
                </div>
                <!--end: Quick Actions -->
                <!-- 퀵 버튼 끝 -->

				<!-- 알림 리스트 시작 -->
				<li role="presentation" class="nav-item dropdown open" style="margin-left: 15px;">
                    <a href="javascript:;" class="dropdown-toggle info-number" id="navbarDropdown1" data-toggle="dropdown" aria-expanded="false">
                      <i class="fa fa-envelope-o"></i>
                      <span class="badge bg-green">6</span>
                    </a>
                    <ul class="dropdown-menu list-unstyled msg_list" role="menu" aria-labelledby="navbarDropdown1" id="alertVOList">
                    
                  <%--   이거 없어도 잘돌아감
                  <c:choose>
                    	<c:when test="${empty alertList }">
                    		<!-- <li class="nav-item">
                    			<strong>해당 내용이 없습니다.</strong>
                    		</li> -->
                    	</c:when>
                    	<c:otherwise>
                    		 <c:forEach items="${alertList }" var="alert">
                      			<li class="nav-item" >
	                        		<a class="dropdown-item">
			                          <span class="image"><img src="/resources/asserts/images/img.jpg" alt="Profile Image" /></span>
			                          <span>
			                            <span>${alert.nickname}</span>
			                            <span class="time">${alert.writeTimeDisplay}</span>
			                          </span>
			                          <span class="message">
			                            ${alert.content }
			                          </span>
			                        </a>
		                        </li>
		                    </c:forEach>
                    	</c:otherwise>
	                  
                    </c:choose> 
                    --%>
                      
                    <!--   알림 상세보기 // 구현 계획에 미포함
                    <li class="nav-item">
                        <div class="text-center">
                          <a class="dropdown-item">
                            <strong>See All Alerts</strong>
                            <i class="fa fa-angle-right"></i>
                          </a>
                        </div>
                      </li> 
                      -->
                      
                    </ul>
                  </li>
                  <!-- 알림 리스트 끝 -->

						<li class="nav-item dropdown open" style="padding: 0px 15px;">
                    <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                      <img src="<%=request.getContextPath()%>/user/getPictureById?userId=${userVO.userId}" alt="">${nickname }
                    </a>
                    <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item"  href="<%=request.getContextPath()%>/user/my-page"> 프로필</a>
                      <a class="dropdown-item"  href="#" data-toggle="modal" data-target="#alarmModal"><span>알림설정</span></a>
                      <a class="dropdown-item"  href="javascript:;" id="doingTest">FAQ</a>
                      <a class="dropdown-item" href="<%=request.getContextPath()%>/logout.do" id="logout"><i class="fa fa-sign-out pull-right"></i> 로그아웃</a>
                    </div>
                  </li>


                </ul>
              </nav>
            </div>
          </div>
        <!-- /top navigation -->
        
        



        
        
 <!-- 채팅 모달 테스트 -->       
        
        
        
</body>
</html>
