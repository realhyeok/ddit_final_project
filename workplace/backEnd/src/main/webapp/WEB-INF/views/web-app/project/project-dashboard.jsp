<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<!-- dashboard-stat start -->
	<div class="row" id="project-dashboard1">
	<script type="text/x-handlebars-template" id="project-dashboard-card">
		<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12"
			style="flex: 0 0 20%; max-width: 20%;">

			<div class="dashboard-stat bordered grey-cararra fadeInDown animated">
				<div class="visual">
					<i class="glyphicon glyphicon-remove"></i>
				</div>
				<div class="details">
					<h3 style="color: #5C9BD1;">
						21<small class="font-blue-sharp"></small>
					</h3>
					<div class="noti-desc">업무</div>
				</div>
				<a class="more" href="/ToDoList"> View More <i
					class="fa fa-arrow-right"></i>
				</a>
			</div>

		</div>

		<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12"
			style="flex: 0 0 20%; max-width: 20%;">

			<div class="dashboard-stat bordered grey-cararra fadeInDown animated">
				<div class="visual">
					<i class="glyphicon glyphicon-ok"></i>
				</div>
				<div class="details">
					<h3 style="color: #5C9BD1;">
						21<small class="font-blue-sharp"></small>
					</h3>
					<div class="noti-desc">마일스톤</div>
				</div>
				<a class="more" href="/ToDoList"> View More <i
					class="fa fa-arrow-right"></i>
				</a>
			</div>

		</div>

		<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12"
			style="flex: 0 0 20%; max-width: 20%;">

			<div class="dashboard-stat bordered grey-cararra fadeInDown animated">
				<div class="visual">
					<i class="fa fa-pencil-square"></i>
				</div>
				<div class="details">
					<h3 style="color: #4DB3A2;">
						0 <small class="font-green-sharp"></small>
					</h3>
					<div class="noti-desc">이슈</div>
				</div>
				<a class="more" href="/ProjectChangeRequest"> View More <i
					class="fa fa-arrow-right"></i>
				</a>
			</div>

		</div>

		<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12"
			style="flex: 0 0 20%; max-width: 20%;">

			<div class="dashboard-stat bordered grey-cararra fadeInDown animated">
				<div class="visual">
					<i class="fa fa-send"></i>
				</div>
				<div class="details">
					<h3 style="color: #f36a5a;">
						<span title="보낸 요청">8</span>
					</h3>
					<div class="noti-desc">문서</div>
				</div>
				<a class="more" href="/ProjectApproval"> View More <i
					class="fa fa-arrow-right"></i>
				</a>
			</div>

		</div>

		<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12"
			style="flex: 0 0 20%; max-width: 20%;">

			<div class="dashboard-stat bordered grey-cararra fadeInDown animated">
				<div class="visual">
					<i class="fa fa-group"></i>
				</div>
				<div class="details">
					<h3 style="color: #bfd042;">
						<span title="받은 요청">0</span>
					</h3>
					<div class="noti-desc">멤버</div>
				</div>
				<a class="more" href="/File"> View More <i
					class="fa fa-arrow-right"></i>
				</a>
			</div>

		</div>

	</script>
	</div>

	<!-- dashboard-stat end -->



		<!-- 카드 리스트 -->
	<div class="col-md-6 col-sm-6 pl-0">
			<div class="x_title">
				<h2>업무 통계</h2>
				<a class="more float-right mt-2" href="javascript:on();">
					더보기
					<i class="fa fa-arrow-right"></i>
				</a>
				<div class="clearfix"></div>
			</div>
			<div class="x_content d-flex justify-content-center">
				<div class="chart-container" style="position: relative; height:200px; width:200px">
                	<canvas id="custom_doughnutChart"></canvas>
				</div>
			</div>
		</div>
<!-- dashboard-table left end -->


