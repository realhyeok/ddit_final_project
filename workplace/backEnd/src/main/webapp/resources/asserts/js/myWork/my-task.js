// 업무 시작
$(document).ready(function () {
	var cardsData = [
	    { id: 1, title: "업무페이지", order: 1, description: "업무페이지를 구현", status: "todo", color: "orange", taskProject: "AA 프로젝트" },
	    { id: 2, title: "이슈페이지", order: 2, description: "이슈페이지를 구현", status: "todo", color: "blue", taskProject: "AA 프로젝트" },
	    { id: 3, title: "간트차트", order: 3, description: "간트차트를 구현", status: "todo", color: "green", taskProject: "BB 프로젝트" },
	    { id: 4, title: "마일스톤", order: 4, description: "마일스톤를 구현", status: "inProgress", color: "blue", taskProject: "BB 프로젝트" },
	    { id: 5, title: "문서관리", order: 5, description: "문서관리를 구현", status: "inProgress", color: "orange", taskProject: "BB 프로젝트" },
	    { id: 6, title: "히스토리", order: 6, description: "히스토리를 구현", status: "done", color: "green", taskProject: "CC 프로젝트" },
	    { id: 7, title: "상세페이지", order: 7, description: "상세페이지를 구현", status: "done", color: "green", taskProject: "CC 프로젝트" },
	    { id: 8, title: "등록페이지", order: 8, description: "등록페이지를 구현", status: "done", color: "blue", taskProject: "CC 프로젝트" }
	];
	
	var taskTable = $("#my-taskBoard").kendoTaskBoard({
		template: $("#myTask-template").html(),
	    columns: [
	        { text: "예정", status: "todo" },
	        { text: "진행중", status: "inProgress" },
	        { text: "지연", status: "Delay" },
	        { text: "완료", status: "done" }
	    ],
	    toolbar: {
	        items: [
	        	{ template: "<button class='btn btn-sm btn-dark m-0' type='button' onclick=\"location.href='/app/myWork/myTaskRegistForm';\">등록</button>" },
	            "spacer",
	            { template: "<input type='search' id='taskProject-category' style='width: 120px;vertical-align:middle;'/>" },
	            "search"
	        ]
	    },
	    dataSource: {
	        data: cardsData,
	        schema: {
	            model: {
	                id: "id",
	                fields: {
	                    id         : { type: "number" },
	                    order      : { type: "number", defaultValue: 0 },
	                    title      : { field: "title", defaultValue: "No title" },
	                    description: { field: "description", validation: { required: true } },
	                    taskProject: { type: "string" }
	                }
	            }
	        }
	    },
	    previewPane: {
	        template: "<p>#:Description#</p>" +
	            "<p>#:resources.Category.title#: <span style='background-color: #:resources.Category.color#'>&nbsp;</span> #:resources.Category.text#</p>"
	    },
	    dataStatusField: "status",
	    dataOrderField: "order",
	    dataCategoryField: "color",
	    height: 750,
	    columnSettings: {
	        width: 220,
	      },
	    resources: [
	        {
	            field: "color",
	            dataSource: [
	                { value: "orange", color: "#ffa500" },
	                { value: "green", color: "#008000" },
	                { value: "blue", color: "#0000ff" }
	            ]
	        }
	    ]
	});
	// 업무 끝
	
	var taskProjectCategoryDB = [
	    { CategoryName: "AA 프로젝트", CategoryValue: "AA 프로젝트"},
	    { CategoryName: "BB 프로젝트", CategoryValue: "BB 프로젝트"},
	    { CategoryName: "CC 프로젝트", CategoryValue: "CC 프로젝트"}
	];
	
	var yourProjectDropdown =  taskTable.find("#taskProject-category").kendoDropDownList({
		dataTextField: "CategoryName",
	    dataValueField: "CategoryValue",
	    autoBind: false,
	    optionLabel: "All",
	    dataSource: {
	    	data: taskProjectCategoryDB,
	        schema: {
	            model: {
	                fields: {
	                	CategoryName : { type: "string" },
	                    CategoryValue: { type: "string" }
	                }
	            }
	        }
	    },
	    change: function() {
	        var value = this.value();
	        if (value) {
	        	taskTable.data("kendoTaskBoard").dataSource.filter({ field: "taskProject", operator: "eq", value: value });
	        } else {
	        	taskTable.data("kendoTaskBoard").dataSource.filter({});
	        }
	    }
	});
});