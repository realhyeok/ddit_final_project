<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>    

<!-- page content -->
<div class="right_col" role="main">
  <!-- 내 작업 바디 시작 -->
  <div class="x_panel_origin">
    <div class="x_content">
      <!-- 제목 시작 -->
      <div class="x_title">
        <h2><i class="glyphicon glyphicon-exclamation-sign"></i>&nbsp;&nbsp;&nbsp;업무 상세</h2>
        <button type="button" class="btn btn-sm btn-secondary float-right" onclick="history.go(-1);">목록</button>
        <button type="button" class="btn btn-sm btn-primary float-right" onclick="location.href='modifyForm'">수정</button>
        <button type="button" class="btn btn-sm btn-danger float-right">삭제</button>
        <div class="clearfix"></div>
      </div>
      <!-- 제목 끝 -->
      <!-- 이슈 디테일 시작 -->
      <div class="form-group row">
        <div class="col-sm-6">
          <label>제목 :</label>
          <div class="form-control form-control-sm form-control-view">칸반보드 화면 구현</div>
        </div>
        <div class="col-sm-6">
          <label>프로젝트명 :</label>
          <div class="form-control form-control-sm form-control-view">AA 프로젝트</div>
        </div>
      </div>

<div class="form-group row">
        <div class="col-sm-6">
          <label>담당자</label>
          <input type="text" class="form-control form-control-sm form-control-view" value="EnergyWookAA">
        </div>
        <div class="col-sm-6">
          <label class="control-label">중요도</label>
            <select class="form-control form-control-sm">
              <option>낮음</option>
              <option>보통</option>
              <option>높음</option>
            </select>
        </div>
      </div>
      

      <div class="form-group row">
        <div class="col-sm-6">
          <label>시작일 :</label>
          <input type="text" class="form-control form-control-sm form-control-view" value="2021-01-13">
        </div>
        <div class="col-sm-6">
          <label>마감일 :</label>
          <input type="text" class="form-control form-control-sm form-control-view" value="2021-01-20">
        </div>
      </div>
  
  
      <div class="form-group row">
        <div class="col-sm-12">
          <label>업무 내용 :</label>
          <div class="form-control form-control-sm form-control-view" style="height:120px;">칸반보드 화면 구현 <br><br>
          	1. js를 통해 되도록이면 마크업을 쓰지 않도록 할 것 <br><br>
          	2. DB를 연결할 때 글자수로인해 화면이 깨지지 않도록 유의할 것 <br><br>
          </div>
        </div>
      </div>
      

      <div class="form-group row">
        <div class="col-sm-12">
          <label>첨부파일 :</label>
          <div class="form-control form-control-sm form-control-view" style="height:120px;">
            <li>
              <i class="glyphicon glyphicon-floppy-disk"></i>
              <span>지시사항.md</span>
            </li>
            <li>
              <i class="glyphicon glyphicon-floppy-disk"></i>
              <span>jabra.html</span>
            </li>
          </div>
        </div>
      </div>
      <!-- 이슈 디테일 끝 -->

      <!-- 이슈 디테일 끝 -->
    </div>
  </div>
<!-- 내 작업 바디 끝 -->
</div>
<!-- /page content -->