<div class="col-md-6 col-sm-6 pl-0  ">
	<div class="x_title">
		<h2>이슈 통계</h2>
		<a class="more float-right mt-2" href="javascript:on();"> 더보기 <i
			class="fa fa-arrow-right"></i>
		</a>
		<div class="clearfix"></div>
	</div>
	<div class="x_content2">
		<div id="graphx"
			style="width: 100%; height: 300px; position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
			<svg height="300" version="1.1" width="459"
				xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				style="overflow: hidden; position: relative; left: -0.625px; top: -0.1875px;">
				<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël @@VERSION</desc>
				<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
				<text x="20.5" y="259" text-anchor="end" font-family="sans-serif"
					font-size="12px" stroke="none" fill="#888888"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
					font-weight="normal">
				<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan></text>
				<path fill="none" stroke="#aaaaaa" d="M33,259H434"
					stroke-width="0.5"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
				<text x="20.5" y="200.5" text-anchor="end" font-family="sans-serif"
					font-size="12px" stroke="none" fill="#888888"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
					font-weight="normal">
				<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">5</tspan></text>
				<path fill="none" stroke="#aaaaaa" d="M33,200.5H434"
					stroke-width="0.5"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
				<text x="20.5" y="142" text-anchor="end" font-family="sans-serif"
					font-size="12px" stroke="none" fill="#888888"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
					font-weight="normal">
				<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">10</tspan></text>
				<path fill="none" stroke="#aaaaaa" d="M33,142H434"
					stroke-width="0.5"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
				<text x="20.5" y="83.5" text-anchor="end" font-family="sans-serif"
					font-size="12px" stroke="none" fill="#888888"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
					font-weight="normal">
				<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">15</tspan></text>
				<path fill="none" stroke="#aaaaaa" d="M33,83.5H434"
					stroke-width="0.5"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
				<text x="20.5" y="25" text-anchor="end" font-family="sans-serif"
					font-size="12px" stroke="none" fill="#888888"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
					font-weight="normal">
				<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">20</tspan></text>
				<path fill="none" stroke="#aaaaaa" d="M33,25H434" stroke-width="0.5"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
				<text x="383.875" y="271.5" text-anchor="middle"
					font-family="sans-serif" font-size="12px" stroke="none"
					fill="#888888"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
					font-weight="normal" transform="matrix(1,0,0,1,0,8)">
				<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2월</tspan></text>
				<text x="283.625" y="271.5" text-anchor="middle"
					font-family="sans-serif" font-size="12px" stroke="none"
					fill="#888888"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
					font-weight="normal" transform="matrix(1,0,0,1,0,8)">
				<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">1월</tspan></text>
				<text x="183.375" y="271.5" text-anchor="middle"
					font-family="sans-serif" font-size="12px" stroke="none"
					fill="#888888"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
					font-weight="normal" transform="matrix(1,0,0,1,0,8)">
				<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">12월</tspan></text>
				<text x="83.125" y="271.5" text-anchor="middle"
					font-family="sans-serif" font-size="12px" stroke="none"
					fill="#888888"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
					font-weight="normal" transform="matrix(1,0,0,1,0,8)">
				<tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">11월</tspan></text>
				<rect x="55.53125" y="200.5" width="23.0625" height="58.5" rx="0"
					ry="0" fill="#26b99a" stroke="none" fill-opacity="1"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				<rect x="81.59375" y="171.25" width="23.0625" height="87.75" rx="0"
					ry="0" fill="#34495e" stroke="none" fill-opacity="1"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				<rect x="155.78125" y="171.25" width="23.0625" height="87.75" rx="0"
					ry="0" fill="#26b99a" stroke="none" fill-opacity="1"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				<rect x="181.84375" y="112.75" width="23.0625" height="146.25"
					rx="0" ry="0" fill="#34495e" stroke="none" fill-opacity="1"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				<rect x="256.03125" y="142" width="23.0625" height="117" rx="0"
					ry="0" fill="#26b99a" stroke="none" fill-opacity="1"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				<rect x="282.09375" y="171.25" width="23.0625" height="87.75" rx="0"
					ry="0" fill="#34495e" stroke="none" fill-opacity="1"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				<rect x="356.28125" y="200.5" width="23.0625" height="58.5" rx="0"
					ry="0" fill="#26b99a" stroke="none" fill-opacity="1"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				<rect x="382.34375" y="142" width="23.0625" height="117" rx="0"
					ry="0" fill="#34495e" stroke="none" fill-opacity="1"
					style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
				</svg>
			<div class="morris-hover morris-default-style"
				style="left: 251.625px; top: 102px; display: none;">
				<div class="morris-hover-row-label">2015 Q3</div>
				<div class="morris-hover-point" style="color: #26B99A">Y: 4</div>
				<div class="morris-hover-point" style="color: #34495E">Z: 3</div>
				<div class="morris-hover-point" style="color: #ACADAC">A: 2</div>
			</div>
		</div>
	</div>
