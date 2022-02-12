<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>
  <body>


	 <div class="right_col" role="main">
        <!-- 내 작업 바디 시작 -->
        <div class="x_panel">

          <div class="x_title">
			<h2>
				<a href="#home"><i class="fa fa-user fa-2x"></i></a> </i> 통합검색
			</h2>

			<div class="clearfix"></div>
          </div>

          <div class="x_content">

				
        




			<div class="col-md-6 col-sm-6  ">
		                <h3><i class="fa fa-search"></i>&nbsp;프로젝트 검색 결과</h3>
		
		                <div id="projectTable"></div>
		
		              </div>
		
		
		
		              <div class="col-md-6 col-sm-6  ">
		                <h3><i class="fa fa-search"></i>&nbsp;닉네임 검색 결과</h3>
		                  <div id="example">
		                    <div id="NickName"></div>
		           </div>
		     </div>




              <div class="col-md-6 col-sm-6  ">
                <h3><i class="fa fa-trophy "></i>&nbsp;인기 프로젝트</h3>
                <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel"
                  data-interval="false">
                  <ol class="carousel-indicators">
                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                  
                   <c:forEach items="${popProj }" var="proj"> 
                   
                   
                    <div class="carousel-item active">
                      <div class="well profile_view d-block w-100" style="height: 230px;">
                        <div class="col-sm-12">
                          <h4 class="brief"><i>${proj.title }</i></h4>
                          <div class="left col-md-7 col-sm-7">
                            <h2>${proj.plId }</h2>
                            <p>${proj.intro } </p>
                            <ul class="list-unstyled">

                            </ul>
                          </div>
                          <div class="right col-md-5 col-sm-5 text-center">
                            <img src="/webapp/resources/asserts/images/img.jpg" alt="" class="img-circle img-fluid">
                          </div>
                        </div>
                        <div class=" row">
                          <div class=" col-sm-6 ">

                            <div class=" row ml-3">
                              <i class="fa fa-heart fa-2x">${proj.likeCount }</i>
                              <button type="button" class="btn btn-primary btn-sm ml-4" style=""><i class="fa fa-desktop">
                                </i>  상세보기 </button>
                            </div>
                          </div>

                        </div>
                      </div>

                      <div class="carousel-caption d-none d-md-block">
                      </div>
                    </div>
                    
                    
                 </c:forEach>   
                    
                    
                  </div>
                  
                  
                  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
                
                
              </div>




              <div class="col-md-6 col-sm-6  ">
                <h3><i class="fa fa-trophy "></i>&nbsp;인기인</h3>
                <div id="carouselExampleCaptionsHuman" class="carousel slide" data-ride="carousel"
                  data-interval="false">
                  <ol class="carousel-indicators">
                    <li data-target="#carouselExampleCaptionsHuman" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleCaptionsHuman" data-slide-to="1"></li>
                    <li data-target="#carouselExampleCaptionsHuman" data-slide-to="2"></li>
                  </ol>
                  
                  <div class="carousel-inner">
                  
                  
                  <c:forEach items="${popUser }" var="pUser"> 
                    <div class="carousel-item active">
                      <div class="well profile_view d-block w-100" style="height: 230px;">
                        <div class="col-sm-12">
                          <h4 class="brief"><i>${pUser.userId }</i></h4>
                          <div class="left col-md-7 col-sm-7">
                            <h2>${pUser.usernickname }</h2>
                            <p>${pUser.intro } </p>
                            <ul class="list-unstyled">

                            </ul>
                          </div>
                          <div class="right col-md-5 col-sm-5 text-center">
                            <img src="/webapp/resources/asserts/images/img.jpg" alt="" class="img-circle img-fluid">
                          </div>
                        </div>
                        <div class=" row">
                          <div class=" col-sm-6 ">

                            <div class=" row ml-3">
                              <i class="fa fa-heart fa-2x">${pUser.likeCount }</i>
                              <button type="button" class="btn btn-primary btn-sm ml-4" style=""><i class="fa fa-user">
                                </i> 상세보기</button>
                            </div>
                          </div>

                        </div>
                      </div>

                      <div class="carousel-caption d-none d-md-block">
                      </div>
                    </div>
                   </c:forEach>
                    

                    
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleCaptionsHuman" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleCaptionsHuman" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
              </div>



    		</div>

          </div>
          <!-- x_content 끝 -->

        </div>
        <!-- 내 작업 바디 끝 -->
      </div>
      <!-- /page content -->







