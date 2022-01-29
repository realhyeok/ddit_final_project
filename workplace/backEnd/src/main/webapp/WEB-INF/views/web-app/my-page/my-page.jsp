<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <body>
    
    <!-- include -->
    
    <script src="../test-js/includeHTML.js"></script>
	 <!-- page content -->
      <div class="right_col" role="main">
        <!-- 내 작업 바디 시작 -->
        <div class="x_panel">

          <div class="x_title">
			<h2>
				<a href="#home"><i class="fa fa-user fa-2x"></i></a> </i> 프로필 
			</h2>

			<div class="clearfix"></div>
          </div>

          <div class="x_content">

            <ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">프로필 수정</a>
              </li>
              
             
            </ul>

            <div class="tab-content" id="myTabContent">

              <!-- 내 작업 대시보드 예시입니다. -->

				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<br>
		                <div class="col-lg-12" >
			
		                	<div class="form-group row">
		                		<div class="col-lg-6 float-rigth">
		                		
			                     <form role="formPicture"  action="<%=request.getContextPath()%>/user/pictureUpload.do" method="post" enctype="multipart/form-data">
				                     <div class="imageMyfileBox float-right">
				                            <div id="pictureView" class="img-circle" style="height: 120px; width: 120px; float: left;" data-id="${user.userId }"></div>
				                            <div class="textMyfileBox"> <a href="#이미지변경"><label style="font-weight:bold;" for="inputFile">변경</label></a> </div>
				                            <input class="imageFileInput" type="file" id="inputFile" onchange="changePicture_go();" name="picture" style="display:none">
				                            <input id="inputFileName" class="form-control" type="text" name="tempPicture" hidden=hidden; value="haha"/>
											<input id="picture" class="form-control" type="hidden" name="uploadPicture" />
				               
				                      </div>
	 							</form>
	 							
	 							</div>
	 							
	 							<div class="col-lg-6">
	 							  <div style="display: inline-block;">
		                          
		                          <br>
		                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.nickname }</h5>
		                            <input type="hidden" id="userId" value="${user.userId }">
		                            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.userId }</h4>
		                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-heart fa-2x"  style="color: red;">&nbsp;${user.likeCount}</i>
					                <br><br><br><br>
		                        </div>
	 							
	 							</div>
	 							
 							</div>
 							
 							<div style="margin-left: 120px;">
		                      
		                          
		                       <form role="form" onsubmit="return false;" class="modify-form"  id="modify-form">
		                          <h5 style="color: rgb(0, 0, 0); font-weight: 600;">&nbsp;&nbsp;내 정보 관리</h5>
		                          &nbsp;
		                          <div class="kt-portlet__body">
		                            <input type="hidden" name="picture" value="${user.picture}">
		
		                            <div class="form-group row" id="countTextDiv">
		                               <label ><span class="required" ><h2>&nbsp;&nbsp;&nbsp;&nbsp;닉네임</h2> </label>
		                                <div class="col-lg-12">
		                                   
		                                    <!-- <div class="form-control form-control-view">칸반보드 UX  설정 REQ-001 문의</div> -->
		                                    <input id="test_nickName" onclick="button_click();" class="form-control col-md-11 seokid" name="nickname" value="" placeholder="중복 불가, 영문8자 이하...">
		
		                                </div>
		                                 <div id="test_NickNamecnt" style="margin-left:20px; display: none;">(0/8)</div><br>
		                                 <span id="nickNameCheck" style="color:red; margin-left: 2%;"></span>
		                            </div>
		            
		                            <br>
		                            <div class="form-group row">
		                              <label ><span class="required" ><h2>&nbsp;&nbsp;&nbsp;&nbsp;소개글</h2> </span></label>
		                               <div class="col-lg-12">
		                                  
		                                   <!-- <div class="form-control form-control-view">칸반보드 UX  설정 REQ-001 문의</div> -->
		     
		                                   <input id="test_info" onclick="button_click2();" class="form-control col-md-11 seokid" name="intro" value="" placeholder="짧은 자기소개 부탁드립니다..."><span id="infoCheck"></span>
		                                  
		                                
		                               </div>
		                               <div id="test_infocnt" style="margin-left:20px; display: none;">(0 / 50)</div>
		
		                           </div>
		
		                           <br>
		                         
		                           <div class="form-group row">
		                            <label ><span class="required" ><h2>&nbsp;&nbsp;&nbsp;&nbsp;프로필 공개 여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2> </span></label>
		                            <!-- <p class="btn-switch">          
		                              <input type="radio" id="yes" name="switch" class="btn-switch__radio btn-switch__radio_yes" />
		                              <input type="radio" checked id="no" name="switch" class="btn-switch__radio btn-switch__radio_no" />   
		                              <label for="yes" class="btn-switch__label btn-switch__label_yes"><span class="btn-switch__txt">활성화</span></label>               
		                              <label for="no" class="btn-switch__label btn-switch__label_no"><span class="btn-switch__txt">비활성화</span></label>             
		                            </p> -->
		                            
		                            <!-- 일반버튼 -->
		                            <!--  <label class="switch float-right">
                                      <input type="checkbox">
                                      <span class="slider round"></span>
                                    </label> -->
		                            
		                               <div class="switchz" style="margin-top: 5px;">
		                                <input 
		                                    type="radio" 
		                                    class="switch-input" 
		                                    name="privacy" 
		                                    value="A201" 
		                                    id="week" 
		                                    ${user.privacy eq 'A201' ? 'checked' : ''}
		                                >
		                                <label 
		                                    for="week" 
		                                    class="switch-label switch-label-off"
		                                    >
		                               	    활성화
		                                </label>
		                                <input 
		                                    type="radio" 
		                                    class="switch-input" 
		                                    name="privacy" 
		                                    value="A202" 
		                                    id="month"
		                                     ${user.privacy eq 'A202' ? 'checked' : ''}
		                                    >
		                                <label 
		                                    for="month" 
		                                    class="switch-label switch-label-on"
		                                    >
		                          	       비활성화 
		                                </label>
		                                    <span 
		                                        class="switch-selection"
		                                        >
		                                    </span>
		                              </div>
		                            
		                         </div>
		
		                         <button type="button" onclick="modify_go();" style="margin-left: 86%;" class="btn btn-dark" >수정  </button> 
		                          	
		                 
		                    </form>   
		                        
		                </div><br>
		
		                <h5 style="color: black; font-weight: 600;">&nbsp;&nbsp;기타 수정</h5><br>
		
		               <a style="color: rgb(49, 48, 48);" href="#" data-toggle="modal" data-target="#pwdModal"><h2>&nbsp;&nbsp;비밀번호 수정</a><br>
		              <hr style="background-color: rgb(182, 179, 179); width: 93%; margin-left: 5px; height: 1px;">
		                
		                <a style="color: rgb(49, 48, 48);" href="#" data-toggle="modal" data-target="#alarmModal"><h2>&nbsp;&nbsp;알림설정</h2></a>
		                  <hr style="background-color: rgb(182, 179, 179); width: 93%; margin-left: 5px; height: 1px;">
		                
		               
		                  <a style="color: rgb(49, 48, 48);" href="#" data-toggle="modal" data-target="#fireModal"><h2>&nbsp;&nbsp;회원탈퇴</h2></a>
		                  <hr style="background-color: rgb(182, 179, 179); width: 93%; margin-left: 5px; height: 1px;">
		               
		                 
		               
		            </div>
		             <!-- 비밀번호 수정 모달 -->
		             <div id="pwdModal" class="modal modal-default fade" role="dialog">
		              <div class="modal-dialog">
		                <!-- Modal content-->
		                <div class="modal-content"><br>
		                  <div class="modal-header">
		                    <h3 class="modal-title">비밀번호 수정</h3>
		                    <button type="button" class="close" data-dismiss="modal">&times;</button>        
		                  </div>
		                  <div class="modal-body" data-rno>
		                   
		                     <!--  <div class="kt-portlet__body"> -->
		              			<div id="orginPwd" style="display: show;">
		                          <div class="form-group row">
		                          
		                            <label ><span class="required" >&nbsp;&nbsp;&nbsp;기존 비밀번호 확인 </span></label>
		                              <div class="col-lg-12">
		                      
		                                  <input type="password" id="password" style="width: 400px;" class="form-control col-md-10 seokid" name="" value="" placeholder="">
										
		                              </div>
		                              	
		                          </div>
		  					        <span id="originPwdCheck"></span>
		  					        </div>
		                          <br>
		                          <br>
							<div id="showPwd" style="display: none">
		                          <div class="form-group row">
		                            <label ><span class="required" >&nbsp;&nbsp;&nbsp;새로운 비밀번호 </span></label>
		                            <div class="col-lg-12 idForm">
		                                                              
		                                <input type="password" id="newPassword" style="width: 400px;" class="form-control col-md-10 seokid" name="" value=""  placeholder="8~16자 영문 대 소문자, 숫자, 특수문자" readonly>                                                       
		      							
		                            </div>
		                            
		                          </div>  
		      					<span id="newPwdCheck"></span>
		                        <br><br>
							<form role="pwdform" onsubmit="return false;" class="pwdModify-form"  id="pwdModify-form">
		                        <div class="form-group row">
		                          <label ><span class="required" >&nbsp;&nbsp;&nbsp;새로운 비밀번호 확인 </span></label>
		                            <div class="col-lg-12">
		                                                        
		                              <input type=password  id="checkPassword" style="width: 400px;" class="form-control col-md-10 seokid" name="" value="" readonly> 
		      						  
		                            </div>
		                        </div>  
		                        <span id="newPwdVCheck"></span>
		    				
		
		                      
		                 
		                  <!-- 모달 바디 끝 -->
		                  <div class="modal-footer">
		                
		                    <button type="button" onclick="modifyPwd_go();" class="btn btn-danger"  >수정</button>
		                    <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
		                    
		                   </div>
	
		                 </div><!-- show form -->
						</form>
		               <!--  </div> -->
		              </div>
		            </div>
		            </div>
		            </div>
		             <!--  비밀번호 수정 모달끝 -->
		
		           
		             <!-- 탈퇴 모달폼 -->
		             <div id="fireModal" class="modal modal-default fade" role="dialog">
		              <div class="modal-dialog">
		                <!-- Modal content-->
		                <div class="modal-content"><br>
		                  <div class="modal-header">
		                    <h3 class="modal-title">회원 탈퇴</h3>
		                    <button type="button" class="close" data-dismiss="modal">&times;</button>        
		                  </div>
		                  <div class="modal-body" data-rno>
		
		                    <form>
			                   <br>
			                    <div class="form-group row">
			                      <div class="col-lg-12">
			                          
			                        <!-- <input id="test_nickName" onclick="button_click();" class="form-control col-md-10 seokid" name="" value="" placeholder="중복 불가, 영문8자 이하...">
			
			                      </div>
			                       <div id="test_NickNamecnt" style="margin-left:20px; display: none;">(0 / 8)</div> -->
			
			                           
			                       <textarea id="test_fire" class="form-control" onclick="button_click3();" name="?" style="height: 200px;  resize: none;" placeholder="탈퇴 사유를 입력해주세요 최소 50글자..."></textarea>
			                    
			                       <div id="test_firecnt" style="display: none;">(0 / 100)</div>
			                          <br>
			                            <label>회원 탈퇴를 하시면 현재까지 등록된 모든 정보와 컨텐츠가 삭제되며, 이는 복원이 불가능합니다. 정말 탈퇴하시겠습니까? </label>
			                      </div>
			                     
			                  </div>
			
			                  <div class="form-group row">
			                    <label ><span class="required" ><h2>&nbsp;&nbsp;&nbsp;비밀번호 확인</h2> </span></label><br>
			                     <div class="col-lg-12">
			                        
			                      
			                         <input type="password" class="form-control col-md-12 seokid" id="firePassword" name="firePassword" value="" placeholder="">
			                    </div>
		                    </form>  
		                 </div>
		
		
		                  </div>
		                    <span id="fireCheck" style="color: red; margin-left: 20px; "></span>
		                  <div class="modal-footer">
		                	
		                    <button type="button" class="btn btn-danger" id="replyDelBtn" onclick="fire_go();">탈퇴</button>
		                    <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
		                    </div>
		                  </div>
		                </div>
		              </div>
		             <!-- 모달끝 -->
		
					 <!-- 알림설정 모달폼 -->
							<div id="alarmModal" class="modal modal-default fade"
								role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<br>
										<div class="modal-header">
											<h3 class="modal-title">알림 설정</h3>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>


										<div class="modal-body" data-rno>



											<div class="form-group row">
												<div class="col-lg-12">
													<label class="switch float-right"> <input
														type="checkbox"> <span class="slider round"></span>
													</label>
													<h4>모든 알림</h4>
													모든 알림에 대하여 받거나 거부 할 수 있어요.
												</div>

											</div>
											<hr>

											<div class="form-group row">
												<div class="col-lg-12">

													<h4>프로젝트 별 알림</h4>
													내가 속해 있는 프로젝트의 알림을 꺼보세요. 프로젝트 내 모든 활동의 알림을 받지 않게 됩니다.
												</div>

											</div>

											<br>
											<div class="form-group row">
												<div class="col-lg-12">
													<label class="switch float-right"> <input
														type="checkbox"> <span class="slider round"></span>
													</label> <i class="fa fa-desktop fa-2x" style="float: left;"></i>
													<h5>&nbsp;프로젝트 야스오</h5>

												</div>

											</div>

											<hr style="margin: 10px;">
											<div class="form-group row">
												<div class="col-lg-12">
													<label class="switch float-right"> <input
														type="checkbox"> <span class="slider round"></span>
													</label> <i class="fa fa-desktop fa-2x" style="float: left;"></i>
													<h5>&nbsp;프로젝트 피오라</h5>

												</div>

											</div>

											<hr style="margin: 10px;">

											<div class="form-group row">
												<div class="col-lg-12">
													<label class="switch float-right"> <input
														type="checkbox"> <span class="slider round"></span>
													</label> <i class="fa fa-desktop fa-2x" style="float: left;"></i>
													<h5>&nbsp;프로젝트 마스터 이</h5>

												</div>

											</div>



										</div>

										<div class="modal-footer"></div>
									</div>
								</div>
							</div>
							<!-- 모달끝 -->
				</div>
				<!-- 프로필 수정 끝 -->
	
					
			</div>
			<!-- 마이페이지 탭 끝 -->
					
            </div>

          </div>
          <!-- x_content 끝 -->

        </div>
        <!-- 내 작업 바디 끝 -->
      </div>
      <!-- /page content -->
      
      
      <script>
							//나중에 js로 뺌
							function MemberPictureThumb(targetObj, fileName,
									contextPath) {

								if (!contextPath)
									contextPath = "";

								targetObj.style.backgroundImage = "url('"
										+ contextPath
										+ "/user/getPicture.do?picture="
										+ fileName + "')";
								targetObj.style.backgroundPosition = "center";
								targetObj.style.backgroundRepeat = "no-repeat";
								targetObj.style.backgroundSize = "cover";

							}

							var formData = "";

							function changePicture_go() {
								var picture = $('input#inputFile')[0];

								var fileFormat = picture.value.substr(
										picture.value.lastIndexOf(".") + 1)
										.toUpperCase();

								//이미지 확장자 jpg 확인
								if (!(fileFormat == "JPG" || fileFormat == "JPEG")) {
									alert("이미지는 jpg/jpeg 형식만 가능합니다.");
									return;
								}

								//이미지 파일 용량 체크
								if (picture.files[0].size > 1024 * 1024 * 1) {
									alert("사진 용량은 1MB 이하면 가능합니다.");
									return;
								}

								document.getElementById('inputFileName').value = picture.files[0].name;

								if (picture.files && picture.files[0]) {
									var reader = new FileReader();
									reader.onload = function(e) {
										//이미지 미리보기
										$('div#pictureView')
												.css(
														{
															'background-image' : 'url('
																	+ e.target.result
																	+ ')',
															'background-position' : 'center',
															'background-size' : 'cover',
															'background-repeat' : 'no-repeat'
														});
									}
									reader.readAsDataURL(picture.files[0]);
								}

								//이미지 변경 확인
								$('input[name="uploadPicture"]').val(
										picture.files[0].name);

								formData = new FormData(
										$('form[role="formPicture"]')[0]);

								alert("업로드 시작");
								$
										.ajax({
											url : "/user/pictureUpload.do",
											data : formData,
											type : 'post',
											processData : false,
											contentType : false,
											success : function(data) {

												$(
														'form[role="form"] input[name="picture"]')
														.val(data);
												alert("사진이 업로드 되었습니다.");
											},
											error : function(error) {
												AjaxErrorSecurityRedirectHandler(error.status);
											}
										});

							}

							function modify_go() {
								/*  */

								/*  $('#modify-form').submit(function (e)  */

								var input_nickName = $('#test_nickName').val();
								var input_info = $('#test_info').val();
								var input_switch = $(
										"input:radio[name='view']:checked")
										.val();

								var nickNameCheck = document
										.getElementById('nickNameCheck');
								var infoCheck = document
										.getElementById('infoCheck');

								if (input_nickName == "") {
									nickNameCheck.innerHTML = "닉네임이 공백입니다."
									return false;
								}

								/* e.preventDefault();
								checkInputs();
								if(!checkInputError()){
								return false;
								} */
								
								$.ajax({
									type : "POST",
									url : "/user/modify.do",
									data : $("#modify-form").serialize(),
									//dataType : "json",
									success : function(res) {

										alert("성공적! 근데 모달로 해요?");
										location.href ="<%=request.getContextPath()%>/user/my-page";
									},
									error : function(err) {
										alert("에러" + err.status);
									}
								});

							}

							function modifyPwd_go() {

								var exptext = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;
								var newPassword = document
										.getElementById('newPassword');
								var newPwdCheck = document
										.getElementById('newPwdCheck');

								var checkPassword = document
										.getElementById('checkPassword');
								var newPwdVCheck = document
										.getElementById('newPwdVCheck');

								if (newPassword.value == "") {
									newPwdCheck.innerHTML = "패스워드가 공백입니다.";

									return false;
								}

								if (checkPassword.value == "") {
									newPwdVCheck.innerHTML = "패스워드가 공백입니다.";

									return false;
								}

								if (exptext.test(newPassword.value) == false) {

									newPwdCheck.innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요!";
									newPwdVCheck.innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요!";
									return false;

								}

								if (exptext.test(checkPassword.value) == false) {

									newPwdVCheck.innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요!";
									return false;

								}

								if (newPassword.value != checkPassword.value) {

									newPwdCheck.innerHTML = "비밀번호가 일치 하지 않습니다.";

									return false;
								}

								$.ajax({
									type : "POST",
									url : "/user/modifyPwd.do",
									data : {
										"password" : newPassword.value
									},
									success : function(res) {

										alert("비번성공!");
										location.reload();
									},
									error : function(err) {
										alert("에러" + err.status);
									}
								});

							}
						</script>
      
      

    <!-- include -->
    <script>


    window.onload = function(){
    	
    	
    	alert('${user.privacy}');
    	MemberPictureThumb($('#pictureView')[0],
  				'${user.picture}','<%=request.getContextPath()%>');
    	
    
    	
    	$('.modal').on('hidden.bs.modal', function (e) {
    	    console.log('modal close');
    	  $(this).find('form')[0].reset()
    	});
    	
    	
        $('#test_nickName').on('keyup', function() {
            $('#test_NickNamecnt').html("("+$(this).val().length+" / 8)");
            $('#nickNameCheck').html("");
    
            if($(this).val().length > 8) {
                $(this).val($(this).val().substring(0, 8));
                $('#test_NickNamecnt').html("(8 / 8)");
                $('#test_NickNamecnt').css("color","black");
            }
            else{
              $('#test_NickNamecnt').css("color","gray");
            }
        });
        
        
        $('#test_info').on('keyup', function() {
            $('#test_infocnt').html("("+$(this).val().length+" / 50)");
    
            if($(this).val().length > 50) {
                $(this).val($(this).val().substring(0, 50));
                $('#test_infocnt').html("(50 / 50)");
                $('#test_infocnt').css("color","black");
            }
            else{
              $('#test_infocnt').css("color","gray");
            }
        });
        
        $('#test_fire').on('keyup', function() {
            $('#test_firecnt').html("("+$(this).val().length+" / 100)");
    
            if($(this).val().length > 100) {
                $(this).val($(this).val().substring(0, 100));
                $('#test_firecnt').html("(100 / 100)");
                $('#test_firecnt').css("color","black");
            }
            else{
              $('#test_firecnt').css("color","gray");
            }
        }); 
        
        
        
      
       
        $('#password').on('keyup', function() {
        	
        	var passwords = $(this).val();
        	  $.ajax({
	  			    type: "POST",
	  			    url: "/user/passwordCheck.do",
	  			    data: {"passwords": passwords},
	  			 
	  			    success: function (res) {
	  			    	
	  			    	
	  			    	$('#originPwdCheck').text('비밀번호가 일치힙니다');
	  			
	  			    	$('#newPassword').prop("readonly", false);
	  			    	$('#checkPassword').prop("readonly", false);
	  			    	$('#password').prop("readonly",true);
	  			    	$('#showPwd').show();
	  			    	$('#orginPwd').hide();
	  			    	
	  			    
	  			    },
	  			    error: function (err) {
	  			    	$('#originPwdCheck').text('비밀번호 불일치!!');
	  			    	
	  			  	   
	  			    }
	  			});
        }); 

        
        //비밀번호 정규화 
        //정규식
			 $('#newPassword').on('keyup', function(){

		      pwdvalue = $(this).val().trim()
		      pwdreg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/

		      if(pwdreg.test(pwdvalue)){
		    	  newPwdCheck.innerHTML = "안전하게 사용가능합니다.";
		      }
		      else{
		    	  newPwdCheck.innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요!";
		      }

		   })
		
		
		
			//같은지 체크
			$('#checkPassword').on('keyup', function(){
	
			      pwdCheck = $(this).val().trim()
			      if(pwdCheck == pwdvalue){
			    	  newPwdVCheck.innerHTML = "동일한 비밀번호 입니다.";
			      }
			      else{
			         newPwdVCheck.innerHTML = "비밀번호가 동일하지 비밀번호 입니다.";
			      }
	
			   })
			   
    };//window.onload

    
   function fire_go(){
    	
	   var fireArea = document.getElementById('test_fire');
	   var fireCheck = document.getElementById('fireCheck');
	   var firePassword = document.getElementById('firePassword');
	   var userId = document.getElementById('userId');
	   
		if (fireArea.value.length<50) {
			fireCheck.innerHTML = "50글자 이하입니다.";
			return false;
		}
    	
		    	
		    	 $.ajax({
					    type: "POST",
					    async : false,
					    url: "/user/fire.do",
					    data: {"passwords" : firePassword.value},
					    success: function (res) {
					    
					    	alert("이거 모달로 띄우니 겹침");
					    	window.location.href = 'https:/naver.com';
					    },
					    error: function (err) {
					    	alert("fire에러발생"+err.status);
					    }
					});

    	
    }//회원탈퇴
    
  
    

    function button_click(){
      document.getElementById("test_NickNamecnt").style.display="block";
    }
    function button_click2(){
      document.getElementById("test_infocnt").style.display="block";    
    }
    function button_click3(){
	  document.getElementById("test_firecnt").style.display="block";  
	}
        
    </script>
    
    
    
    <script>
		includeHTML();	
	</script>
</body>