</div>


<div class="col-md-6 col-sm-6 pl-0">
		<div class="rounded rounded-3" style="height: 300px">
			<div class="x_title">
				<h2>최근 업무</h2>
				<a class="more float-right mt-2" href="javascript:on();">
					더보기
					<i class="fa fa-arrow-right"></i>
				</a>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="row d-flex justify-content-evenly">
					<div class="col-sm-3 d-flex justify-content-center flex-wrap">
						<a href="javascript:"><i class="fa fa-folder-o fa-5x"></i></a>
						<p class="text-truncate">업무페이지</p>
					</div>
					<div class="col-sm-3 d-flex justify-content-center flex-wrap">
						<a href="javascript:"><i class="fa fa-folder-o fa-5x"></i></a>
						<p class="text-truncate">이슈페이지</p>
					</div>
					<div class="col-sm-3 d-flex justify-content-center flex-wrap">
						<a href="javascript:"><i class="fa fa-folder-o fa-5x"></i></a>
						<p class="text-truncate">아카이브배포</p>
					</div>
					<div class="col-sm-3 d-flex justify-content-center flex-wrap">
						<a href="javascript:"><i class="fa fa-folder-o fa-5x"></i></a>
						<p class="text-truncate">톰캣업데이트</p>
					</div>

				</div>
			</div>
		</div>
	</div>
<!-- dashboard-table left end -->

<!-- dashboard-table right start -->

