<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<div class="x_content">
  <!-- 제목 시작 -->
  <div class="x_title">
    <h2><i class="glyphicon glyphicon-th"></i>&nbsp;&nbsp;&nbsp;내 대시보드</h2>
    <div class="clearfix"></div>
  </div>
  <!-- 제목 끝 -->
  <!-- 카드 리스트 -->
  <div class="row mt-5 mb-5">
    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6">
      <div class="tile-stats">
        <div class="icon"><i class="fa fa-tasks"></i></div>
        <div class="count">14</div>  
        <h3>전체 업무</h3>
      </div>
    </div>
    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6">
      <div class="tile-stats">
        <div class="icon"><i class="fa fa-check-square-o"></i></div>
        <div class="count">4</div>
        <h3>완료 업무</h3>
      </div>
    </div>
    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6">
      <div class="tile-stats">
        <div class="icon"><i class="fa fa-star-o"></i></div>
        <div class="count">5</div>
        <h3>이슈</h3>
      </div>
    </div>
    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6">
      <div class="tile-stats">
        <div class="icon"><i class="fa fa-reply"></i></div>
        <div class="count">2</div>
        <h3>리퀘스트</h3>
      </div>
    </div>
  </div>
  <!-- 카드 리스트 끝 -->

  <!-- 테이블 데이터 리스트 -->
  <div class="row">
    <div class="col-sm-12">
      <div class="card-box table-responsive">
        <p class="text-muted font-13 m-b-30">
          모든 업무의 리스트를 출력합니다.
        </p>
        <table id="datatable" class="table table-striped table-hover jambo_table bulk_action" style="width:100%">
          <thead>
            <tr>
              <th>업무</th>
              <th>프로젝트</th>
              <th>담당자</th>
              <th>시작일</th>
              <th>마감일</th>
              <th>중요도</th>
              <th>진행상태</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2011/04/25</td>
              <td>2011/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2011/04/25</td>
              <td>2011/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2011/04/25</td>
              <td>2011/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2011/04/25</td>
              <td>2011/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2011/04/25</td>
              <td>2011/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2011/04/25</td>
              <td>2011/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2011/04/25</td>
              <td>2011/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2011/04/25</td>
              <td>2011/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2011/04/25</td>
              <td>2011/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2011/04/25</td>
              <td>2011/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2010/04/25</td>
              <td>2010/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2010/04/25</td>
              <td>2010/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2010/04/25</td>
              <td>2010/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2010/04/25</td>
              <td>2010/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2010/04/25</td>
              <td>2010/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2010/04/25</td>
              <td>2010/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
            <tr>
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Smith Jackson</td>
              <td>2010/04/25</td>
              <td>2010/04/25</td>
              <td>높음</td>
              <td>진행 중</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!-- 테이블 데이터 리스트 끝 -->
</div>