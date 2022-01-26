//히스토리 시작
var projectHistoryTable = $("#projectHistory").kendoGrid({
	dataSource: {
		type: "json",
		transport: {
			read: "/app/myWork/getHistory?userId=realhyuk@ddit.com"
		},
		pageSize: 10,
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
    pageable: {
        alwaysVisible: true,
        pageSizes: [5, 10, 20, 100]
    },
    toolbar: [
		{ template: "<input type='search' id='projectHistoryProject-category' style='width:150px;vertical-align:middle;'/>"},
		{ template: "<input type='search' id='projectHistoryDist-category' style='width:150px;vertical-align:middle;'/>"},
    	"search"
	],
    columns: [
    	{ field: "msg",     hidden:true },
    	{ field: "url",     hidden:true },
    	{ field: "regDate", hidden:true },
    	{ field: "projNo",  hidden:true },
    	{ field: "dist",    hidden:true },
    	{ field: "userId",  hidden:true },
    	{ field: "act",     hidden:true },
    	{ template: $("#projectHistory-template").html() }
    ]
});

$("#projectHistory").find("thead").hide();

var projectHistoryProjectDropdown = projectHistoryTable.find("#projectHistoryProject-category").kendoDropDownList({
	dataSource: {
		type: "json",
        transport: {
        	read: "/app/myWork/getprojectHistoryProjectSort?userId=realhyuk@ddit.com"
        },
		schema: {
			model: {
				fields: {
					projNo : { type: "string" }
				}
			}
		}
	},
	dataTextField: "projNo",
	dataValueField: "projNo",
	autoBind: false,
	optionLabel: "All",
	change: function() {
		var value = this.value();
		if (value) {
			projectHistoryTable.data("kendoGrid").dataSource.filter({ field: "projNo", operator: "eq", value: value });
		} else {
			projectHistoryTable.data("kendoGrid").dataSource.filter({});
		}
	}
});

var projectHistoryDistDropdown = projectHistoryTable.find("#projectHistoryDist-category").kendoDropDownList({
	dataSource: {
		type: "json",
		transport: {
			read: "/app/myWork/getprojectHistoryDistSort?userId=realhyuk@ddit.com"
		},
		schema: {
			model: {
				fields: {
					dist : { type: "string" }
				}
			}
		}
	},
	dataTextField: "dist",
	dataValueField: "dist",
	autoBind: false,
	optionLabel: "All",
	change: function() {
		var value = this.value();
		if (value) {
			projectHistoryTable.data("kendoGrid").dataSource.filter({ field: "dist", operator: "eq", value: value });
		} else {
			projectHistoryTable.data("kendoGrid").dataSource.filter({});
		}
	}
});
// 히스토리 끝