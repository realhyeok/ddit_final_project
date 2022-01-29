<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div id="issueDetailFormTarget"></div>
    <script type="text/x-handlebars-template" id="issueDetailForm">
      <div class="x_title">
        <h2><i class="glyphicon glyphicon-exclamation-sign"></i>&nbsp;&nbsp;&nbsp;이슈 - 상세</h2>
        <div class="clearfix">
			<button type="button" class="btn btn-sm btn-secondary float-right" onclick="readMileIssue();">목록</button>
        	<button type="button" class="btn btn-sm btn-primary float-right" onclick="getOverlayIssueModifyTemplate('issueModifyFormTemplate','/app/issue/getIssueByIssueNo','{{issueNo}}')">수정</button>
        	<button type="button" class="btn btn-sm btn-danger float-right">삭제</button>
		</div>
      </div>
      <!-- 제목 끝 -->
      <!-- 이슈 디테일 시작 -->
      <div class="form-group row">
        <div class="col-sm-6">
          <label>제목 :</label>
          <div class="form-control form-control-sm form-control-view">{{issueVO.title}}</div>
        </div>
        <div class="col-sm-6">
          <label>프로젝트명 :</label>
          <div class="form-control form-control-sm form-control-view">{{projTitle}}</div>
        </div>
      </div>

		<div class="form-group row">
			<div class="col-sm-6">
				<label>담당자</label>
					<input type="text" class="form-control form-control-sm form-control-view"
					value="{{issueVO.userId}}">
			</div>
			<div class="col-sm-6">
				<label class="control-label">중요도</label>
					<div class="form-control form-control-sm form-control-view">{{issueVO.important}}</div>
			</div>
		</div>

      <div class="form-group row">
        <div class="col-sm-6">
          <label>발생일자 :</label>
          <div class="form-control form-control-sm form-control-view">{{formatTime startdate "YYYY년 MM월 DD일"}}</div>
        </div>
        <div class="col-sm-6">
          <label>마감일자 :</label>
          <div class="form-control form-control-sm form-control-view">{{formatTime enddate "YYYY년 MM월 DD일"}}</div>
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-12">
          <label>이슈 내용 :</label>
          <div class="form-control form-control-sm form-control-view" style="height:120px;">{{issueVO.content}}</div>
        </div>
      </div>


      <div class="form-group row">
        <div class="col-sm-12">
          <label>첨부파일 :</label>
          <div class="form-control form-control-sm form-control-view" style="height:120px;">
            <li>
              <i class="glyphicon glyphicon-floppy-disk"></i>
              <span>업무파일.jpg</span>
            </li>
            <li>
              <i class="glyphicon glyphicon-floppy-disk"></i>
              <span>jabra.html</span>
            </li>
          </div>
        </div>
      </div>
      <!-- 이슈 디테일 끝 -->
</script>

	<div id="issueDetailReplyForm"></div>