<script>

window.addEventListener('load', function(){
	
	
		var searchBaseUrlSeok="/search/"
		var nickNameSearchListTemplate = "<span onclick='selectChatRoom('#: userId # ')'> #: userId #</span>";
			
          var nickNameDataSource = new kendo.data.DataSource({
                 transport: {
                     read: {
                    
                         url: searchBaseUrlSeok + "readUser?result=${resultData}",
                         dataType: "json"
                     },
                  
                     parameterMap: function (options, operation) {
                        if (operation !== "read" && options.models) {
                            // return { models: kendo.stringify(options.models) };
                        	 return JSON.stringify(options);                         
                        }
                     }
                     
                 },
                 batch: true,
                 pageSize: 8,
                 schema: {
                     model: {
                         id: "nickName",
                         fields: {
                        	 nickname: { editable: false, type: "String" },
                             userId: { editable: true, type: "String"},
    	                     privacy: { editable: true, type: "String"}
                         }
                     }
                 }
             });

          
          var projectDataSource = new kendo.data.DataSource({
              transport: {
                  read: {
                 
                      url: searchBaseUrlSeok + "readProject?result=${resultData}",
                      dataType: "json"
                  },
               
                  parameterMap: function (options, operation) {
                     if (operation !== "read" && options.models) {
                         // return { models: kendo.stringify(options.models) };
                     	 return JSON.stringify(options);                         
                     }
                  }
                  
              },
              batch: true,
              pageSize: 8,
              schema: {
                  model: {
                      id: "projNo",
                      fields: {
                    	  projNo: { editable: false, type: "String" },
                     	  title: { editable: false, type: "String" },
                     	  plId: { editable: true, type: "String"},
 	                      privacy: { editable: true, type: "String"}
                      }
                  }
              }
          });
          
          

          
         $("#NickName").kendoGrid({
             dataSource: nickNameDataSource,
             pageable: true,
             width:540,
             height: 400,
             
             noRecords: {
     			template: function(e) {
     				return "<h2>일치하는 닉네임이 존재하지 않습니다</h2>";
     			}
     		},
             
             
             columns: [
                
	            	 {
		                 field: "nickname",
		                 title: "닉네임",
		                 template: "<span onclick='selectSearchNickName('#: nickname # ')'> #: nickname #</span>",
		                 width: 100,
		                 encoded: false
		             },
	            	 
		             {
		                 field: "userId",
		                 title: "아이디",
		                 width: 100,
		                 encoded: false
		             },
		             
		             
		             
		             {
		                 field: "privacy",
		                 title: "공개범위",
		                 width: 100,
		                 encoded: false
		             }

                 
                 ]
            
         });
		
         
         
         $("#projectTable").kendoGrid({
             dataSource: projectDataSource,
             pageable: true,
             width:540,
             height: 400,
             
             noRecords: {
      			template: function(e) {
      				return "<h2>일치하는 프로젝트가 존재하지 않습니다</h2>";
      			}
      		},
             
             columns: [
                
            	 {
	                 field: "title",
	                 title: "프로젝트 이름",
	                 template: "<span onclick='selectSearchProject('#: projNo # ')'> #: projNo #</span>",
	                 width: 100,
	                 encoded: false
	             },
            	 
	             {
	                 field: "plId",
	                 title: "PL명",
	                 width: 100,
	                 encoded: false
	             },
	             
	             
	             
	             {
	                 field: "privacy",
	                 title: "공개범위",
	                 width: 100,
	                 encoded: false
	             }
	             
	             
            	
                 
                 ]
            
         });
         
  
         
         
		
});
	
	
</script>
<body>
