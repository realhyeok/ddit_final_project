<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>    

<!-- page content -->
<div class="right_col" role="main">
  <!-- 내 작업 바디 시작 -->
  <div class="x_panel">
    <div class="x_content">
      <!-- 제목 시작 -->
      <div class="x_title">
        <h2><i class="glyphicon glyphicon-envelope"></i>&nbsp;&nbsp;&nbsp;메일 - 작성</h2>
        <div class="clearfix"></div>
      </div>
      <!-- 제목 끝 -->
      <!-- 메일 작성 시작 -->
      <form class="form-horizontal form-label-left">
        <div class="col-sm-12">
          <label>제목 :</label>
          <input type="text" class="form-control form-control-sm" placeholder="제목을 입력하세요.">
          <br>
        </div>

        <div class="col-sm-12">
          <label>받을 사람 :</label>
          <input type="text" class="form-control form-control-sm" placeholder="이메일을 입력하세요.">
          <br>
        </div>
        
        <div class="col-sm-12">
          <label>내용 :</label>
          <textarea rows="10" class="form-control form-control-sm" placeholder="내용을 입력하세요.">summernote적용 예정?</textarea>
          <br>
        </div>
      </form>

      <div class="form-horizontal form-label-left">
        <div class="col-sm-12">
          <label>첨부파일 :</label>
          <form action="form_upload.html" class="dropzone dz-clickable">
            <div class="dz-default dz-message">
              <span>파일을 등록해주세요.</span>
            </div>
          </form>
          <br>
        </div>
      </div>

      <div class="col-sm-12">
        <div class="col-md-12 col-sm-12" style="text-align:right;">
          <button type="button" class="btn btn-sm btn-primary">전송</button>
          <button type="button" class="btn btn-sm btn-secondary" onclick="history.go(-1);">취소</button>
        </div>
      </div>
      <!-- 메일 작성 끝 -->
    </div>
  </div>
<!-- 내 작업 바디 끝 -->
</div>
<!-- /page content -->