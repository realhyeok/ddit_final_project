<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div id="issueDetailFormTarget"></div>
    <script type="text/x-handlebars-template" id="issueDetailForm">
      <div class="x_title">
        <h2><i class="glyphicon glyphicon-exclamation-sign"></i>&nbsp;&nbsp;&nbsp;이슈 - 상세</h2>
        <div class="clearfix">
			<button type="button" class="btn btn-sm btn-secondary float-right" onclick="readMileIssue();">목록</button>
        	<button type="button" class="btn btn-sm btn-primary float-right" onclick="getOverlayIssueModifyTemplate('issueModifyFormTemplate','/app/issue/getIssueByIssueNo','{{issueVO.issueNo}}')">수정</button>
        	<button type="button" class="btn btn-sm btn-danger float-right" onclick="deleteIssueByNo('/app/issue/removeIssue','{{issueVO.issueNo}}');">삭제</button>
		</div>
      </div>
      <!-- 제목 끝 -->
      <!-- 이슈 디테일 시작 -->
      <div class="form-group row">
        <div class="col-sm-6">
          <label>제목 :</label>
			<input type="hidden" id="issueNo" value="{{issueVO.issueNo}}">
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
					value="{{issueVO.nickname}}">
			</div>
			<div class="col-sm-6">
				<label class="control-label">중요도</label>
					<div class="form-control form-control-sm form-control-view">{{issueVO.important}}</div>
			</div>
		</div>

      <div class="form-group row">
        <div class="col-sm-6">
          <label>발생일자 :</label>
          <div class="form-control form-control-sm form-control-view">{{formatTime issueVO.startdate "YYYY년 MM월 DD일"}}</div>
        </div>
        <div class="col-sm-6">
          <label>마감일자 :</label>
          <div class="form-control form-control-sm form-control-view">{{formatTime issueVO.enddate "YYYY년 MM월 DD일"}}</div>
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-12">
          <label>이슈 내용 :</label>
          <div class="form-control form-control-sm form-control-view" style="height:120px;">{{{issueVO.content}}}</div>
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

	<!-- 이슈 디테일 댓글 시작 -->
      <div class="form-group row">
        <div class="col-sm-12">
          <div class="card mb-2">
            <div class="card-header bg-light">
              <div class="input-group" style="margin:0px;">
                <input type="text" class="form-control input-group" style="margin:0px;" placeholder="댓글을 입력하세요.">
                <button type="button" class="btn btn-dark input-group-append" style="margin-right:0px;">작성</button>
              </div>
            </div>
            <div class="card-body">
            <div id="issueReplyFormTarget"></div>
            </div>
            <div class="card-footer bt-light">
            </div>
          </div>
        </div>
      </div>
      <!-- 댓글 작성폼 끝 -->

    <script type="text/x-handlebars-template" id="issueReplyForm">
				{{#each .}}
                  <div class="block bg-light d-flex" style="margin:0px 40px;padding:10px 50px;">
                    <div class="block_content" style="width:100%">
					  <div class="col-sm-3">
						<h2>
						<img src="../../../resources/asserts/images/img.jpg" alt="img" style="height:31px;width:31px;border-radius:100%;"/>
                        <span>{{userVO.nickname}}</span>
						</h2>
					  </div>
					  <div class="col-sm-9 pt-3">
						<p class="excerpt mb-3" style="margin:0px;">{{content}}</p>
                      <div class="byline">
                        <span>{{formatTime updatedate "YYYY년 MM월 DD일"}}</span>
                        <button type="button" class="btn btn-sm btn-danger float-right" onclick="confirm('삭제 하시겠습니까?');">삭제</button>
                        <button type="button" class="btn btn-sm btn-primary float-right" data-toggle="modal" data-target=".modify-modal-lg">수정</button>
                      </div>

                      <br>
					  </div>

                    </div>
                  </div>
				{{/each}}
	</script>

      <!-- 댓글 수정폼 시작 -->
      <div class="modal fade modify-modal-lg" tabindex="-1" role="dialog" aria-modal="true" >
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="myModalLabel">댓글 수정</h4>
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
              <input type="text" class="form-control input-group" style="margin:0px;" placeholder="댓글을 입력하세요.">
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-sm btn-primary" onclick="confirm('수정 하시겠습니까?');">저장</button>
              <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
            </div>
          </div>
        </div>
      </div>
      <!-- 댓글 수정폼 끝 -->