<div class="col-md-6 col-sm-6 pr-0">
	<div class="rounded rounded-3" style="height: 300px">
		<div class="x_title">
			<h2>최근 이슈</h2>

			<a class="more float-right mt-2" href="javascript:on();">
					더보기
					<i class="fa fa-arrow-right"></i>
				</a>
				<div class="clearfix"></div>
		</div>
		<div id="carouselExampleIndicators"  class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators mb-0">
    			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="bg-secondary active"></li>
    			<li data-target="#carouselExampleIndicators" data-slide-to="1"class="bg-secondary"></li>
    			<li data-target="#carouselExampleIndicators" data-slide-to="2"class="bg-secondary"></li>
  			</ol>

				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="mail_list">
							<div class="left">
								<i class="fa fa-circle"></i> <i class="fa fa-edit"></i>
							</div>
							<div class="right">
								<div class="text-right">
									<h3>
										<small>5분 전</small>
									</h3>
								</div>
								<h3 class="text-truncate">overdriven 오류에 관해서...</h3>
								<p class="text-truncate">Servlet-context에서 발생하는 오류인데 아무리 찾아봐도 답이 안나오네요 혹시 아시는분 </p>
							</div>
						</div>
						<div class="mail_list">
							<div class="left">
								<i class="fa fa-circle"></i> <i class="fa fa-edit"></i>
							</div>
							<div class="right">
								<div class="text-right">
									<h3>
										<small>1일 전</small>
									</h3>
								</div>
								<h3 class="text-truncate">자바스크립트가 사라졌어요</h3>
								<p class="text-truncate">오늘 이클립스를 키니깐 자바스크립트가 사라져있습니다. 혹시 방법
									아시는분 있나요?</p>
							</div>
						</div>
						<div class="mail_list border border-white">
							<div class="left">
								<i class="fa fa-circle"></i> <i class="fa fa-edit"></i>
							</div>
							<div class="right">
								<div class="text-right">
									<h3>
										<small>1시간 전</small>
									</h3>
								</div>
								<h3 class="text-truncate">egov project import시 발생하는 에러</h3>
								<p class="text-truncate">부트스트랩 리소스에서 에러가 발생하는데 정확히 어느부분에서 발생하는지 모르겠습니다.</p>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="mail_list">
							<div class="left">
								<i class="fa fa-circle"></i> <i class="fa fa-edit"></i>
							</div>
							<div class="right">
								<div class="text-right">
									<h3>
										<small>5분 전</small>
									</h3>
								</div>
								<h3 class="text-truncate">김기현 "이재명, 제보자 죽음에 대한 도의적 책임져야"</h3>
								<p class="text-truncate">김기현 국민의힘 원내대표가 더불어민주당 이재명 대선후보의
									'변호사비 대납 의혹'을 최초로 제보했던 이 모  씨가 숨진 채 발견된 것과 관련해 "죽음에 대한 도의적 책임은
									이 후보가 져야 한다"고 주장했습니다.</p>
							</div>
						</div>
						<div class="mail_list">
							<div class="left">
								<i class="fa fa-circle"></i> <i class="fa fa-edit"></i>
							</div>
							<div class="right">
								<div class="text-right">
									<h3>
										<small>1일 전</small>
									</h3>
								</div>
								<h3 class="text-truncate">90년생부터 국민연금 못받나…"'고령화·노인빈곤 심화' 韓
									연금개혁 시급"</h3>
								<p class="text-truncate">한국이 주요 5개국(G5)에 비해 고령화 속도는 빠르고 노인빈곤
									문제가 심화하고 있지만 노후소득을 보장하는 연금 제도가 미흡해 개혁이 필요하다는 주장이 나왔다.</p>
							</div>
						</div>
						<div class="mail_list border border-white">
							<div class="left">
								<i class="fa fa-circle"></i> <i class="fa fa-edit"></i>
							</div>
							<div class="right">
								<div class="text-right">
									<h3>
										<small>1시간 전</small>
									</h3>
								</div>
								<h3 class="text-truncate">2021년 베스트 애널리스트는 누구</h3>
								<p class="text-truncate">2021년 국내 증시 키워드는 ‘코스피 3000·코스닥 1000
									돌파’로 요약된다. 2020년 코로나19 발발 이후의 폭등장이 어느 선에서 안착하느냐를 시험하는 시기였다.</p>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="mail_list">
							<div class="left">
								<i class="fa fa-circle"></i> <i class="fa fa-edit"></i>
							</div>
							<div class="right">
								<div class="text-right">
									<h3>
										<small>5분 전</small>
									</h3>
								</div>
								<h3 class="text-truncate">지뢰 100개 이상 찾았다…캄보디아 '국민 쥐' 하늘나라로</h3>
								<p class="text-truncate">세계적으로 가장 인기 많은 쥐하면 단연 미키마우스일텐데요,
									하지만 캄보디아에서는 이에 못지않게 국민적 사랑을 받는 쥐가 있다고 합니다.</p>
							</div>
						</div>
						<div class="mail_list">
							<div class="left">
								<i class="fa fa-circle"></i> <i class="fa fa-edit"></i>
							</div>
							<div class="right">
								<div class="text-right">
									<h3>
										<small>1일 전</small>
									</h3>
								</div>
								<h3 class="text-truncate">도심에 나타난 타조들…야밤중 벌어진 '도주극'</h3>
								<p class="text-truncate">이번엔 중국의 광저우시로 가보시죠. 도심 도로에 웬 타조들이
									뛰어다니고 있는데요. 무려 80마리나 되는 타조가 인근 농장에서 탈출한 거라고 하네요.</p>
							</div>
						</div>
						<div class="mail_list border border-white">
							<div class="left">
								<i class="fa fa-circle"></i> <i class="fa fa-edit"></i>
							</div>
							<div class="right">
								<div class="text-right">
									<h3>
										<small>1시간 전</small>
									</h3>
								</div>
								<h3 class="text-truncate">'1경 원' 몰린 LG엔솔 청약…LG화학 주주는 운다</h3>
								<p class="text-truncate">친절한 경제 시간입니다. 오늘(13일)도 한지연 기자와
									함께하겠습니다. 이달 말에 LG에너지솔루션이 이제 상장을 하나 봐요.</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

