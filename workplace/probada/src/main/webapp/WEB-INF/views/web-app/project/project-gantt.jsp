<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="x_panel">
	<div class="row">
		<div id="gantt_here" style="width: 100%; height: 50vh"></div>
		<script>
			gantt.config.date_format = "%Y-%m-%d %H:%i";
			gantt.init("gantt_here");
			gantt.parse({
				data : [ {
					id : 1,
					text : "Project #1",
					start_date : null,
					duration : null,
					parent : 0,
					progress : 0,
					open : true,
				}, {
					id : 2,
					text : "Task #1",
					start_date : "2019-08-01 00:00",
					duration : 5,
					parent : 1,
					progress : 1,
				}, ],
				links : [ {
					id : 1,
					source : 2,
					target : 3,
					type : "0"
				}, {
					id : 2,
					source : 3,
					target : 4,
					type : "0"
				}, {
					id : 3,
					source : 5,
					target : 6,
					type : "0"
				}, ],
			});
		</script>
	</div>
</div>