<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 카드 리스트 -->
  <div class="row mt-5 mb-5">
    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6  ">
      <div class="tile-stats">
        <div class="icon"><i class="fa fa-tasks"></i>
        </div>
        <div class="count">14</div>

        <h3>전체 업무</h3>
        
      </div>
    </div>
    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6  ">
      <div class="tile-stats">
        <div class="icon"><i class="fa fa-check-square-o"></i>
        </div>
        <div class="count">4</div>

        <h3>완료 업무</h3>
        
      </div>
    </div>
    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6  ">
      <div class="tile-stats">
        <div class="icon"><i class="fa fa-star-o"></i>
        </div>
        <div class="count">5</div>

        <h3>이슈</h3>
        
      </div>
    </div>
    <div class="animated flipInY col-lg-3 col-md-3 col-sm-6  ">
      <div class="tile-stats">
        <div class="icon"><i class="fa fa-reply"></i>
        </div>
        <div class="count">2</div>

        <h3>리퀘스트</h3>
        
      </div>
    </div>
  </div>
  <!-- 카드 리스트 끝 -->
  <!-- 그래프 시작 -->
  <div class="row">
    <!-- bar chart -->
    <div class="col-md-6 col-sm-6  ">
      <div class="x_panel">
        <div class="x_title">
          <h2>업무별 상태 <small>봉 그래프</small></h2>
          <div class="clearfix"></div>
        </div>
        <div class="x_content">
          <div id="graph_bar" style="width:100%; height:280px;"></div>
        </div>
      </div>
    </div>
    <!-- /bar charts -->
    <!-- ground cahrs -->
      <div class="col-md-6 col-sm-4" style="padding: 0px;">
        <div class="x_panel">
          <div class="x_title">
            <h2>업무별 상태</h2>
            <div class="clearfix"></div>
          </div>
          <div class="x_content">
    
            <div id="echart_donut" style="height:350px;"></div>
    
          </div>
        </div>
      </div>
    <!-- /ground cahrs -->
  </div>
<!-- 그래프 끝 -->