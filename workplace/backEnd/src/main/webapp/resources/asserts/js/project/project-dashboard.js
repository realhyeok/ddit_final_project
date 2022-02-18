var projNo = getParameterByName("projNo");

function readProjDashboard (){
	$("#projectHistoryDashboard").kendoGrid({
		dataSource: {
			type: "json",
			transport: {
				read: "/app/myWork/getProjHistory?projNo=" + projNo
			},
			pageSize: 3,
			schema: {
				model: {
					fields: {
						msg     : { type: "string" },
						url     : { type: "string" },
						regDate : { type: "string" },
						projNo  : { type: "string" },
						dist    : { type: "string" },
						userId  : { type: "string" },
						act     : { type: "string" }
					}
				}
			}
		},
	    batch: true,
	    pageable: false,
		noRecords: {
			template: function(e) {
				return "<h2>히스토리가 존재하지 않습니다.</h2>";
			}
		},
		scrollable: false,
	    columns: [
	    	{ field: "msg",     hidden:true },
	    	{ field: "url",     hidden:true },
	    	{ field: "regDate", hidden:true },
	    	{ field: "projNo",  hidden:true },
	    	{ field: "dist",    hidden:true },
	    	{ field: "userId",  hidden:true },
	    	{ field: "act",     hidden:true },
	    	{ template: kendo.template($("#projectHistoryDashboard-template").html()) }
	    ]
	});
	$("#projectHistoryDashboard").find("thead").hide();
}