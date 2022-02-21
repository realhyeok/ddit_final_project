var cprojNo = getParameterByName("cprojNo");
console.log(projNo);

var ganttDataSource = new kendo.data.GanttDataSource({
	transport: {
	    read: {
	      url: "/app/task/getTaskListForGanttByProjNo",
	      dataType: "json",
	      data: { "cprojNo": cprojNo }
	    }
	  },
	  schema: {
	    model: {
	      id: "id",
	      fields: {
	        id: { from: "taskNo", type: "number" },
	        orderId: { from: "OrderID", type: "number", validation: { required: true } },
	        parentId: { from: "ParentID", type: "number", validation: { required: true }, defaultValue: null },
	        start: { from: "startdate", type: "date" },
            end: { from: "enddate", type: "date" },
            title: { from: "title", defaultValue: "", type: "string" },
	      }
	    }
	  },
	  sort: {field: "updatedate", dir:"desc"},
	});
	function projGantt() {
		$("#collaboGantt").empty();
		var projectGantt = $("#collaboGantt").kendoGantt({
			dataSource:ganttDataSource,
			tooltip: {
				visible: true,
			},
			toolbar:[
				{ template: "<a class='k-button' href='javascript:getOverlayRegistCollaboTaskTemplate(\"collaboTaskRegistFormTemplate\",\"/app/collabo/getTaskRegistInfoByCprojNo\")'>" +
						"업무 등록</a>" },
				{ name: "pdf" }
				],
				views: [
					"day",
					{ type: "week",
						selected: true
					},
					{ type: "month",

					}
					],
					columns: [
						{ field: "title", title: "업무명", editable: true,
							template: "<a href=\"javascript:getTaskTemplate('/app/collabo/getTaskDetailByTaskNo',#:id#,'collaboTaskDetailForm','collaboTaskDetailFormTarget')\" class='text-dark'>#:title#</a>"}
						],
						autoSync:true,
						height:774,
						listWidth: 200,
						showWorkHours: false,
						showWorkDays: false,
						snap: true,
						editable: {
							update: false,
							remove: false,
							move: false,
						},
		})
		kendo.culture("ko-KR");
	}

	function ganttRefresh() {
		 var projectGantt = $("#collaboGantt").getKendoGantt();
			projectGantt.dataSource.read()
			projectGantt.dependencies.read()
	}