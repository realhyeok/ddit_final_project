<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#myMileOverlay {
				position: fixed;
				display: none;
				width: 500px;
				height: 100%;
				top: 0;
				right: 0;
				bottom: 0;
				border: 1px solid #ededed;
				background-color: white;
				z-index: 200;
			}
		</style>
	</head>
	<body>
		<!-- 오버레이 시작 -->
		<div id="myMileOverlay"></div>
		<!-- 오버레이 끝 -->
		
		<script type="text/x-handlebars-template" id="myMileRegistFormTemplate">
			<div class="row" id="fadeInMyIssueContent">
				<div class="col-md-12">
					<div class="x_panel">
						<div class="x_title row d-flex justify-content-between">
							<h5 class="title">
								<i class="fa fa-clone"></i> <span class="task-bold task-sm">마일스톤 등록</span>
							</h5>
							<div class="clearfix">
								<button onclick="cancelMyMilestone();" class="btn btn-primary btn-sm">X</button>
							</div>
						</div>
						<div class="x_content">
							<div class="row">
								<div class="x_content">
									<form id="registMyMileForm" method="post" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
										<!-- 프로젝트명 -->
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="projTitle">프로젝트명	</label>
											<div class="col-md-6 col-sm-6 ">
													{{projNo}}
												<select class="form-control form-control-sm" id="myProjTitle" name="projNo">
													{{#each .}}
														<option value="{{projNo}}">{{projTitle}}</option>
													{{/each}}
		            							</select>
											</div>
										</div>
										<div class="item form-group">
		          							<label class="col-form-label col-md-3 col-sm-3 label-align for="userNickname">제기자</label>
											<div class="col-md-6 col-sm-6 ">
												<select class="form-control form-control-sm" id="userNickname" name="userId" reaonly>
		              								<option value="${userVO.userId}">${userVO.nickname}</option>
		            							</select>
											</div>
		        						</div>
										<div class="item form-group">
		          							<label class="col-form-label col-md-3 col-sm-3 label-align for="status">마일스톤 상태</label>
											<div class="col-md-6 col-sm-6 ">
		            							<select class="form-control form-control-sm" id="status" name="status">
		              								<option	value="B301">미완료</option>
		              								<option	value="B302">완료</option>
		            							</select>
											</div>
		        						</div>
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="title">마일스톤 제목</label>
											<div class="col-md-6 col-sm-6 ">
												<input type="text" id="title" class="form-control form-control-sm" name="title">
											</div>
										</div>
										<div class=form-group">
											<textarea class="myMileRegistSummernote" name="content"></textarea>
										</div>
										<div id="MileIssueTagFormGroup" class=form-group">
											<label class=" label-align mt-3">이슈 등록</label>
											<select id="myMileIssueTag" name="myIssueList" multiple="multiple" data-placeholder="추가하실 이슈를 선택해주세요.">
		        							</select>
										</div>
										<div class="col-md-12 col-sm-12 mt-3" style="text-align:center;">
											<button type="button" class="btn btn-success" onclick="registMyMilestone();">등록</button>
											<button class="btn btn-primary" type="button" onclick="cancelMyMilestone();">취소</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</script>
		
		<script type="text/x-handlebars-template" id="myMileModifyFormTemplate">
			<div class="row" id="fadeInMyIssueContent">
				<div class="col-md-12">
					<div class="x_panel">
						<div class="x_title row d-flex justify-content-between">
							<h5 class="title"><i class="fa fa-clone">
								</i> <span class="task-bold task-sm">마일스톤 수정</span>
							</h5>
							<div class="clearfix">
								<button onclick="cancelMyMilestone();" class="btn btn-primary btn-sm">X</button>
							</div>
						</div>
						<div class="x_content">
							<div class="row">
								<div class="x_content">
									<form id="modifyMyMileForm" method="post" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
										<!-- 프로젝트명 -->
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="projTitle">프로젝트명</label>
											<div class="col-md-6 col-sm-6 ">
												<input type="text" id="projTitle" required="required" class="form-control form-control-sm" name="projTitle" value="{{mileVO.projTitle}}" disabled>
												<input type="hidden" name="mileNo" value="{{mileVO.mileNo}}">
												<input type="hidden" name="projNo" value="{{mileVO.projNo}}">
											</div>
										</div>
										<div class="item form-group">
          									<label class="col-form-label col-md-3 col-sm-3 label-align for="userNickname">제기자</label>
											<div class="col-md-6 col-sm-6 ">
            									<select class="form-control form-control-sm" id="userNickname" name="userId">
              										<option value="{{mileVO.userId}}">{{mileVO.nickname}}</option>
            									</select>
											</div>
        								</div>
										<div class="item form-group">
          									<label class="col-form-label col-md-3 col-sm-3 label-align for="status">마일스톤 상태</label>
											<div class="col-md-6 col-sm-6 ">
            									<select class="form-control form-control-sm" id="status" name="status">
													<option
														{{#ifCond mileVO.status "==" "B301"}}
															selected
														{{/ifCond}}
													value="B301">미완료</option>
              										<option
														{{#ifCond mileVO.status "==" "B302"}}
              												selected
														{{/ifCond}}
													value="B302">완료</option>
												</select>
											</div>
										</div>
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="title">마일스톤 제목</label>
											<div class="col-md-6 col-sm-6 ">
												<input type="text" id="title" class="form-control form-control-sm" name="title" value="{{mileVO.title}}">
											</div>
										</div>
										<div class="form-group">
											<textarea class="myMileModifySummernote" name="content" >{{{mileVO.content}}}</textarea>
										</div>
										<div class="form-group">
											<label class=" label-align mt-3">이슈 등록 </label>
											<select id="myMileModifyIssueTag" name="issueList" multiple="multiple" data-placeholder="추가하실 이슈를 선택해주세요">
												{{#each wholeIssueList}}
												<option value="{{issueNo}}">{{title}}</option>
												{{/each}}
											</select>
										</div>
										<div class="col-md-7 col-sm-7 offset-md-3 mt-3" style="text-align:center;">
											<button type="button" class="btn btn-success" onclick='modifyMyMilestone();'>수정</button>
											<button type="button" class="btn btn-primary" onclick="cancelMyMilestone();">취소</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</script>
	
		<script>
			function printData(data, target, templateObject){
				var template = Handlebars.compile(templateObject.html());
				var html = template(data);
				target.html('').html(html);
			}
			
			function myMileRegistForm(data){
				printData(data, $('#myMileOverlay'), $('#myMileRegistFormTemplate'));
			}

			function myMileModifyForm(data){
				printData(data, $('#myMileOverlay'), $('#myMileModifyFormTemplate'));
			}
			
			function cancelMyMilestone(){
				myOverlayOff('#myMileOverlay');
			}
			
			Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {
			    switch (operator) {
			        case '==':
			            return (v1 == v2) ? options.fn(this) : options.inverse(this);
			        case '===':
			            return (v1 === v2) ? options.fn(this) : options.inverse(this);
			        case '!=':
			            return (v1 != v2) ? options.fn(this) : options.inverse(this);
			        case '!==':
			            return (v1 !== v2) ? options.fn(this) : options.inverse(this);
			        case '<':
			            return (v1 < v2) ? options.fn(this) : options.inverse(this);
			        case '<=':
			            return (v1 <= v2) ? options.fn(this) : options.inverse(this);
			        case '>':
			            return (v1 > v2) ? options.fn(this) : options.inverse(this);
			        case '>=':
			            return (v1 >= v2) ? options.fn(this) : options.inverse(this);
			        case '&&':
			            return (v1 && v2) ? options.fn(this) : options.inverse(this);
			        case '||':
			            return (v1 || v2) ? options.fn(this) : options.inverse(this);
			        default:
			            return options.inverse(this);
			    }
			});
		</script>
	</body>
</html>
	