<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/seok/seok.css"/>
</head>
<body>
	<!-- 알림설정 모달폼 -->
	<div id="alarmModal" class="modal modal-default fade" role="dialog">
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
							<label class="switch float-right">
							 <input type="checkbox" id="allAlertCheckBox" onClick="settingAlert();">
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
					<!-- <div class="form-group row">
						<div class="col-lg-12">
							<label class="switch float-right"> <input type="checkbox">
								<span class="slider round"></span>
							</label> <i class="fa fa-desktop fa-2x" style="float: left;"></i>
							<h5>&nbsp;프로젝트 야스오</h5>
						</div>
					</div> -->

					<!-- <hr style="margin: 10px;">
					
					<div class="form-group row">
						<div class="col-lg-12">
							<label class="switch float-right"> <input type="checkbox">
								<span class="slider round"></span>
							</label> <i class="fa fa-desktop fa-2x" style="float: left;"></i>
							<h5>&nbsp;프로젝트 피오라</h5>

						</div>

					</div>

					<hr style="margin: 10px;">

					<div class="form-group row">
						<div class="col-lg-12">
							<label class="switch float-right"> <input type="checkbox">
								<span class="slider round"></span>
							</label> <i class="fa fa-desktop fa-2x" style="float: left;"></i>
							<h5>&nbsp;프로젝트 마스터 이</h5>
						</div>
					</div> -->

				</div>

				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- 모달끝 -->
</body>
</html>