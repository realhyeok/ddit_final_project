<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- include -->
    <script src="../test-js/includeHTML.js"></script>
 <!-- page content -->
      <div class="right_col" role="main">
        <!-- 내 작업 바디 시작 -->
        <div class="x_panel">

          <div class="x_title">
			<h2>
				<a href="#home"><i class="fa fa-user fa-2x"></i></a> </i> 마이페이지
			</h2>

			<div class="clearfix"></div>
          </div>

          <div class="x_content">

            <ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">대시보드</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="pwdModify-tab" data-toggle="tab" href="#pwdModify" role="tab" aria-controls="pwdModify" aria-selected="false">이슈</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="alarmSetting-tab" data-toggle="tab" href="#alarmSetting" role="tab" aria-controls="alarmSetting" aria-selected="false">알림설정</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="memberWithdrawal-tab" data-toggle="tab" href="#memberWithdrawal" role="tab" aria-controls="memberWithdrawal" aria-selected="false">회원탈퇴</a>
              </li>
       
            </ul>

            <div class="tab-content" id="myTabContent">

              <!-- 내 작업 대시보드 예시입니다. -->

				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<br>
					<div class="col-lg-12" style="margin-left: 300px;">

						<style>
							.imageMyfileBox {
								position: relative;
								transition: .5s ease;
								left: 10px;
								top: 5px;
							}
							
							.imageMyfileBox .textMyfileBox {
								position: absolute;
								top: 75px;
								left: 37px;
							}
							
							.imageFileInput {
								position: absolute;
								width: 0;
								height: 0;
								padding: 0;
								overflow: hidden;
								border: 0;
							}
						</style>



						<!-- 이미지 파일 변경 -->
						<div class="imageMyfileBox">
							<img src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg" alt="..." class="img-circle" style="height: 100px; width: 100px; float: left;">
								
							<div class="textMyfileBox">
								<a href="#이미지변경"><label style="font-weight: bold;"
									for="file">변경</label></a>
							</div>
							<input class="imageFileInput" type="file" id="file">
						</div>
						
						
						<!-- 이름 이메일 -->
						<div style="display: inline-block;">
							<br> <br>

							<h5>&nbsp;&nbsp;&nbsp;&nbsp;pooh_naver@naver.com</h5>
							<h4>&nbsp;&nbsp;&nbsp;&nbsp;석기순</h4>

							<br>
							<br>
							<br>
						</div>



						<!-- 설정 부분 -->
						<div class="kt-portlet__body">

							<div class="form-group row">
								<label><span class="required">&nbsp;&nbsp;닉네임 </span></label>
								<div class="col-lg-12">
									<input style="width: 400px;" class="form-control col-md-10"
										name="" value="" placeholder="중복 불가, 영문8자 이하...">
								</div>
							</div>
			
							<br>
							
							<div class="form-group row">
								<label><span class="required">&nbsp;&nbsp;소개글 </span></label>
								<div class="col-lg-12">
									<textarea style="width: 400px; height: 120px; resize: none;"
										class="form-control col-md-10" name=""
										placeholder="2000자 이내로 자기소개를 해주세요"></textarea>
								</div>
							</div>


							<!-- 버튼css 따로 만들어 놈 -->
							<style>
									.switchz {
										position: relative;
										height: 26px;
										width: 120px;
										background: rgba(0, 0, 0, 0.25);
										border-radius: 3px;
										box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0), 0 1px
											rgba(255, 255, 255, 0.3);
									}
									
									.switch-label {
										position: relative;
										z-index: 2;
										width: 58px;
										line-height: 26px;
										font-size: 11px;
										color: #888;;
										text-align: center;
										cursor: pointer;
									}
									
									.switch-label:hover {
										color: #fff;
									}
									
									.switch-input {
										display: none;
									}
									
									.switch-input:checked+.switch-label {
										font-weight: bold;
										color: rgba(0, 0, 0, 1);
										text-shadow: 0 1px 0px rgba(1, 1, 1, .1);
										transition: 0.15s ease-out;
									}
									
									.switch-input:checked+.switch-label-on ~ .switch-selection {
										left: 60px;
									}
									
									.switch-selection {
										display: block;
										position: absolute;
										z-index: 1;
										top: 2px;
										left: 2px;
										width: 58px;
										height: 22px;
										background: #888;
										border-radius: 3px;
										box-shadow: inset 0 1px rgba(255, 255, 255, 0.5), 0 0 2px
											rgba(0, 0, 0, 0);
										transition: left 0.15s ease-out;
									}
							</style>


							<br>

							<div class="form-group row">
								<label><span class="required">&nbsp;&nbsp;프로필 공개 여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></label>
								<div class="switchz">
									<input type="radio" class="switch-input" name="view"
										value="week" id="week" checked>
									<label for="week" class="switch-label switch-label-off">
										공개 </label> <input type="radio" class="switch-input" name="view" value="month" id="month">
									<label for="month" class="switch-label switch-label-on">
										비공개 </label> <span class="switch-selection"></span>
								</div>
							</div>
							<button type="button" style="display: inline-block;" class="btn btn-dark" onclick="RemoveIssue('02b02ecf-5f13-4a4e-b870-a602390cc43e');">수정</button>
						</div>
						
					</div>
				</div>


				<!-- 프로필 수정 끝 -->
	
              <div class="tab-pane fade" id="pwdModify" role="tabpanel" aria-labelledby="pwdModify-tab">
              
					<!-- 비밀번호 -->
					<br>
					<div class="passwordModifyForm" style="margin-left: 300px;">
						<div class="kt-portlet__body">

							<div class="form-group row">
								<label><span class="required">&nbsp;&nbsp;&nbsp;기존 비밀번호 확인 </span></label>
								<div class="col-lg-12">
									<!-- <div class="form-control form-control-view">칸반보드 UX  설정 REQ-001 문의</div> -->
									<input type="password" style="width: 400px;" class="form-control col-md-10" name="" value="" placeholder="">
								</div>
							</div>

							<br>
							
							<div class="form-group row">
								<label><span class="required">&nbsp;&nbsp;&nbsp;새로운 비밀번호 </span></label>
									<div class="col-lg-12">
									  <input type="password" style="width: 400px;" class="form-control col-md-10" name="" value="" placeholder="8~16자 영문 대 소문자, 숫자, 특수문자">
								   </div>
							</div>

							<br>
							
							<div class="form-group row">
								<label><span class="required">&nbsp;&nbsp;&nbsp;새로운 비밀번호 확인 </span></label>
										
								<div class="col-lg-12">
									<input type="password" style="width: 400px;"
										class="form-control col-md-10" name="" value="">
								</div>

							</div>

						</div>

						<button type="button" style="display: inline-block;" class="btn btn-dark" onclick="RemoveIssue('02b02ecf-5f13-4a4e-b870-a602390cc43e');">수정</button>
							
				</div>

			</div>
			<!-- 비빌번호 수정 끝  -->
              <div class="tab-pane fade" id="alarmSetting" role="tabpanel" aria-labelledby="alarmSetting-tab">
					
						
						<table class="allAlarm" style="width: 500px; height: 100px; text-align: center;">
							
							<tr>
								<td></td>
								<td>켜기</td>
								<td>끄기</td>
							</tr>

							<tr>
								<td><h2 style="text-align: right;">모든 알림</h2></td>
								<td>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"> <label class="form-check-label" for="flexRadioDefault1"></label>
									</div>
									
								</td>
								<td>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
										<label class="form-check-label" for="flexRadioDefault2"></label>
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<select class="form-control col-md-9 float-right" disabled>
									
										<option value="">프로젝트 별</option>
										<option value="">1</option>
										<option value="">1</option>
										<option value="">1</option>
									</select>
								</td>
								<td>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="flexRadioDisabled" id="flexRadioDisabled" disabled>
										<label class="form-check-label" for="flexRadioDisabled"></label>
									</div>
								</td>
								<td>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="flexRadioDisabled" id="flexRadioCheckedDisabled" checked disabled> 
										<label class="form-check-label" for="flexRadioCheckedDisabled"> </label>
									</div>

								</td>
							</tr>
						</table>
					</div>
			<!-- 알림설정 끝 -->
			
			
					<div class="tab-pane fade" id="memberWithdrawal" role="tabpanel"aria-labelledby="memberWithdrawal-tab">
						<br>
						
						<div class="memberWithdrawal" style="margin-left: 300px;">
							<div class="form-group row">
								<label><span class="required">&nbsp;&nbsp;&nbsp;비밀번호입력</span></label>
										
								<div class="col-lg-12">
									<input type="password" style="width: 400px;" class="form-control col-md-10" name="" value="" placeholder="탈퇴를 진행하려면 비밀번호를 입력해주세요...">
								</div>
							</div>

							<button type="button" style="display: inline-block;" data-toggle="modal" data-target="#modifyModal",  class="btn btn-dark" onclick="RemoveIssue('02b02ecf-5f13-4a4e-b870-a602390cc43e');">탈퇴</button>
						</div>

						<!-- 탈퇴 모달폼 -->
						<div id="modifyModal" class="modal modal-default fade" role="dialog">
							
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<br>
									
									<div class="modal-header">
										<h3 class="modal-title">회원 탈퇴</h3>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									
									<div class="modal-body" data-rno>
										<div class="form-group row">
											<div class="col-lg-12">
												<textarea class="form-control" name="?" style="height: 200px; resize: none;" placeholder="탈퇴 사유를 입력해주세요 최소 100글자..."></textarea>
												<br> 
												<label>회원 탈퇴를 하시면 현재까지 등록된 모든 정보와 컨텐츠가 삭제되며, 이는 복원이 불가능합니다. 정말 탈퇴하시겠습니까? </label>
											</div>
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
						
					</div>
				<!-- 마이페이지 탭 끝 -->
					
            </div>

          </div>
          <!-- x_content 끝 -->

        </div>
        <!-- 내 작업 바디 끝 -->
      </div>
      <!-- /page content -->
    <!-- include -->
    <script>
		includeHTML();
	</script>