<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
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
		                <div class="col-lg-12" style="margin-left: 20px;">
		           
		
		                    <form role="form" class="register-form" action="<%=request.getContextPath()%>/user/modify.do" method="post" id="modify-form" enctype="multipart/form-data">
		                    
		                
		                     
		                     <div class="imageMyfileBox">
		                            <div id="pictureView" class="img-circle" style="height: 100px; width: 100px; float: left; "></div>
		                            <div class="textMyfileBox"> <a href="#이미지변경"><label style="font-weight:bold;" for="inputFile">변경</label></a> </div>
		                            <input class="imageFileInput" type="file" id="inputFile" onchange="changePicture_go();" name="picture" style="display:none">
		                            <input id="inputFileName" class="form-control" type="text" name="tempPicture" hidden=hidden; value="haha"/>
									<input id="picture" class="form-control" type="hidden" name="uploadPicture" />
		               
		                      </div>
 
		                        <div style="display: inline-block;">
		                          
		                          <br>
		                            <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;석기순</h5>
		                            
		                            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pooh_naver@naver.com</h4>
		                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-heart fa-2x"  style="color: red;">&nbsp;30</i>
					                <br><br><br><br>
		                          </div>
		                          
		                          
		                          <h5 style="color: rgb(0, 0, 0); font-weight: 600;">&nbsp;&nbsp;내 정보 관리</h5>
		                          &nbsp;
		                          <div class="kt-portlet__body">
		                            
		
		                            <div class="form-group row" id="countTextDiv">
		                               <label ><span class="required" ><h2>&nbsp;&nbsp;&nbsp;&nbsp;닉네임</h2> </span></label>
		                                <div class="col-lg-12">
		                                   
		                                    <!-- <div class="form-control form-control-view">칸반보드 UX  설정 REQ-001 문의</div> -->
		                                    <input id="test_nickName" onclick="button_click();" class="form-control col-md-10 seokid" name="nickName" value="" placeholder="중복 불가, 영문8자 이하...">
		
		                                </div>
		                                 <div id="test_NickNamecnt" style="margin-left:20px; display: none;">(0 / 8)</div>
		                            </div>
		            
		                            <br>
		                            <div class="form-group row">
		                              <label ><span class="required" ><h2>&nbsp;&nbsp;&nbsp;&nbsp;소개글</h2> </span></label>
		                               <div class="col-lg-12">
		                                  
		                                   <!-- <div class="form-control form-control-view">칸반보드 UX  설정 REQ-001 문의</div> -->
		     
		                                   <input id="test_info" onclick="button_click2();" class="form-control col-md-10 seokid" name="info" value="" placeholder="짧은 자기소개 부탁드립니다...">
		                                  
		                                
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
		                                    name="view" 
		                                    value="on" 
		                                    id="week" 
		                                    checked
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
		                                    name="view" 
		                                    value="off" 
		                                    id="month"
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
		
		                         <button type="button" onclick="modify_go();" style="margin-left: 870px;" class="btn btn-dark" onclick="RemoveIssue('02b02ecf-5f13-4a4e-b870-a602390cc43e');">수정  </button> 
		                          	
		                 
		                    </form>   
		                        
		                </div><br>
		
		                <h5 style="color: black; font-weight: 600;">&nbsp;&nbsp;기타 수정</h5><br>
		
		               <a style="color: rgb(49, 48, 48);" href="#" data-toggle="modal" data-target="#pwdModal"><h2>&nbsp;&nbsp;비밀번호 수정</a><br>
		              <hr style="background-color: rgb(182, 179, 179); width: 780px; margin-left: 5px; height: 1px;">
		                
		                <a style="color: rgb(49, 48, 48);" href="#" data-toggle="modal" data-target="#alarmModal"><h2>&nbsp;&nbsp;알림설정</h2></a>
		                  <hr style="background-color: rgb(182, 179, 179); width: 780px; margin-left: 5px; height: 1px;">
		                
		               
		                  <a style="color: rgb(49, 48, 48);" href="#" data-toggle="modal" data-target="#fireModal"><h2>&nbsp;&nbsp;회원탈퇴</h2></a>
		                  <hr style="background-color: rgb(182, 179, 179); width: 780px; margin-left: 5px; height: 1px;">
		               
		                 
		               
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
		                   
		                      <div class="kt-portlet__body">
		              
		                          <div class="form-group row">
		                          	<form>
		                            <label ><span class="required" >&nbsp;&nbsp;&nbsp;기존 비밀번호 확인 </span></label>
		                              <div class="col-lg-12">
		                      
		                                  <input type="password" style="width: 400px;" class="form-control col-md-10 seokid" name="" value="" placeholder="">
		
		                              </div>
		                              
		                          </div>
		          
		                          <br>
		                          <br>
		
		                          <div class="form-group row">
		                            <label ><span class="required" >&nbsp;&nbsp;&nbsp;새로운 비밀번호 </span></label>
		                            <div class="col-lg-12 idForm">
		                                                              
		                                <input type="password"  style="width: 400px;" class="form-control col-md-10 seokid" name="" value=""  placeholder="8~16자 영문 대 소문자, 숫자, 특수문자">                                                       
		      
		                            </div>
		                            
		                          </div>  
		      
		                        <br><br>
		
		                        <div class="form-group row">
		                          <label ><span class="required" >&nbsp;&nbsp;&nbsp;새로운 비밀번호 확인 </span></label>
		                            <div class="col-lg-12">
		                                                        
		                              <input type="password" style="width: 400px;" class="form-control col-md-10 seokid" name="" value="" > 
		      
		                            </div>
		                        </div>  
		    					</form>
		
		                      </div>

		                  </div>
		                  <!-- 모달 바디 끝 -->
		                  <div class="modal-footer">
		                
		                    <button type="button" class="btn btn-danger" id="replyDelBtn" onclick="modify_go();">수정</button>
		                    <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
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
			                        
			                      
			                         <input type="password" class="form-control col-md-12 seokid" name="" value="" placeholder="">
			                    </div>
		                    </form>  
		                 </div>
		
		
		                  </div>
		                  
		                  <div class="modal-footer">
		                
		                    <button type="button" class="btn btn-danger" id="replyDelBtn" onclick="replyRemove_go();">탈퇴</button>
		                    <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
		                  </div>
		                </div>
		              </div>
					</div>
		             <!-- 모달끝 -->
		
					 <!-- 알림설정 모달폼 -->
             <div id="alarmModal" class="modal modal-default fade" role="dialog">
              <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content"><br>
                  <div class="modal-header">
                    <h3 class="modal-title">알림 설정</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>        
                  </div>

                  
                  <div class="modal-body" data-rno>

                    
                        
                      <div class="form-group row">
                            <div class="col-lg-12">
                              <label class="switch float-right">
                                <input type="checkbox">
                                <span class="slider round"></span>
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
                                    <label class="switch float-right">
                                      <input type="checkbox">
                                      <span class="slider round"></span>
                                    </label>
                                  <i class="fa fa-desktop fa-2x" style="float: left;"></i><h5>&nbsp;프로젝트 야스오</h5>
                                       
                          </div>
                        
                      </div>  

                      <hr style="margin:10px;">
                      <div class="form-group row">
                        <div class="col-lg-12">
                          <label class="switch float-right">
                            <input type="checkbox">
                            <span class="slider round"></span>
                          </label>
                                <i class="fa fa-desktop fa-2x" style="float: left;"></i><h5>&nbsp;프로젝트 피오라</h5>
                                     
                        </div>
                      
                    </div>  

                    <hr style="margin:10px;">

                    <div class="form-group row">
                      <div class="col-lg-12">
                        <label class="switch float-right">
                          <input type="checkbox">
                          <span class="slider round"></span>
                        </label>
                              <i class="fa fa-desktop fa-2x" style="float: left;"></i><h5>&nbsp;프로젝트 마스터 이</h5>
                                   
                      </div>
                    
                  </div>  

                 

                  </div>
                  
                  <div class="modal-footer">
                
                  </div>
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
      function MemberPictureThumb(targetObj, fileName, contextPath){ 
    		
    		if(!contextPath) contextPath="";
    		
    		targetObj.style.backgroundImage="url('"+contextPath+"/user/getPicture.do?picture="+fileName+"')";
    		targetObj.style.backgroundPosition="center";
    		targetObj.style.backgroundRepeat="no-repeat";
    		targetObj.style.backgroundSize="cover";
    	 
    	}
      
      
      	
      function changePicture_go(){
    		var picture = $('input#inputFile')[0];
    		
    		var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
    		
    		//이미지 확장자 jpg 확인
    		if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
    			alert("이미지는 jpg/jpeg 형식만 가능합니다.");
    			return;
    		}
    		
    		//이미지 파일 용량 체크
    		if(picture.files[0].size>1024*1024*1){
    			alert("사진 용량은 1MB 이하면 가능합니다.");
    			return;
    		}
    		
    		document.getElementById('inputFileName').value = picture.files[0].name;
    		
    		if(picture.files && picture.files[0]){
    			var reader = new FileReader();
    			reader.onload = function(e) {
    				//이미지 미리보기
    				$('div#pictureView')
    				.css({'background-image':'url('+e.target.result+')',
    						'background-position':'center',
    						'background-size':'cover',
    						'background-repeat':'no-repeat'
    				});
    			}
    			reader.readAsDataURL(picture.files[0]);
    		}
    		
    		//이미지 변경 확인
    		$('input[name="uploadPicture"]').val(picture.files[0].name);
    		
    	}
      
      
      
      
  	function modify_go(){
		/* var form=$('form[role="form"]');
		form.submit(); */
		
		 $('#modify-form').submit(function (e) { 
			   
			    var input_picture = $('#picture').val();
			    var input_nickName = $('#test_nickName').val();
			    var input_info = $('#test_info').val();
			    var input_switch = $('#week').val();
			    var input_switch = $('#month').val();
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
			    
		 });
		
		
		
		
		
		
		
		
		
  	}
  	
      

      
      </script>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    <!-- include -->
    <script>
    
    window.onload = function(){
    	
    	MemberPictureThumb($('#pictureView')[0],
  				'${member.picture}','<%=request.getContextPath()%>');
    	
    }
    	
    	$('.modal').on('hidden.bs.modal', function (e) {
    	    console.log('modal close');
    	  $(this).find('form')[0].reset()
    	});
    	
    	
        $('#test_nickName').on('keyup', function() {
            $('#test_NickNamecnt').html("("+$(this).val().length+" / 8)");
    
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
    };


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