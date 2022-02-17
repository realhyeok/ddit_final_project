<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<div class="x_content row">
	<!-- 카드 리스트 -->	
	<div class="col-md-6 col-sm-6">
		<div class="x_panel m-0" style="min-height:340px;">
			<div class="x_title">
				<h2>최근 업무</h2>
				<a class="more float-right mt-2 text-dark" href="javascript:document.getElementById('task-tab').click();">
					더보기
					<i class="fa fa-arrow-right"></i>
				</a>
				<div class="clearfix"></div>
			</div>
			<div class="x_content d-flex justify-content-center">
				<div class="chart-container" style="position: relative; height:200px; width:200px">
                	<canvas id="myTaskChartDashboard"></canvas>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-md-6 col-sm-6">
		<div class="x_panel_origin" style="min-height:340px;">
			<div class="x_title">
				<h2>최근 이슈</h2>
				<a class="more float-right mt-2 text-dark" href="javascript:document.getElementById('issue-tab').click();">
					더보기
					<i class="fa fa-arrow-right"></i>
				</a>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div id="myIssueDashboard"></div>
			</div>
		</div>
	</div>
	
	<div class="col-md-6 col-sm-6">
		<div class="x_panel_origin" style="min-height:340px;">
			<div class="x_title">
				<h2>최근 메일</h2>
				<a class="more float-right mt-2 text-dark" href="javascript:document.getElementById('mail-tab').click();">
					더보기
					<i class="fa fa-arrow-right"></i>
				</a>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div id="myReceiveMailDashboard"></div>
			</div>
		</div>
	</div>
	
	<div class="col-md-6 col-sm-6">
		<div class="x_panel_origin" style="min-height:340px;">
			<div class="x_title">
				<h2>
					최근 히스토리
				</h2>
				<a class="more float-right mt-2 text-dark" href="javascript:document.getElementById('history-tab').click();">
					더보기
					<i class="fa fa-arrow-right"></i>
				</a>
				<div class="clearfix"></div>
			</div>

			<div class="x_content">
				<div id="myHistoryDashboard"></div>
			</div>
		</div>
	</div>

	<div class="col-md-12 col-sm-12">
		<div class="x_panel_origin" style="min-height:340px;">
			<div class="x_title">
				<h2>
					최근 문서
				</h2>
				<a class="more float-right mt-2 text-dark" href="javascript:document.getElementById('document-tab').click();">
					더보기
					<i class="fa fa-arrow-right"></i>
				</a>
				<div class="clearfix"></div>
			</div>

			<div class="x_content">
				<div id="myDocumentDashboard"></div>
			</div>
		</div>
	</div>
</div>
