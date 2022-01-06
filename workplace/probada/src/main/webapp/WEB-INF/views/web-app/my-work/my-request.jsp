<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>    

<div class="x_content">
  <!-- 제목 시작 -->
  <div class="x_title">
    <h2><i class="glyphicon glyphicon-bullhorn"></i>&nbsp;&nbsp;&nbsp;내 리퀘스트</h2>
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
          <option>대기</option>
          <option>승낙</option>
          <option>거절</option>
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
  <!-- 검색 시작 -->
  <div class="row" style="margin-top:10px;">
    <div class="col-sm-6"></div>
    <div class="col-sm-6">
      <div class="input-group" style="margin:0px;">
        <input type="text" class="form-control form-control-sm input-group" style="margin:0px;" placeholder="리퀘스트를 입력하세요.">
        <button type="button" class="btn btn-sm btn-dark input-group-append" style="margin-right:0px;">검색</button>
      </div>
    </div>
  </div>
  <!-- 검색 끝 -->
  <!-- 요청 리스트 시작 -->
  <div class="row" style="margin-top:10px;">
    <!-- 요청받은 리스트 시작 -->
    <div class="col-sm-6">
      <div class="row">
        <div class="col-sm-12">
          <h4>요청받은 리스트</h4>
        </div>  
      </div>

      <div class="row" style="padding:5px;margin:10px 0px;background:#f7f7f7;border:1px solid #dfdfdf;">
        <div class="col-2" style="padding:0px;">
          <img src="../resources/asserts/images/img.jpg" alt="img" style="height:64px;width:64px;border-radius:100%;"/>
        </div>
        <div class="col-8" style="padding:0px;">
          <div class="row" style="margin:2px;">이동근</div>
          <div class="row" style="margin:2px;">
            <div class="col-6" style="padding:0px;">
              AA 프로젝트
            </div>
            <div class="col-6" style="padding:0px;text-align:right;">
              2022-12-31
            </div>
          </div>
          <div class="row" style="margin:2px;">BB프로젝트 콜라보 제의가 왔습니다.</div>
        </div>
        <div class="col-2" style="padding:0px;">
          <button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target=".process-modal-lg" style="height:64px;width:64px;margin:0px;margin-left:10px;">처리</button>
        </div>
      </div>

      <div class="row" style="padding:5px;margin:10px 0px;background:#f7f7f7;border:1px solid #dfdfdf;">
        <div class="col-2" style="padding:0px;">
          <img src="../resources/asserts/images/img.jpg" alt="img" style="height:64px;width:64px;border-radius:100%;"/>
        </div>
        <div class="col-8" style="padding:0px;">
          <div class="row" style="margin:2px;">이동근</div>
          <div class="row" style="margin:2px;">
            <div class="col-6" style="padding:0px;">
              AA 프로젝트
            </div>
            <div class="col-6" style="padding:0px;text-align:right;">
              2022-12-31
            </div>
          </div>
          <div class="row" style="margin:2px;">BB프로젝트 콜라보 제의가 왔습니다.</div>
        </div>
        <div class="col-2" style="padding:0px;">
          <button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target=".process-modal-lg" style="height:64px;width:64px;margin:0px;margin-left:10px;">처리</button>
        </div>
      </div>

      <div class="row" style="padding:5px;margin:10px 0px;background:#f7f7f7;border:1px solid #dfdfdf;">
        <div class="col-2" style="padding:0px;">
          <img src="../resources/asserts/images/img.jpg" alt="img" style="height:64px;width:64px;border-radius:100%;"/>
        </div>
        <div class="col-8" style="padding:0px;">
          <div class="row" style="margin:2px;">이동근</div>
          <div class="row" style="margin:2px;">
            <div class="col-6" style="padding:0px;">
              AA 프로젝트
            </div>
            <div class="col-6" style="padding:0px;text-align:right;">
              2022-12-31
            </div>
          </div>
          <div class="row" style="margin:2px;">BB프로젝트 콜라보 제의가 왔습니다.</div>
        </div>
        <div class="col-2" style="padding:0px;">
          <button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target=".process-modal-lg" style="height:64px;width:64px;margin:0px;margin-left:10px;">처리</button>
        </div>
      </div>

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
    <!-- 요청받은 리스트 끝 -->

    <!-- 요청한 리스트 시작 -->
    <div class="col-sm-6">
      <div class="row">
        <div class="col-sm-12">
          <h4>요청한 리스트</h4>
        </div>  
      </div>

      <div class="row" style="padding:5px;margin:10px 0px;background:#f7f7f7;border:1px solid #dfdfdf;">
        <div class="col-2" style="padding:0px;">
          <img src="../resources/asserts/images/img.jpg" alt="img" style="height:64px;width:64px;border-radius:100%;"/>
        </div>
        <div class="col-8" style="padding:0px;">
          <div class="row" style="margin:2px;">이동근</div>
          <div class="row" style="margin:2px;">
            <div class="col-6" style="padding:0px;">
              AA 프로젝트
            </div>
            <div class="col-6" style="padding:0px;text-align:right;">
              2022-12-31
            </div>
          </div>
          <div class="row" style="margin:2px;">BB프로젝트 콜라보 제의가 왔습니다.</div>
        </div>
        <div class="col-2" style="padding:0px;">
          <button type="button" class="btn btn-sm btn-secondary" style="height:64px;width:64px;margin:0px;margin-left:10px;">대기</button>
        </div>
      </div>

      <div class="row" style="padding:5px;margin:10px 0px;background:#f7f7f7;border:1px solid #dfdfdf;">
        <div class="col-2" style="padding:0px;">
          <img src="../resources/asserts/images/img.jpg" alt="img" style="height:64px;width:64px;border-radius:100%;"/>
        </div>
        <div class="col-8" style="padding:0px;">
          <div class="row" style="margin:2px;">이동근</div>
          <div class="row" style="margin:2px;">
            <div class="col-6" style="padding:0px;">
              AA 프로젝트
            </div>
            <div class="col-6" style="padding:0px;text-align:right;">
              2022-12-31
            </div>
          </div>
          <div class="row" style="margin:2px;">BB프로젝트 콜라보 제의가 왔습니다.</div>
        </div>
        <div class="col-2" style="padding:0px;">
          <button type="button" class="btn btn-sm btn-primary" style="height:64px;width:64px;margin:0px;margin-left:10px;">승낙</button>
        </div>
      </div>

      <div class="row" style="padding:5px;margin:10px 0px;background:#f7f7f7;border:1px solid #dfdfdf;">
        <div class="col-2" style="padding:0px;">
          <img src="../resources/asserts/images/img.jpg" alt="img" style="height:64px;width:64px;border-radius:100%;"/>
        </div>
        <div class="col-8" style="padding:0px;">
          <div class="row" style="margin:2px;">이동근</div>
          <div class="row" style="margin:2px;">
            <div class="col-6" style="padding:0px;">
              AA 프로젝트
            </div>
            <div class="col-6" style="padding:0px;text-align:right;">
              2022-12-31
            </div>
          </div>
          <div class="row" style="margin:2px;">BB프로젝트 콜라보 제의가 왔습니다.</div>
        </div>
        <div class="col-2" style="padding:0px;">
          <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target=".no-modal-sm" style="height:64px;width:64px;margin-left:10px;">거절</button>
        </div>
      </div>

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
    <!-- 요청한 리스트 끝 -->
  </div>
  <!-- 요청 리스트 끝 -->

  <div class="modal fade no-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">

        <div class="modal-header">
          <h4 class="modal-title" id="myModalLabel2">거절</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <h4>마창수</h4>
          <p class="float-right">2022-01-01</p>
          <br>
          <p>거절을 합니다.</p>
          <p>거절하기 때문입니다.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade process-modal-lg" tabindex="-1" role="dialog" aria-modal="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">

        <div class="modal-header">
          <h4 class="modal-title" id="myModalLabel">처리 - 승낙 / 거절</h4>
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <textarea rows="5" style="width:767px;"></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-sm btn-primary" onclick="confirm('승낙 하시겠습니까?');">승낙</button>
          <button type="button" class="btn btn-sm btn-danger" onclick="confirm('거절 하시겠습니까?');">거절</button>
        </div>

      </div>
    </div>
  </div>
</div>