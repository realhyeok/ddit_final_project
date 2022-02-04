<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <!-- page content -->
      <div class="right_col" role="main">
        <!-- 프로젝트 바디 시작 -->
        <div class="x_panel">

          <div class="x_title">
            <h2><img src="https://img.icons8.com/ios/30/000000/handshake--v2.png" /> 콜라보 프로젝트</h2>
            <div class="clearfix"></div>
          </div>

          <div class="x_content">

            <div class="tab-content" id="myTabContent">
              <div class="container body">
                <div class="main_container">
                  <!-- page content -->
                  <div class="col-md-12">
                    <div class="col-middle">
                      <div class="d-flex justify-content-center">
                        <img src="https://img.icons8.com/color/150/000000/teamwork--v1.png"/>
                      </div>
                      <br>
                      <p class="text-center">콜라보 하고 싶은 다양한 프로젝트 및 유저들을 검색해보세요.</p>

                      <style>
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
                      
                      <!-- search 시작 -->
                      <div class="flex-column">
                        <!-- search-bar 시작-->
                        <div class="mid_center d-flex justify-content-center">
                          <div class="collabo search-box">

                            <form autocomplete="off" action="/action_page.php">
                              <button class="btn-search">
                                <i class="fa fa-search"></i>
                              </button>
                              <input type="text" class="input-search collabo" id="myInput" placeholder="프로젝트명 또는 닉네임을 입력해주세요...">
                            </form>
                          </div>

                        </div>
                        <!-- search-bar 끝-->
                      </div>


                      <!-- carousel 시작 -->
                      <div class="row">
                        <!-- 프로젝트 추천 carousel-->
                        <div id="demo" class="carousel slide col-md-6" data-ride="carousel" data-interval="false">
                          <!-- Indicators -->
                          <!-- <ul class="carousel-indicators">
                            <li data-target="#demo" data-slide-to="0" class="active"></li>
                            <li data-target="#demo" data-slide-to="1"></li>
                            <li data-target="#demo" data-slide-to="2"></li>
                            <li data-target="#demo" data-slide-to="3"></li>
                            <li data-target="#demo" data-slide-to="4"></li>
                          </ul> -->
                          <!-- The slideshow -->
                          <div class="carousel-inner">
                            <div class="carousel-item active">

                              <div class="card">
                                <div class="card-body coll-none">
                                  <h5 class="card-title"><a href="#" class="spoonCard">Sample 추천 프로젝트명</a></h5>
                                  <p>프로젝트 한 줄 소개 위치 할 곳</p>
                                  
                                  <div class="card-collabo d-flex justify-content-between">

                                    <div class="d-flex align-items-center">
                                      <span><img
                                          src="https://img.icons8.com/material-outlined/24/000000/like--v2.png" />177</span>
                                      <h4 class="mb-0"><span class="badge badge-success ml-3">카테고리 예시</span></h4>
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
                              </div>

                            </div>
                            <div class="carousel-item">

                              <div class="card">
                                <div class="card-body coll-none">
                                  <h5 class="card-title"><a href="#" class="spoonCard">Probada 프로젝트</a></h5>
                                  <p>리얼혁과 함께하는 즐거운 프로젝트!</p>

                                  <div class="card-collabo d-flex flex-column">
                                    <ul class="list-inline">
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

                                  <div class="d-flex align-items-center">
                                    <span><img
                                        src="https://img.icons8.com/material-outlined/24/000000/like--v2.png" />180</span>
                                    <h4 class="mb-0"><span class="badge badge-success ml-3">java</span></h4>
                                  </div>
                                </div>
                              </div>

                            </div>

                            <div class="carousel-item">

                              <div class="card">
                                <div class="card-body coll-none">
                                  <h5 class="card-title"><a href="#" class="spoonCard">BangBangGokGok</a></h5>
                                  <p>곡소리 나는 프로젝트</p>

                                  <div class="card-collabo d-flex flex-column">
                                    <ul class="list-inline">
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

                                  <div class="d-flex align-items-center">
                                    <span><img
                                        src="https://img.icons8.com/material-outlined/24/000000/like--v2.png" />177</span>
                                    <h4 class="mb-0"><span class="badge badge-success ml-3">javascript</span></h4>
                                  </div>
                                </div>
                              </div>

                            </div>


                            <!-- 우측 캐러셀 버튼 Left and right controls -->
                            <a class="carousel-control-prev coll-none" href="#demo" data-slide="prev">
                              <span class="carousel-control-prev-icon" style="background-color:black"></span>
                            </a>
                            <a class="carousel-control-next coll-none" href="#demo" data-slide="next">
                              <span class="carousel-control-next-icon" style="background-color:black"></span>
                            </a>
                          </div>
                        </div>

                        <!-- 우측 사람 추천 carousel-->
                        <div id="demo1" class="carousel slide col-md-6" data-ride="carousel" data-interval="false">

                          <!-- Indicators -->
                          <!-- <ul class="carousel-indicators">
                            <li data-target="#demo1" data-slide-to="0" class="active"></li>
                            <li data-target="#demo1" data-slide-to="1"></li>
                            <li data-target="#demo1" data-slide-to="2"></li>
                          </ul> -->

                          <!-- The slideshow -->
                          <div class="carousel-inner">
                            <div class="carousel-item active">

                              <div class="card">
                                <div class="well profile_view collabo-none d-block w-100">
                                  <div class="col-sm-12">
                                    <h4 class="brief"><i>pooh_00@naver.com</i></h4>
                                    <div class="left col-md-7 col-sm-7">
                                      <h2>석기현</h2>
                                      <p>50자 이내로 작성한 소개글</p>
                                      <ul class="list-unstyled">

                                      </ul>
                                    </div>
                                    <div class="right col-md-5 col-sm-5 text-center">
                                      <img src="/webapp/resources/asserts/images/img.jpg" alt=""
                                        class="img-circle img-fluid">
                                    </div>
                                  </div>
                                  <div class=" row">
                                    <div class="">

                                      <div class="row ml-3">
                                        <i class="fa fa-heart fa-2x">30</i>
                                        <button type="button" class="btn btn-primary btn-sm ml-4" style=""><i
                                            class="fa fa-user"> </i> View Profile </button>
                                      </div>
                                    </div>

                                  </div>
                                </div>

                              </div>
                            </div>
                            <div class="carousel-item">

                              <div class="card">

                                <div class="well profile_view collabo-none d-block w-100">
                                  <div class="col-sm-12">
                                    <h4 class="brief"><i>pooh_00@naver.com</i></h4>
                                    <div class="left col-md-7 col-sm-7">
                                      <h2>석기현</h2>
                                      <p>50자 이내로 작성한 소개글</p>
                                      <ul class="list-unstyled">

                                      </ul>
                                    </div>
                                    <div class="right col-md-5 col-sm-5 text-center">
                                      <img src="/webapp/resources/asserts/images/img.jpg" alt=""
                                        class="img-circle img-fluid">
                                    </div>
                                  </div>
                                  <div class=" row">
                                    <div class="">

                                      <div class="row ml-3">
                                        <i class="fa fa-heart fa-2x">30</i>
                                        <button type="button" class="btn btn-primary btn-sm ml-4" style=""><i
                                            class="fa fa-user"> </i> View Profile </button>
                                      </div>
                                    </div>

                                  </div>
                                </div>

                              </div>
                            </div>
                            <div class="carousel-item">

                              <div class="card">

                                <div class="well profile_view collabo-none d-block w-100">
                                  <div class="col-sm-12">
                                    <h4 class="brief"><i>pooh_00@naver.com</i></h4>
                                    <div class="left col-md-7 col-sm-7">
                                      <h2>석기현</h2>
                                      <p>50자 이내로 작성한 소개글</p>
                                      <ul class="list-unstyled">

                                      </ul>
                                    </div>
                                    <div class="right col-md-5 col-sm-5 text-center">
                                      <img src="/webapp/resources/asserts/images/img.jpg" alt=""
                                        class="img-circle img-fluid">
                                    </div>
                                  </div>
                                  <div class=" row">
                                    <div class="">

                                      <div class="row ml-3">
                                        <i class="fa fa-heart fa-2x">30</i>
                                        <button type="button" class="btn btn-primary btn-sm ml-4" style=""><i
                                            class="fa fa-user"> </i> View Profile </button>
                                      </div>
                                    </div>

                                  </div>
                                </div>

                              </div>
                            </div>
                            <!-- 우측 캐러셀 버튼 Left and right controls -->

                            <a class="carousel-control-prev coll-none" href="#demo1" data-slide="prev">
                              <span class="carousel-control-prev-icon" style="background-color:black"></span>
                            </a>
                            <a class="carousel-control-next coll-none" href="#demo1" data-slide="next">
                              <span class="carousel-control-next-icon" style="background-color:black"></span>
                            </a>
                          </div>
                        </div>

                      </div>
                      <!-- 맨 위 캐러셀 끝 -->
                      <br>
                      <p class="text-center">콜라보 하고 싶은 프로젝트의 리더에게 제안해보세요.</p>
                      <div class="mid_center d-flex justify-content-center">
                        <div class="btn create-btn collabo-none-btn" data-toggle="modal" data-target="#createCollabo">
                          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                            class="bi bi-plus" viewBox="0 0 16 16">
                            <path
                              d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
                              class="cQfklM" />
                          </svg>
                        </div>
                      </div>
                    </div>
                    <!-- /page content -->
                  </div>
                </div>
              </div>

            </div>

          </div>
        </div><!-- 프로젝트 바디 끝 -->
      </div><!-- /page content -->

  
    <!-- The Modal -->
    <div class="modal" id="createCollabo" data-backdrop="static">
      <div class="modal-dialog">
        <div class="modal-content">

          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title modalTitle">콜라보 제안</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>

          </div>

          <!-- Modal body -->
          <div class="modal-body">

            <div class="x_content">
              <!-- form start -->
              <form role="form" method="post" action="<%=request.getContextPath()%>/app/collabo/sendInviteCollaboMail" name="collaboMailRegist">
                
                <p>콜라보 제안은 다른 프로젝트 팀과 협업 할 수 있는 곳입니다.</p>
                <p>다른 팀과 협업 공간을 만들고 함께 일해보세요.</p>
                <div class="card-body">
                  
                  <div class="control-group row">
                    <label class="control-label col-md-3 col-sm-3 ">이메일 입력</label>
                    <div class="col-md-9 col-sm-9 ">
                      <input type="hidden" id="userFrom" name="userFrom" value="${userVO.userId}">
                      <input type="hidden" id="title" name="title" value="${userVO.userId}의 콜라보 제안 메일입니다.">
                      <input type="hidden" id="dist" name="dist" value="">
                      <input id="tags_1" name="userTo" type="text" class="tags form-control" value=""/> 
                      <div id="suggestions-container" style="position: relative; float: left; width: 250px; margin: 10px;"></div>
                    </div>
                  </div>

                  <!-- select -->
                  <div class="form-group">
                    <label>나의 프로젝트</label>
                    <select class="form-control" id="selectProject">
                    
                    </select>
                  </div>
                  
                  <!-- textarea -->
                  <div class="form-group">
                    <label>보낼 메세지</label>
                    <textarea id="sendMessage" class="form-control" rows="3" placeholder="메세지를 입력해주세요."></textarea>
                  </div>
                </div>
                <!-- /.card-body -->
                <input type="hidden" name="content" id="collaboContent">
                <button type="button" id="inviteButton" class="btn  btn-outline-primary collabo-submit-btn" onclick="invite_go();">보내기</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 콜라보 제안 모달 끝-->

  </div>
  
  <script>
  window.addEventListener('load', function() {
	  
	  $.ajax({
			url : "/app/collabo/getProjectTitle.do",
			type : "POST",
			success : function(arg) {
				let projTitle = "<option value='' disabled selected hidden>프로젝트를 선택해주세요.</option>";
				
				for (var i = 0; i < arg.length; i++) {
					projTitle += "<option value='"+arg[i]+"'>"+arg[i]+"</option>";
				}
				document.getElementById('selectProject').innerHTML=projTitle;
			},
			error : function(arg) {
				alert("리스트 가져오는거 에러임 ㅎㅎ" + arg.status + "메세지" + arg.responseText);
			}
		})
	
		
});
  
	function invite_go(){
		alert("ddd");
		//let userTo = $("#tags_1").val();
		let userTo = document.getElementById('tags_1').value;
		//alert(userTo);
		let myProj = document.getElementById('selectProject').value;
		//alert(myProj);
		let text = document.getElementById('sendMessage').value;
		//alert(text);
		let title = document.getElementById('title').value;
		alert(title);
		
		if (userTo == "") {
			alert("초대할 유저를 입력하세요.")	
			return false;
		}
		if (myProj == "") {
			alert("프로젝트를 선택하세요.")	
			return false;
		}
		if (text == "") {
			alert("메세지를 입력하세요.")	
			return false;
		}
		
		let content = inviteMailForm(userTo,myProj,text);
		console.log(text);
		document.getElementById('collaboContent').value = content;
		console.log(document.getElementById('collaboContent').value);
		document.collaboMailRegist.submit();
	}
	
	
	
	function inviteMailForm(userTo,myProj,text) {
		var content = ""
		content += 
			`<div class="x_content">
			  <br>
			    <div class="item form-group">
			      <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name"><span class="required">보낸 사람 : <a href="">`+ userTo +`</a></span>
			        
			      </label>
			    </div>
			    
			    <div class="item form-group">
			      <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><span
			          class="required">보낸 사람의 프로젝트 : <a href="">`+ myProj +`</a></span>
			        
			      </label>
			    </div>
			    
			    <div class="item form-group">
			      <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">메세지 : 
			      <span>`+ text +`</span>
			      </label>
			    </div>
		   
		    <div class="ln_solid"></div>
		    <div class="item form-group">
		      <div class="col-md-6 col-sm-6 offset-md-3">
		        <button class="btn btn-primary" type="button">수락</button>
		        <button class="btn btn-primary" type="reset">거절</button>
		      </div>
		    </div>
		</div>`;
		
		return content;
	}	
		
	
  </script>


</body>

</html>