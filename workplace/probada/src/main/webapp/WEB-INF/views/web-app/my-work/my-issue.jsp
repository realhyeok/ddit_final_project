<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>    

<div class="x_content">
  <!-- 제목 시작 -->
  <div class="x_title">
    <h2><i class="glyphicon glyphicon-exclamation-sign"></i>&nbsp;&nbsp;&nbsp;내 이슈</h2>
    <div class="clearfix"></div>
  </div>
  <!-- 제목 끝 -->
  <!-- 정렬 시작 -->
  <div class="row">
    <div class="col-sm-6"></div>
    <div class="col-sm-6">
      <div class="input-group" style="margin:0px;">
        <select class="form-control form-control-sm input-group-prepend">
          <option>프로젝트별</option>
          <option>A프로젝트</option>
          <option>B프로젝트</option>
          <option>C프로젝트</option>          
        </select>
        <select class="form-control form-control-sm input-group">
          <option>상태별</option>
          <option>진행 전</option>
          <option>진행 중</option>
          <option>진행 완료</option>
        </select>
        <select class="form-control form-control-sm input-group-append">
          <option>개수별</option>
          <option>10개</option>
          <option>20개</option>
          <option>50개</option>
        </select>  
      </div>
    </div>
  </div>
  <!-- 정렬 끝 -->
  <!-- 버튼 및 검색 시작 -->
  <div class="row" style="margin-top:10px;">
    <div class="col-sm-4">
      <button class="btn btn-sm btn-primary" type="button" onclick="location.href='my-work/issueRegistForm';">등록</button>
    </div>
    <div class="col-sm-2"></div>
    <div class="col-sm-6">
      <div class="input-group" style="margin:0px;">
        <input type="text" class="form-control form-control-sm input-group" style="margin:0px;" placeholder="검색어를 입력하세요.">
        <button type="button" class="btn btn-sm btn-dark input-group-append" style="margin-right:0px;">검색</button>
      </div>
    </div>
  </div>
  <!-- 버튼 및 검색 끝 -->
  <!-- 이슈 리스트 시작 -->
  <div class="row">
    <div class="col-sm-12">
      <div class="card-box table-responsive">
        <table class="table table-striped table-hover jambo_table bulk_action" style="text-align:center;">
          <thead>
            <tr class="headings">
              <th class="column-title" style="width:140px;">프로젝트명</th>
              <th class="column-title">제목</th>
              <th class="column-title" style="width:70px;">댓글</th>
              <th class="column-title" style="width:80px;">첨부파일</th>
              <th class="column-title" style="width:90px;">상태</th>
              <th class="column-title" style="width:80px;">제기자</th>
              <th class="column-title" style="width:120px;">작성일</th>
            </tr>
          </thead>
          <tbody>
            <tr class="even pointer">
              <td class=" ">A프로젝트</td>
              <td class=" " style="text-align:left;"><a href="my-work/issueDetail">긴급대응사항입니다. 집에 가고 싶습니다. 피곤합니다.</a></td>
              <td class=" ">3</td>
              <td class=" "><i class="glyphicon glyphicon-download-alt"></i></td>
              <td class=" ">진행 전</td>
              <td class=" ">이동근</td>
              <td class=" ">2022-01-01</td>
            </tr>
            <tr class="even pointer">
              <td class=" ">A프로젝트</td>
              <td class=" " style="text-align:left;"><a href="../my-work/my-issue-detail.html">긴급대응사항입니다. 집에 가고 싶습니다. 피곤합니다.</a></td>
              <td class=" ">3</td>
              <td class=" "><i class="glyphicon glyphicon-download-alt"></i></td>
              <td class=" ">진행 전</td>
              <td class=" ">이동근</td>
              <td class=" ">2022-01-01</td>
            </tr>
            <tr class="even pointer">
              <td class=" ">A프로젝트</td>
              <td class=" " style="text-align:left;"><a href="../my-work/my-issue-detail.html">긴급대응사항입니다. 집에 가고 싶습니다. 피곤합니다.</a></td>
              <td class=" ">3</td>
              <td class=" "><i class="glyphicon glyphicon-download-alt"></i></td>
              <td class=" ">진행 전</td>
              <td class=" ">이동근</td>
              <td class=" ">2022-01-01</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!-- 이슈 리스트 끝 -->
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
