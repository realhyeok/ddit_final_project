<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="x_panel">
      <div class="row">
        <div class="x_panel">
          <div class="row">
            <!--  컬럼 시작 -->
            <div class="col-sm-12">
              <section class="panel">
                <div class="project-detail">
                  <div class="project-detail-body">
        
                    <!-- 프로젝트 개요 시작 -->
                    <div class="project-detail-body">
                      <div class="x_title">
                        <h2 class="title">
                          <i class="fa fa-gears fa-lg"></i> <span class="project-title">
                            Super PMS Project </span>
                        </h2>
                        <div class="clearfix">
                          <div class="clearfix header-title justify-content-end">
                            <a href="" data-toggle="modal" 
                              data-target="#project-member-add"><i
                              class="fa fa-user-plus fa-2x"></i></a>
                          </div>
                        </div>
                      </div>
        
                      <br>
                      <div class="clearfix"></div>
                      <div class="panel-body mb-5">
                        <div class="task_detail d-flex mb-3">
                          <div class="col-sm-6">
                            <h2 class="title">
                              <i class="fa fa-calendar-o"></i> 시작일
                            </h2>
                            <p>2021-12-22</p>
                            <div class="boxed">
                              <h2 class="title">
                                <i class="fa fa-unlock-alt fa-lg"></i> 공개범위
                              </h2>
                              <p>비공개</p>
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <h2 class="title">
                              <i class="fa fa-calendar-check-o"></i> 마감일
                            </h2>
                            <p>2022-01-20</p>
                            <h2 class="title">
                              <i class="fa fa-question-circle-o"></i> 진행상태
                            </h2>
                            <p>진행중</p>
                          </div>
                        </div>
                        <div class="x_title">
                          <h2 class="title">
                            <i class="fa fa-hashtag"></i> 프로젝트 소개
                          </h2>
                          <div class="clearfix">
                            <div class="clearfix header-title justify-content-end">
                              <a href="" data-toggle="modal"
                                data-target="#project-member-add"><i
                                class="fa fa-user-plus fa-2x"></i></a>
                            </div>
                          </div>
                        </div>
                        <span class="project-intro"> 기존의 협업툴과 프로젝트 관리 툴의 장점을 뽑아만드는 PMS! </span>
                      </div>
                    </div>
                    <!-- 프로젝트 개요 끝 -->

                    <!-- 하위 프로젝트-->
                    <div class="x_content">

                      <!-- start accordion -->
                      <div class="accordion" id="accordion1" role="tablist" aria-multiselectable="true">
                        <div class="panel">
                          <a class="panel-heading collabo-detail-a" role="tab" id="headingOne1" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1" aria-expanded="true" aria-controls="collapseOne">
                            <h4 class="panel-title"><img src="https://img.icons8.com/ios-glyphs/30/000000/tasks--v2.png"/>연관 프로젝트</h4>
                          </a>
                          <div id="collapseOne1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                              <table class="table table-striped">
                                
                                <tbody>
                                  <tr>
                                    <td><a href="" class="collabo-detail-a">하위 프로젝트 1</a></td>
                                  </tr>
                                  <tr>
                                    <td><a href="" class="collabo-detail-a">하위 프로젝트 2</a></td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- end of accordion -->

                    </div>
        
                    <!-- 프로젝트 공지사항 본문 시작 -->
                    <div class="project-detail-body project-notice">
                      <div class="x_title">
                        <h2 class="title">
                          <i class="fa fa-exclamation-circle"></i> 공지사항
                        </h2>
                        <div class="clearfix header-title justify-content-end">
                          <a href="" data-toggle="modal"
                            data-target="#project-member-add"><i
                            class="fa fa-user-plus fa-2x"></i></a>
                        </div>
                      </div>
                      <div class="mb-3">
                        <!-- 프로젝트 공지사항 예시 시작 -->
                        <div class="x_title">
                          <h5 class="title">
                            <span>maven update 및 commit 에러 발생시 즉시 알릴 것</span>
                          </h5>
                          <div class="clearfix"></div>
                        </div>
                        <div class="project-detail-body project-notice-content">
                          &nbsp;update 및 commit시 에러 발생 시키는 사람 history에 다 나오니까 책임 져야합니다.</div>
                      </div>
                      <!-- 프로젝트 공지사항 예시 끝 -->
                      <!--
                            <div class="btn create-btn project-bg-btn" data-toggle="modal" data-target="#project-notice-regist">
                              <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                                class="bi bi-plus" viewBox="0 0 16 16">-->
                      <path
                        d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
                        class="cQfklM" />
                      </svg>
                    </div>
        
                  </div>
                </div>
                <!-- 프로젝트 공지사항 본문 끝 -->
        
        
                <!-- 중요첨부 파일 시작 -->
                <div class="project-detail-body">
                  <div class="x_title">
                    <h2 class="title">
                      <i class="glyphicon glyphicon-hdd"></i> 중요첨부파일
                    </h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="col-sm-12">
                    <ul class="row list-unstyled project-files">
                      <li>
                        <div class="btn create-btn files-btn">
                          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                            fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                                  <path
                              d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
                              class="cQfklM" />
                                </svg>
                        </div>
                      </li>
                      <li>
                        <div class="btn create-btn files-btn">
                          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                            fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                                  <path
                              d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
                              class="cQfklM" />
                                </svg>
                        </div>
                      </li>
                      <li>
                        <div class="btn create-btn files-btn">
                          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                            fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                                  <path
                              d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
                              class="cQfklM" />
                                </svg>
                        </div>
                      </li>
                    </ul>
                  </div>
                  <br />
                </div>
                <!-- 중요첨부 파일 끝 -->
        
                <!-- 구성원 -->
                <div class="project-detail-body">
                  <div class="x_title header-title">
                    <h2 class="title">
                      <i class="fa fa-users"></i> 구성원
                    </h2>
                    <div class="clearfix header-title">
                      <a href="" data-toggle="modal" data-target="#project-member-add"><i
                        class="fa fa-user-plus fa-2x"></i></a>
                    </div>
                  </div>
                  <td>
                    <ul class="list-inline" style="display: inline-flex">
                      <!-- 구성원 단위 시작 -->
                      <li class="project-member nav-item dropdown open">
                        <div class="d-flex flex-column">
                          <span>PL</span><br /> <a href="javascript:;"
                            class="project-member " aria-haspopup="true"
                            id="navbarDropdown" data-toggle="dropdown"
                            aria-expanded="false"> <img
                            src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
                            class="img-circle" alt="Avatar" />
                          </a>
                          <div class="dropdown-menu dropdown-membermenu pull-right"
                            aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="javascript:;"
                              data-toggle="modal" data-target="#project-member-modify">
                              권한부여</a> <a class="dropdown-item" href="javascript:;"
                              data-toggle="modal" data-target="#project-member-delete">
                              <span class="text-danger">제명</span>
                            </a>
                          </div>
                          <span>RealHyukPL</span>
                        </div>
                      </li>
                      <li class="project-member nav-item dropdown open">
                        <div class="d-flex flex-column">
                          <span>PL</span><br /> <a href="javascript:;"
                            class="project-member " aria-haspopup="true"
                            id="navbarDropdown" data-toggle="dropdown"
                            aria-expanded="false"> <img
                            src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
                            class="img-circle" alt="Avatar" />
                          </a>
                          <div class="dropdown-menu dropdown-membermenu pull-right"
                            aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="javascript:;"
                              data-toggle="modal" data-target="#project-member-modify">
                              권한부여</a> <a class="dropdown-item" href="javascript:;"
                              data-toggle="modal" data-target="#project-member-delete">
                              <span class="text-danger">제명</span>
                            </a>
                          </div>
                          <span>RealHyukPL</span>
                        </div>
                      </li>
                      <li class="project-member nav-item dropdown open">
                        <div class="d-flex flex-column">
                          <span>PL</span><br /> <a href="javascript:;"
                            class="project-member " aria-haspopup="true"
                            id="navbarDropdown" data-toggle="dropdown"
                            aria-expanded="false"> <img
                            src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
                            class="img-circle" alt="Avatar" />
                          </a>
                          <div class="dropdown-menu dropdown-membermenu pull-right"
                            aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="javascript:;"
                              data-toggle="modal" data-target="#project-member-modify">
                              권한부여</a> <a class="dropdown-item" href="javascript:;"
                              data-toggle="modal" data-target="#project-member-delete">
                              <span class="text-danger">제명</span>
                            </a>
                          </div>
                          <span>RealHyukPL</span>
                        </div>
                      </li>
                      <li class="project-member nav-item dropdown open">
                        <div class="d-flex flex-column">
                          <span>PL</span><br /> <a href="javascript:;"
                            class="project-member " aria-haspopup="true"
                            id="navbarDropdown" data-toggle="dropdown"
                            aria-expanded="false"> <img
                            src="<%=request.getContextPath()%>/resources/asserts/images/img.jpg"
                            class="img-circle" alt="Avatar" />
                          </a>
                          <div class="dropdown-menu dropdown-membermenu pull-right"
                            aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="javascript:;"
                              data-toggle="modal" data-target="#project-member-modify">
                              권한부여</a> <a class="dropdown-item" href="javascript:;"
                              data-toggle="modal" data-target="#project-member-delete">
                              <span class="text-danger">제명</span>
                            </a>
                          </div>
                          <span>RealHyukPL</span>
                        </div>
                      </li>
                      
                      <!-- 구성원 단위 끝 -->
                      <!-- 구성원 더보기 버튼 시작 -->
                      <li class="project-member d-flex align-items-center mr-3"><a
                        href="../project/project-member-list.html"> <i
                          class="fa fa-ellipsis-h fa-2x"></i>
                      </a></li>
                      <!-- 구성원 더보기 버튼 끝 -->
                    </ul>
                  </td>
        
                </div>
                <!-- 구성원 끝 -->
            </div>
          </div>
        </div>
        
        <!-- 공지사항 등록 모달-->
        <!-- Button to Open the Modal
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createCollabo">
              Open modal
            </button> -->
        <div class="modal" id="collabo-notice-regist" data-backdrop="static">
          <div class="modal-dialog">
            <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title modalTitle">공지사항 등록</h4>
                <button type="button" class="close" data-dismiss="modal">
                  &times;</button>
              </div>
        
              <!-- Modal body -->
              <div class="modal-body">
                <div class="x_content">
                  <!-- form start -->
                  <form>
                    <p>콜라보 프로젝트 공지사항을 입력하는 공간입니다.</p>
                    <p>콜라보 프로젝트에는 하나의 공지사항만 등록할 수 있습니다.</p>
                    <div class="card-body">
                      <div class="form-group">
                        <label for="notice_title_input">공지사항 제목</label> <input
                          type="text" class="form-control" id="notice_title_input"
                          placeholder="제목을 입력해주세요." />
                      </div>
                      <!-- textarea -->
                      <div class="form-group">
                        <label>공지사항 내용</label>
                        <textarea class="form-control" rows="5" placeholder="내용을 입력해주세요"></textarea>
                      </div>
                    </div>
                    <!-- /.card-body -->
                    <button type="submit"
                      class="btn btn-outline-primary collabo-submit-btn">
                      보내기</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 공지사항 등록 모달 끝-->
        
        <!-- 프로젝트 구성원 추가 모달 시작-->
        <div class="modal" id="collabo-member-add" data-backdrop="static">
          <div class="modal-dialog">
            <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title modalTitle">구성원 초대</h4>
                <button type="button" class="close" data-dismiss="modal">
                  &times;</button>
              </div>
        
              <!-- Modal body -->
              <div class="modal-body">
                <div class="x_content">
                  <!-- form start -->
                  <form>
                    <p>콜라보 프로젝트를 함께 할 구성원들을 초대해보세요.</p>
                    <div class="card-body">
                      <div class="form-group">
                        <label for="exampleInputEmail1">이메일로 초대</label> <input
                          type="email" class="form-control" id="exampleInputEmail1"
                          placeholder="상대방의 이메일을 입력하세요." />
                      </div>
                      <!-- select -->
                      <div class="form-group">
                        <label>접근 권한</label> <select class="form-control">
                          <option value="" disabled selected hidden>접근 권한을 설정해
                            주세요.</option>
                          <option>Observer</option>
                          <option>Cooperator</option>
                          <option>Partner</option>
                          <option>Collaborator</option>
                        </select>
                      </div>
                      <!-- textarea -->
                      <div class="form-group">
                        <label>보낼 메세지</label>
                        <textarea class="form-control" rows="3" placeholder="내용을 입력해주세요"></textarea>
                      </div>
                    </div>
                    <!-- /.card-body -->
                    <button type="submit"
                      class="btn btn-outline-primary collabo-submit-btn">
                      보내기</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 프로젝트 구성원 제안 모달 끝-->
        
        <!-- 프로젝트 수정 모달 시작-->
        <div class="modal" id="collabo-modify" data-backdrop="static">
          <div class="modal-dialog">
            <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title modalTitle">콜라보 프로젝트 정보 수정</h4>
                <button type="button" class="close" data-dismiss="modal">
                  &times;</button>
              </div>
        
              <!-- Modal body -->
              <div class="modal-body">
                <div class="x_content">
                  <!-- form start -->
                  <form>
                    <p>콜라보 프로젝트 정보를 수정할 수 있습니다.</p>
                    <div class="card-body">
                      <div class="form-group">
                        <label for="collabo-name-for-modify">콜라보 프로젝트명</label> <input
                          type="text" class="form-control" id="collabo-name-for-modify"
                          value="남양(주) 사이트 유지보수" />
                      </div>
                      <!-- select -->
                      <div class="form-group">
                        <label>공개범위</label> <select class="form-control">
                          <option value="" disabled selected hidden>공개범위을 설정해
                            주세요.</option>
                          <option>Public</option>
                          <option selected>Private</option>
                          <option>Protected</option>
                        </select>
                      </div>
                      <!-- textarea -->
                      <div class="form-group">
                        <label>콜라보 프로젝트 소개</label>
                        <textarea class="form-control" rows="10"> 주식회사 남양의 사이트 유지보수를 진행하는 프로젝트 입니다. 프론트엔드와 백엔드 각각 3명씩 구성되어 있으며, 2022년 2월까지 프로젝트 마감 예정입니다. 모르는게 있으면 서로 물어보며 진행하는 팀 분위기를 만들어 갑니다.
                          </textarea>
                      </div>
                    </div>
                    <!-- /.card-body -->
                    <button type="submit"
                      class="btn btn-outline-primary collabo-submit-btn">
                      보내기</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 프로젝트 수정 모달 끝-->
        
        <!-- 구성원 권한부여 모달 시작-->
        <div class="modal" id="collabo-member-modify" data-backdrop="static">
          <div class="modal-dialog">
            <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title modalTitle">구성원 권한부여</h4>
                <button type="button" class="close" data-dismiss="modal">
                  &times;</button>
              </div>
        
              <!-- Modal body -->
              <div class="modal-body">
                <div class="x_content">
                  <!-- form start -->
                  <form>
                    <p>콜라보 프로젝트 구성원의 권한을 변경할 수 있습니다.</p>
                    <!-- 팀장 설정시 visible로 -->
                    <p>팀장을 양도할 경우 현 콜라보 프로젝트에서 팀장으로써의 모든 권한을 잃게 됩니다!</p>
                    <!-- 팀장 설정시 visible로 -->
                    <div class="card-body">
                      <div class="xtitle">
                        <div class="form-group">
                          <p>유저명 : RealHyukPL</p>
                        </div>
                      </div>
                      <!-- select -->
                      <div class="form-group">
                        <label>권한 : </label> <select class="form-control">
                          <option value="" disabled selected hidden>변경할 권한을
                            설정해주세요</option>
                          <option>방문자</option>
                          <option selected>팀원</option>
                          <option>팀장</option>
                        </select>
                      </div>
                    </div>
                    <!-- /.card-body -->
                    <button type="submit"
                      class="btn btn-outline-primary collabo-submit-btn">
                      확인</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 구성원 권한부여 모달 끝-->
        
        <!-- 구성원 제명 모달 시작-->
        <div class="modal" id="collabo-member-delete" data-backdrop="static">
          <div class="modal-dialog">
            <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title modalTitle">구성원 제명</h4>
                <!-- <h4 class="modal-title modalTitle">구성원 탈퇴</h4> -->
                <button type="button" class="close" data-dismiss="modal">
                  &times;</button>
              </div>
        
              <!-- Modal body -->
              <div class="modal-body">
                <div class="x_content">
                  <!-- form start -->
                  <form>
                    <span class="font-weight-bold">정말로 해당 구성원을 제명하시겠습니까?</span>
                    <p>*해당 구성원이 작성한 업무와 문서는 삭제되지 않습니다.</p>
                    <div class="card-body">
                      <div class="form-group">
                        <p>유저명 : RealHyukPL</p>
                      </div>
                      <!-- textarea -->
                      <div class="form-group">
                        <label>제명 사유</label>
                        <textarea class="form-control" rows="10"
                          placeholder="제명 사유를 적어주세요."></textarea>
                      </div>
                      <!-- textarea -->
                      <div class="form-group">
                        <label for="collabo-member-delete">확인을 위해 "<strong
                          class="text-danger">콜라보 프로젝트 탈퇴</strong>" 를 입력해주세요.
                        </label> <input type="text" class="form-control"
                          id="collabo-member-delete" />
                      </div>
        
                    </div>
                    <!-- /.card-body -->
                    <button type="submit"
                      class="btn btn-outline-primary collabo-submit-btn">
                      확인</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 구성원 제명 모달 끝-->
        
      </div>
    </div>