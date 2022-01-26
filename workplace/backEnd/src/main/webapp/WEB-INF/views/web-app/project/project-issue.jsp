<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

  <div class="k-content d-flex row" style="height:800px;">
  			  <div class="mile-content" style="width:30%;overflow:auto;">
        		<div id="toolbar"></div>
        		<div id="mileList"></div>
    		</div>
        	  <div id="issueGrid" style="width:69%"></div>
    </div>

<script type="text/x-kendo-template" id="mileTemplate">
    <div class="milestone" data-bind="click: searchIssue" style="border-left-color: rgb(138,43,226);border-left-width: 2px;">
        <h4>#:title# <span class="#=status#"></span><span class="internal"></span></h4>
        <p><small>#:kendo.toString(regdate,"yyyy-MM-dd")#</small></p>
    </div>
</script>