<!-- dashboard-table center start -->
<div class="col-md-6 col-sm-6">
			<div class="x_title">
				<h2>
					최근 히스토리
				</h2>
				<a class="more float-right mt-2" href="#">
					더보기
					<i class="fa fa-arrow-right"></i>
				</a>
				<div class="clearfix"></div>
			</div>

			<div class="x_content">
				<ul class="list-unstyled top_profiles scroll-view">
					<li class="media event">
						<img src="../../resources/asserts/images/img.jpg" alt="img" style="margin:5px 10px 5px 3px;height:50px;width:50px;border-radius:100%;">
						<div class="media-body">
							<p><strong>마창수</strong></p>
							<p>이슈를 등록하였습니다.</p>
							<p><small>2022-01-01</small> </p>
						</div>
						<button type="button" class="btn btn-dark" style="margin:5px 10px 5px 3px;height:50px;width:50px;">go</button>
					</li>
					<li class="media event">
						<img src="../../resources/asserts/images/img.jpg" alt="img" style="margin:5px 10px 5px 3px;height:50px;width:50px;border-radius:100%;">
						<div class="media-body">
							<p><strong>석기현</strong></p>
							<p>이슈를 수정하였습니다.</p>
							<p><small>2022-01-01</small> </p>
						</div>
						<button type="button" class="btn btn-dark" style="margin:5px 10px 5px 3px;height:50px;width:50px;">go</button>
					</li>
					<li class="media event">
						<img src="../../resources/asserts/images/img.jpg" alt="img" style="margin:5px 10px 5px 3px;height:50px;width:50px;border-radius:100%;">
						<div class="media-body">
							<p><strong>양기욱</strong></p>
							<p>이슈를 해결하였습니다.</p>
							<p><small>2022-01-01</small> </p>
						</div>
						<button type="button" class="btn btn-dark" style="margin:5px 10px 5px 3px;height:50px;width:50px;">go</button>
					</li>
				</ul>
			</div>
	</div>

<div class="col-md-6 col-sm-6">
			<div class="x_title">
				<h2>
					최근 문서
				</h2>
				<a class="more float-right mt-2" href="#">
					더보기
					<i class="fa fa-arrow-right"></i>
				</a>
				<div class="clearfix"></div>
			</div>

			<div class="x_content">
				<table class="table">
					<thead>
						<tr>
							<th>문서명</th>
							<th>프로젝트명</th>
							<th>등록자</th>
							<th>갱신일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">수학의 정석</th>
							<td>수학공부 프로젝트</td>
							<td>마창수</td>
							<td>2022-02-02</td>
						</tr>
						<tr>
							<th scope="row">사상의 이해</th>
							<td>현대사상 프로젝트</td>
							<td>양기욱</td>
							<td>2022-02-02</td>
						</tr>
						<tr>
							<th scope="row">경제학원론</th>
							<td>경제 위기</td>
							<td>김진혁</td>
							<td>2022-02-02</td>
						</tr>
					</tbody>
				</table>
			</div>
	</div>


