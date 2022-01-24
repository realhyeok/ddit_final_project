var projNo = getParameterByName("projNo");
console.log(projNo);


// 프로젝트 리스트 데이터소스
const projDataSource = new kendo.data.DataSource({
      type: "json",
      transport: {
          read: "/app/project/getProjectList"
      },
      schema: {
          model: {
              fields: {
            	  title: { type: "string" },
            	  startdate: { type: "date" },
            	  enddate: { type: "date" },
            	  status: { type: "string" },
            	  updatedate: { type: "date" },
              }
          }
      }
});

// 태스크 데이터리소스
const taskDataSource = new kendo.data.DataSource({
		transport: {
			read: "/app/task/getTaskListByProjNo?projNo="+projNo,
	    },
	    schema: {
	    	model: {
	    		fields: {
	    			taskNo: { type: "string" },
	    			title: { type: "string" },
	    			userId: { type: "string" },
	    			content: { type: "string" },
	    			important: { type: "string" },
	    			regdate: { type: "date", format:"{0:yy-MM-dd}"},
	    			startdate: { type: "date", format:"{0:yy-MM-dd}" },
	    			enddate: { type: "date", format:"{0:yy-MM-dd}" },
	    			updatedate: { type: "date", format:"{0:yy-MM-dd}" },
	    			status: { type: "string" },
	    		}
	    	}
	    },
});

//

const projList = $("#project-list").kendoGrid({
	pageable:true,
	toolbar: [
		{ template: "<a class='k-button' href='javascript:overlay(\"이슈\");'>프로젝트 등록</a>" }
		,{ template: "<div class='k-spacer'>&nbsp;</div>"},"search","pdf"
	],
    columns: [
    	{ field: "title", hidden:true},
    	{ field: "status", hidden:true },
		{ field: "startdate", hidden:true },
		{
			template: $("#projectCardTemplate").html()
		}
	],
	dataSource: projDataSource,
});

$(".k-toolbar.k-grid-toolbar").css("flex","1 1 auto");
$("table[role='grid']").find("thead").hide();

//
$("#taskBoard").kendoTaskBoard({
	template: $("#card-template").html(),
    columns: [
        { text: "예정", status: "B201" },
        { text: "진행중", status: "B202" },
        { text: "지연", status: "B203" },
        { text: "완료", status: "B204" }
    ],
    toolbar: {
        items: [
        	{ template: "<button class='k-button' type='button' onclick='overlay(\"업무\")'>업무 등록</button>" },
            "spacer",
            "search"
        ]
    },
    dataSource: taskDataSource,
    dataStatusField: "status",
    height: 750,
    columnSettings: {
    	width:220,
         buttons: []
      },
});


// url 파라미터값 가져오기
function getParameterByName(name) {
  	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
   	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
   	results = regex.exec(location.search);
   	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}