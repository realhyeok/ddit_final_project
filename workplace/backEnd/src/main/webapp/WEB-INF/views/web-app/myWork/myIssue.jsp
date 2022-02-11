<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<div id="myIssue-content">
	<div class="k-content d-flex row"  style="height:800px;overflow:hidden;">
		<div class="mile-content" style="width:30%;overflow:auto;">
			<div class="x_title">
				<h2>마일스톤</h2>
				<div class="clearfix">
					<a class="k-button float-right" style="background-color:#ebebeb" href="javascript:getOverlayMyMileRegistTemplate('${userVO.userId}');">마일스톤 등록</a>
				</div>
			</div>
			<div class="panel-heading form-inline justify-content-between mb-4">
				<div class="form-group">
					<select id="groupDistIds" class="form-control">
						<option>모두</option>
						<option>진행중</option>
						<option>완료</option>
					</select>
				</div>
				<div class="form-group justify-content-end">
					<span class="k-textbox k-grid-search k-display-flex">
						<input autocomplete="off" id="myMileSearch" placeholder="검색" title="Search..." class="k-input">
						<span class="k-input-icon">
							<span class="k-icon k-i-search"></span>
						</span>
					</span>
				</div>
			</div>      
			<div id="myMileList" style="height:100%;"></div>
		</div>
		<div id="myIssueGrid" style="width:69%;"></div>
	</div>
</div>

<script type="text/x-kendo-template" id="myMileTemplate">
    <div class="milestone" data-bind="click: searchIssue" style="border-left-color: rgb(138,43,226);border-left-width: 2px;">
		<div class="x_title row justify-content-between">
      		<h4>#:title# <span class="#=status#"></span><span class="internal"></span></h4>
				<div class="text-right">
					<a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"></a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="javascript:getOverlayMileModifyTemplate('mileStoneModifyFormTemplate','/app/milestone/getMilestoneByMileNo','#:id#')">수정</a>
							<a class="dropdown-item" href="">삭제</a>
						</div>
				</div>
    	</div>
        <p class="m-0"><small>#:xssPurify(content)#</small></p>
        <p class="m-0"><small>#:kendo.toString(regdate,"yyyy-MM-dd")#</small></p>
    </div>
</script>
