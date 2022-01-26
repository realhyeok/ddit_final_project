var projNo = getParameterByName("projNo");
console.log(projNo);

var ganttDataSource = new kendo.data.GanttDataSource({
	transport: {
		/*read: {
		      url: "https://demos.telerik.com/kendo-ui/service/GanttTasks",
		      dataType: "jsonp"
		    },*/
	    read: {
	      url: "/app/task/getTaskListForGanttByProjNo",
	      dataType: "json",
	      data: { "projNo": projNo }
	    }
	  },
	  schema: {
	    model: {
	      id: "id",
	     /* fields: {
	          id: { from: "ID", type: "number" },
	          orderId: { from: "OrderID", type: "number", validation: { required: true } },
	          parentId: { from: "ParentID", type: "number", validation: { required: false }, defaultValue: null },
	          start: { from: "Start", type: "date" },
	          end: { from: "End", type: "date" },
	          title: { from: "Title", defaultValue: "", type: "string" },
	          summary: { from: "Summary" },
	          expanded: { from: "Expanded" }
	        }*/
	      fields: {
	        id: { from: "taskNo", type: "number" },
	        orderId: { from: "OrderID", type: "number", validation: { required: true } },
	        parentId: { from: "ParentID", type: "number", validation: { required: true }, defaultValue: null },
	        start: { from: "startdate", type: "date" },
            end: { from: "enddate", type: "date" },
            title: { from: "title", defaultValue: "", type: "string" },
	      }
	    }
	  }

	});
	function projGantt() {
		$("#projGantt").kendoGantt({
			dataSource:ganttDataSource,
			tooltip: {
				visible: true,
			},
			toolbar:[
				{ template: "<a class='k-button' href='javascript:getOverlayTemplate(\"taskRegistFormTemplate\");'>업무 등록</a>" },
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
						{ field: "title", title: "업무명", editable: true },
						],
						autoSync:true,
						height:700,
						listWidth: 200,
						showWorkHours: false,
						showWorkDays: false,
						snap: true,
						editable: {
							dragPercentComplete: false
						},
		})
		kendo.culture("ko-KR");
		projGantt = function () {}
	}

