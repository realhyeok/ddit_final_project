<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>    
 
<!-- 업무 리스트 -->
<div class="x_content">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-box table-responsive">
				<div id="example">
					<div class="demo-section wide k-content">
						<div id="my-taskBoard"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script id="myTask-template" type="text/x-kendo-template">
		<div class="">
			<div class="two">
				<div class="d-flex justify-content-end px-3"><i class="mdi mdi-star-outline pr-1 star"></i><i class="mdi mdi-dots-horizontal dot"></i></div>
				<div class="px-3">
					<h2 class="name"><a href="/app/project/taskDetail" class="text-dark">#:title#</a></h2>
					<p class="quote2  bg-light text-truncate">#:description#</p>
				</div>
				<div class="d-flex justify-content-between px-3 align-items-center pb-2">
					<div class="d-flex justify-content-start align-items-center"> <i class="mdi mdi-calendar-clock date"></i> <span class="quote2"><small>담당자 <br> RealHyukPL</small></span> </div>
					<div class="d-flex justify-content-start align-items-center"> <i class="mdi mdi-calendar-clock date"></i> <span class="quote2 pr-3"><small>마감일 <br> 2022-01-17</small></span> </div>
				</div>
			</div>
		</div>
	</script>
</div>
