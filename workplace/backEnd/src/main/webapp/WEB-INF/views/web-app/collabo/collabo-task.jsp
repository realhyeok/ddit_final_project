<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 업무 리스트 -->
    <div class="x_content">
      <div class="row">
        <div class="col-sm-12">
          <div class="card-box">
            <div id="example">
    <div class="k-content">
        <div  id="collaboTaskBoard"></div>
    </div>
          </div>
        </div>
      </div>
    </div>
</div>
	<script id="collabo-card-template" type="text/x-kendo-template">
			<div class="">
                <div class="two" style="border-left: 1px solid;border-left-color: rgb(138,43,226);border-left-width: 2px;border-left-color:
				# if(important == "B101"){ #
					rgb(40, 167, 69)
				# }else if(important == "B102"){ #
					rgb(255, 193, 7)
				# }else if(important == "B103"){ #
					rgb(220, 53, 69)
				# } #
				;">
					
                    <div class="d-flex justify-content-end px-2"><i class="mdi mdi-star-outline pr-1 star"></i><i class="mdi mdi-dots-horizontal dot"></i></div>
                    <div class="px-3">
							<input type="hidden" id="taskNoForDrag" value="#:taskNo#">
                        	<h2 class="name"><a href="javascript:getCollaboTaskTemplate('/app/collabo/getTaskDetailByTaskNo',#:taskNo#,'collaboTaskDetailForm','collaboTaskDetailFormTarget')" class="text-dark">#:title#</a></h2>
                        <div class="quote2 col-sm-12 bg-light text-truncate mb-2"> #: xssPurify(content)# </div>
                    </div>
                    <div class="d-flex justify-content-between px-3 align-items-center pb-2">
						<div class="d-flex justify-content-start align-items-center"> <i class="mdi mdi-calendar-clock date"></i> <span class="quote2"><small><i class="fa fa-user"></i> #:userId#</small></span> </div>
                        <div class="d-flex justify-content-start align-items-center"> <i class="mdi mdi-calendar-clock date"></i> <span class="quote2 pr-3"><small><i class="fa fa-clock-o"></i> #:kendo.toString(regdate,"yyyy-MM-dd")#</small></span> </div>
                    </div>
                </div>
            </div>
    </script>