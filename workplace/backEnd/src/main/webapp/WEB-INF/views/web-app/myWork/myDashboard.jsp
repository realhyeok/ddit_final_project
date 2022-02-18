<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<div class="x_content row">
	<!-- 카드 리스트 -->	
	<div class="col-md-6 col-sm-6 taskBox" style="min-height:340px;">
		<div class="x_title">
			<h2>최근 업무</h2>
			<a class="more float-right mt-2 text-dark" href="javascript:document.getElementById('task-tab').click();">
				더보기<i class="fa fa-arrow-right"></i>
			</a>
			<div class="clearfix"></div>
		</div>
		<div class="x_content d-flex justify-content-center cBox">
			<div id="canvasBox" class="chart-container" style="position: relative; height:200px; width:250px">
				<h2 class='text-dark text-center'>업무가 존재하지 않습니다.</h2>
			</div>
		</div>
	</div>
	
	<div class="col-md-6 col-sm-6" style="min-height:340px;">
		<div class="x_title">
			<h2>최근 이슈</h2>
			<a class="more float-right mt-2 text-dark" href="javascript:document.getElementById('issue-tab').click();">
				더보기<i class="fa fa-arrow-right"></i>
			</a>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<div class="myDashboardTable" id="myIssueDashboard"></div>
		</div>
	</div>
	
	<div class="col-md-6 col-sm-6" style="min-height:340px;">
		<div class="x_title">
			<h2>최근 메일</h2>
			<a class="more float-right mt-2 text-dark" href="javascript:document.getElementById('mail-tab').click();">
				더보기<i class="fa fa-arrow-right"></i>
			</a>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<div class="myDashboardTable" id="myReceiveMailDashboard"></div>
		</div>
	</div>
	
	<div class="col-md-6 col-sm-6" style="min-height:340px;">
		<div class="x_title">
			<h2>최근 히스토리</h2>
			<a class="more float-right mt-2 text-dark" href="javascript:document.getElementById('history-tab').click();">
				더보기<i class="fa fa-arrow-right"></i>
			</a>
			<div class="clearfix"></div>
		</div>

		<div class="x_content">
			<div id="myHistoryDashboard"></div>
		</div>
	</div>

	<div class="col-md-12 col-sm-12" style="min-height:340px;">
		<div class="x_title">
			<h2>최근 문서</h2>
			<a class="more float-right mt-2 text-dark" href="javascript:document.getElementById('document-tab').click();">
				더보기<i class="fa fa-arrow-right"></i>
			</a>
			<div class="clearfix"></div>
		</div>

		<div class="x_content">
			<div class="myDashboardTable" id="myDocumentDashboard"></div>
		</div>
	</div>
</div>