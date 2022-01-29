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
          <div class="form-control form-control-sm form-control-view">칸반보드 UX  설정 REQ-001 문의</div>
        </div>
        <div class="col-sm-6">
          <label>프로젝트명 :</label>
          <div class="form-control form-control-sm form-control-view">AA 프로젝트</div>
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-12">
          <label>이슈 내용 :</label>
          <div class="form-control form-control-sm form-control-view" style="height:120px;">UX에 문제 발생했습니다. ERROR 3023 참고바람.</div>
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-6">
          <label>작성일 :</label>
          <div class="form-control form-control-sm form-control-view">2021-01-13</div>
        </div>
        <div class="col-sm-6">
          <label>수정일 :</label>
          <div class="form-control form-control-sm form-control-view">2021-01-13</div>
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-12">
          <label>조치내용 :</label>
          <div class="form-control form-control-sm form-control-view" style="height:120px;">UX에 문제 해결 완료~</div>
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

      <!-- 이슈 디테일 댓글 시작 -->
      <div class="form-group row">
        <div class="col-sm-12">
          <label>댓글 :</label>
          <div class="card mb-2">
            <div class="card-header bg-light">
              <div class="input-group" style="margin:0px;">
                <input type="text" class="form-control input-group" style="margin:0px;" placeholder="댓글을 입력하세요.">
                <button type="button" class="btn btn-dark input-group-append" style="margin-right:0px;">작성</button>
              </div>
            </div>
            <div class="card-body">
              <ul class="list-unstyled timeline">
                <li>
                  <div class="block" style="margin:0px 0px 0px 10px;padding:10px 0px 0px 15px;">
                    <div class="block_content">
                      <h2 class="title">
                        <img src="../../../resources/asserts/images/img.jpg" alt="img" style="height:31px;width:31px;border-radius:100%;"/>
                        <span>석기현</span>
                        <button type="button" class="btn btn-sm btn-danger float-right" onclick="confirm('삭제 하시겠습니까?');">삭제</button>
                        <button type="button" class="btn btn-sm btn-primary float-right" data-toggle="modal" data-target=".modify-modal-lg">수정</button>
                      </h2>
                      <div class="byline">
                        <span>2020-09-14 22:41:03</span>
                      </div>
                      <p class="excerpt" style="margin:0px;">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and…
                      </p>
                      <br>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="block" style="margin:0px 0px 0px 10px;padding:10px 0px 0px 15px;">
                    <div class="block_content">
                      <h2 class="title">
                        <img src="../../../resources/asserts/images/img.jpg" alt="img" style="height:31px;width:31px;border-radius:100%;"/>
                        <span>석기현</span>
                        <button type="button" class="btn btn-sm btn-danger float-right" onclick="confirm('삭제 하시겠습니까?');">삭제</button>
                        <button type="button" class="btn btn-sm btn-primary float-right" data-toggle="modal" data-target=".modify-modal-lg">수정</button>
                      </h2>
                      <div class="byline">
                        <span>2020-09-14 22:41:03</span>
                      </div>
                      <p class="excerpt" style="margin:0px;">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and…
                      </p>
                      <br>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="block" style="margin:0px 0px 0px 10px;padding:10px 0px 0px 15px;">
                    <div class="block_content">
                      <h2 class="title">
                        <img src="../../../resources/asserts/images/img.jpg" alt="img" style="height:31px;width:31px;border-radius:100%;"/>
                        <span>석기현</span>
                        <button type="button" class="btn btn-sm btn-danger float-right" onclick="confirm('삭제 하시겠습니까?');">삭제</button>
                        <button type="button" class="btn btn-sm btn-primary float-right" data-toggle="modal" data-target=".modify-modal-lg">수정</button>
                      </h2>
                      <div class="byline">
                        <span>2020-09-14 22:41:03</span>
                      </div>
                      <p class="excerpt" style="margin:0px;">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and…
                      </p>
                      <br>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
            <div class="card-footer bt-light">
              <!-- 페이징 시작 -->
              <div class="row">
                <div class="col-sm-12">
                  <ul class="pagination justify-content-center m-0">
                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                  </ul>
                </div>
              </div>
              <!-- 페이징 끝 -->
            </div>
          </div>
        </div>
      </div>
      <!-- 댓글 작성폼 끝 -->

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
      <!-- 이슈 디테일 끝 -->
    </div>
</script>