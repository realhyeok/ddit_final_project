<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>    

<table class="table table-striped table-hover jambo_table bulk_action" style="text-align: center;">
	<thead>
		<tr>
			<th style="width:40px;">
				<input id="tempAllCheckButton" type="checkbox" onchange="tempAllCheck();">
			</th>
			<th style="width:120px;">받는사람</th>
			<th>제목</th>
			<th style="width:60px;">첨부</th>
			<th style="width:150px;">날짜</th>
		</tr>
	</thead>
	<tbody>
		<tr class="even pointer">
			<td><input class="tempCheck" type="checkbox"></td>											
			<td class=" ">양기욱</td>
			<td class=" " style="text-align: left;"><a href="myWork/mailDetail">협업하시겠습니까?</a></td>
			<td class=" "><i class="fa fa-paperclip"></i></td>
			<td class=" ">2022-01-01 17:12:00</td>
		</tr>
		<tr class="even pointer">
			<td><input class="tempCheck" type="checkbox"></td>
			<td class=" ">마창수</td>
			<td class=" " style="text-align: left;"><a href="myWork/mailDetail">멤버 탈퇴합니다.</a></td>
			<td class=" "><i class="fa fa-paperclip"></i></td>
			<td class=" ">2022-01-01 17:12:00</td>
			
		</tr>
		<tr class="even pointer">
			<td><input class="tempCheck" type="checkbox"></td>
			<td class=" ">석기현</td>
			<td class=" " style="text-align: left;"><a href="myWork/mailDetail">키오스크 업체관련</a></td>
			<td class=" "><i class="fa fa-paperclip"></i></td>
			<td class=" ">2022-01-01 17:12:00</td>
			
		</tr>
	</tbody>
</table>
<button type="button" class="btn btn-sm btn-dark">삭제</button>
<!-- 페이징 시작 -->
<ul class="pagination float-right m-0">
	<li class="page-item"><a class="page-link" href="#">이전</a></li>
	<li class="page-item"><a class="page-link" href="#">1</a></li>
	<li class="page-item active"><a class="page-link" href="#">2</a></li>
	<li class="page-item"><a class="page-link" href="#">3</a></li>
	<li class="page-item"><a class="page-link" href="#">다음</a></li>
</ul>
<!-- 페이징 끝 -->

<script>
	function tempAllCheck(){
		all = $("#tempAllCheckButton").is(":checked");
		
		if(all){
			$(".tempCheck").prop("checked", true);
		}else{
			$(".tempCheck").prop("checked", false);
		}
	}
</script>