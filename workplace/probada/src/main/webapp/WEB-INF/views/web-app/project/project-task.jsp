<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- 테이블 데이터 리스트 -->
    <div class="x_content">
      <div class="row">
        <div class="col-sm-12">
          <div class="card-box table-responsive">
            <p class="text-muted font-13 m-b-30">
              모든 프로젝트 리스트를 출력합니다.
            </p>
            <div id="test-all" class="row">
              <div id="test" class="row"></div>
              <div
                id="test2"
                class="row"
                style="display: flexbox"
              ></div>
            </div>
            <table
              id="example"
              class="table table-striped table-bordered"
              name="data-table-form"
              style="width: 100%"
            ></table>
          </div>
        </div>
      </div>
    </div>
    <!-- 리스트 종료 -->