<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 업무 리스트 -->
    <div class="x_content">
      <div class="row">
        <div class="col-sm-12">
          <div class="card-box table-responsive">
            <div id="example">
    <div class="k-content">
        <div  id="taskBoard"></div>
    </div>
          </div>
        </div>
      </div>
    </div>
</div>
	<script id="card-template" type="text/x-kendo-template">
			<div class="">
                <div class="two" style="border-left: 1px solid;border-left-color: rgb(138,43,226);border-left-width: 2px;">
                    <div class="d-flex justify-content-end px-2"><i class="mdi mdi-star-outline pr-1 star"></i><i class="mdi mdi-dots-horizontal dot"></i></div>
                    <div class="px-3">
                        	<h2 class="name"><a href="javascript:getTaskTemplate('/app/task/getTaskDetailByTaskNo',#:taskNo#,'taskDetail','taskBoard')" class="text-dark">#:title#</a></h2>
                        <p class="quote2  bg-light text-truncate">#:content#</p>
                    </div>
                    <div class="d-flex justify-content-between px-3 align-items-center pb-2">
                        <div class="d-flex justify-content-start align-items-center"> <i class="mdi mdi-calendar-clock date"></i> <span class="quote2"><small>담당자 <br> #:userId#</small></span> </div>
                        <div class="d-flex justify-content-start align-items-center"> <i class="mdi mdi-calendar-clock date"></i> <span class="quote2 pr-3"><small>마감일 <br> #:kendo.toString(regdate,"yyyy-MM-dd")#</small></span> </div>
                    </div>
                </div>
            </div>
    </script>

	<script id="taskDetail" type="text/x-handlebars-template">
      <div class="x_title">
        <h2><i class="glyphicon glyphicon-exclamation-sign"></i>&nbsp;&nbsp;&nbsp;업무 상세</h2>
        <button type="button" class="btn btn-sm btn-secondary float-right" onclick="readTask();">목록</button>
        <button type="button" class="btn btn-sm btn-primary float-right" onclick="location.href='modifyForm'">수정</button>
        <button type="button" class="btn btn-sm btn-danger float-right">삭제</button>
        <div class="clearfix"></div>
      </div>
      <div class="form-group row">
        <div class="col-sm-6">
          <label>제목 :</label>
          <div class="form-control form-control-sm form-control-view">{{title}}</div>
        </div>
        <div class="col-sm-6">
          <label>프로젝트명 :</label>
          <div class="form-control form-control-sm form-control-view">{{projNo}}</div>
        </div>
      </div>

<div class="form-group row">
        <div class="col-sm-6">
          <label>담당자</label>
          <input type="text" class="form-control form-control-sm form-control-view" value="{{userId}}">
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
	</script>
