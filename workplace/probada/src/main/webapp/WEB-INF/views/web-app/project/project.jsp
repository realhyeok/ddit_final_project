<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- page content -->
<div class="right_col" role="main">
	<!-- 내 작업 바디 시작 -->
	<div class="x_panel">
		<div class="x_title">
			<h2>
				<i class="fa fa-edit"></i> 프로젝트 <small>* 커스터 마이징 해주세요.</small>
			</h2>

			<div class="clearfix"></div>
		</div>

		<div class="x_content">
			<ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">프로젝트 리스트</a></li>
			</ul>
			<!-- 테이블 데이터 리스트 -->
			<div class="x_content">
				<div class="row">
					<div class="col-sm-12">
						<div class="card-box table-responsive">
							<p class="text-muted font-13 m-b-30">모든 프로젝트 리스트를 출력합니다.</p>
							<div id="test-all" class="col-sm-12">
								<div id="test" class="d-flex justify-content-end"></div>
								<div id="test2" class="d-flex justify-content-end"></div>
							</div>
							<table id="project-table" class="table table-striped table-bordered"
								name="data-table-form" style="width: 100%"></table>
						</div>
					</div>
				</div>
			</div>
			<!-- 리스트 종료 -->
		</div>
	</div>
	<!-- 내 작업 바디 끝 -->
</div>

<!-- /page content -->