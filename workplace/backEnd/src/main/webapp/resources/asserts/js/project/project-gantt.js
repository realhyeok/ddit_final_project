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
	  chagne: function(e){
		  var data = this.data();
		  console.log("overhereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"+data);
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
	        userId: { from: "userId", type: "string" },
	        orderId: { from: "OrderID", type: "number", validation: { required: true } },
	        parentId: { from: "ParentID", type: "number", validation: { required: true }, defaultValue: null },
	        start: { from: "startdate", type: "date" },
            end: { from: "enddate", type: "date" },
            title: { from: "title", defaultValue: "", type: "string" },
	      }
	    }
	  }

	});

function myGantt() {
		$("#gantt").kendoGantt({
			culture:"jp-JP",
			toolbar:[
				{ template: "<a class='k-button' href='javascript:overlay(\"업무\");'>업무 등록</a>" },
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
			dataSource: ganttDataSource,
			columns: [
               { field: "title", title: "업무명", editable: true, width: 255 },
           ],
				height:700,
				editable: {
				    dragPercentComplete: false
				  },
				  rowHeight: 20,
		})
		var gantt = $("#gantt").data("kendoGantt");
		kendo.culture("ko-KR");
		myGantt = function() {}
	}
