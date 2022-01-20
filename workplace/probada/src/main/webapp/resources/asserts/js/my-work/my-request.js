// 이슈 시작
$(document).ready(function () {
	var dataBase1 = [
		{
			"yourRequest": "1",
			"yourRequestImage": "img.jpg",
			"yourRequestName":"이동근",
			"yourRequestProject":"AA 프로젝트",
			"yourRequestDate": new Date('2022/1/11 1:00'),
			"yourRequestContent" : "BB프로젝트 콜라보 제의가 왔습니다.",
			"yourRequestButton" : "처리"
		},
		{
			"yourRequest": "2",
			"yourRequestImage": "img.jpg",
			"yourRequestName":"이동근",
			"yourRequestProject":"CC 프로젝트",
			"yourRequestDate":"\/Date(1593561600000)\/",
			"yourRequestContent" : "DD 프로젝트 콜라보 제의가 왔습니다.",
			"yourRequestButton" : "승낙"
		},
		{
			"yourRequest": "3",
			"yourRequestImage": "img.jpg",
			"yourRequestName":"이동근",
			"yourRequestProject":"EE 프로젝트",
			"yourRequestDate":"\/Date(1593561600000)\/",
			"yourRequestContent" : "FF 프로젝트 콜라보 제의가 왔습니다.",
			"yourRequestButton" : "거절"
		}];
  
	var yourRequestTable = $("#my-request1").kendoGrid({
    	toolbar: [
    		{ template: "<input type='search' id='yourProject-category' style='width: 120px;vertical-align:middle;'/>"},
			{ template: "<input type='search' id='yourStatus-category' style='width: 120px;vertical-align:middle;'/>"},    
    		"search"
    	],
    	pageSize: 10,
    	pageable: true,
    	sortable: false,
    	height: 600,
    	columns: [
        	{ field: "yourRequest",        hidden: true },
        	{ field: "yourRequestImage",   hidden: true },
      	    { field: "yourRequestName",    hidden: true },
      	    { field: "yourRequestProject", hidden: true },
      	    { field: "yourRequestDate",    hidden: true },
      	    { field: "yourRequestContent", hidden: true },
      	    { field: "yourRequestButton",  hidden: true },
      	    { template: kendo.template($("#myRequest1-template").html()) }
      	],
        dataSource: {
            data: dataBase1,
            schema: {
                model: {
                    fields: {
                    	yourRequest       : { type: "string" },
                    	yourRequestImage  : { type: "string" },
                    	yourRequestName   : { type: "string" },
                    	yourRequestProject: { type: "string" },
                    	yourRequestDate   : { type: "date"   },
                    	yourRequestContent: { type: "string" },
                    	yourRequestButton : { type: "string" }
                    }
                }
            }
        }
    });
    
	var yourProjectCategoryDB = [
        { CategoryName: "AA 프로젝트", CategoryValue: "AA 프로젝트"},
        { CategoryName: "BB 프로젝트", CategoryValue: "BB 프로젝트"},
        { CategoryName: "CC 프로젝트", CategoryValue: "CC 프로젝트"}
    ];
    
    var yourProjectDropdown =  yourRequestTable.find("#yourProject-category").kendoDropDownList({
    	dataTextField: "CategoryName",
        dataValueField: "CategoryValue",
        autoBind: false,
        optionLabel: "All",
        dataSource: {
        	data: yourProjectCategoryDB,
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
            	yourRequestTable.data("kendoGrid").dataSource.filter({ field: "yourRequestProject", operator: "eq", value: value });
            } else {
            	yourRequestTable.data("kendoGrid").dataSource.filter({});
            }
        }
    });
    
    
    var yourStatusCategoryDB = [
        { CategoryName: "처리", CategoryValue: "처리"},
        { CategoryName: "승낙", CategoryValue: "승낙"},
        { CategoryName: "거절", CategoryValue: "거절"}
    ];
    
    var yourStatusDropdown = yourRequestTable.find("#yourStatus-category").kendoDropDownList({
    	dataTextField: "CategoryName",
    	dataValueField: "CategoryValue",
    	autoBind: false,
    	optionLabel: "All",
    	dataSource: {
    		data: yourStatusCategoryDB,
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
    			yourRequestTable.data("kendoGrid").dataSource.filter({ field: "yourRequestButton", operator: "eq", value: value });
    		} else {
    			yourRequestTable.data("kendoGrid").dataSource.filter({});
    		}
    	}
    });
	
	var dataBase2 = [
		{
			"myRequest": "1",
			"myRequestImage": "img.jpg",
			"myRequestName":"이동근",
			"myRequestProject":"AA 프로젝트",
			"myRequestDate": new Date('2022/1/11 1:00'),
			"myRequestContent" : "BB프로젝트 콜라보 제의가 왔습니다.",
			"myRequestButton" : "대기"
		},
		{
			"myRequest": "2",
			"myRequestImage": "img.jpg",
			"myRequestName":"이동근",
			"myRequestProject":"AA 프로젝트",
			"myRequestDate":"\/Date(1593561600000)\/",
			"myRequestContent" : "BB프로젝트 콜라보 제의가 왔습니다.",
			"myRequestButton" : "승낙"
		},
		{
			"myRequest": "3",
			"myRequestImage": "img.jpg",
			"myRequestName":"이동근",
			"myRequestProject":"AA 프로젝트",
			"myRequestDate":"\/Date(1593561600000)\/",
			"myRequestContent" : "BB프로젝트 콜라보 제의가 왔습니다.",
			"myRequestButton" : "거절"
		}];
	
    var myRequestTable = $("#my-request2").kendoGrid({
    	toolbar: [    		
			{ template: "<input type='search' id='myProject-category' style='width: 120px;vertical-align:middle;'/>"},
			{ template: "<input type='search' id='myStatus-category' style='width: 120px;vertical-align:middle;'/>"},    		
    		"search"
    	],
    	pageSize: 10,
    	pageable: true,
    	sortable: false,
    	height: 600,
    	columns: [
        	{ field: "myRequest",        hidden: true },
        	{ field: "myRequestImage",   hidden: true },
      	    { field: "myRequestName",    hidden: true },
      	    { field: "myRequestProject", hidden: true },
      	    { field: "myRequestDate",    hidden: true },
      	    { field: "myRequestContent", hidden: true },
      	    { field: "myRequestButton",  hidden: true },
      	    { template: kendo.template($("#myRequest2-template").html()) }
      	],
        dataSource: {
            data: dataBase2,
            schema: {
                model: {
                    fields: {
                    	myRequest       : { type: "string" },
                    	myRequestImage  : { type: "string" },
                    	myRequestName   : { type: "string" },
                    	myRequestProject: { type: "string" },
                    	myRequestDate   : { type: "date"   },
                    	myRequestContent: { type: "string" },
                    	myRequestButton : { type: "string" }
                    }
                }
            }
        }
    });
    
    var myProjectCategoryDB = [
        { CategoryName: "AA 프로젝트", CategoryValue: "AA 프로젝트"},
        { CategoryName: "BB 프로젝트", CategoryValue: "BB 프로젝트"},
        { CategoryName: "CC 프로젝트", CategoryValue: "CC 프로젝트"}
    ];
    
    var myProjectDropdown =  myRequestTable.find("#myProject-category").kendoDropDownList({
    	dataTextField: "CategoryName",
        dataValueField: "CategoryValue",
        autoBind: false,
        optionLabel: "All",
        dataSource: {
        	data: myProjectCategoryDB,
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
            	myRequestTable.data("kendoGrid").dataSource.filter({ field: "myRequestProject", operator: "eq", value: value });
            } else {
            	myRequestTable.data("kendoGrid").dataSource.filter({});
            }
        }
    });
    
    
    var myStatusCategoryDB = [
        { CategoryName: "대기", CategoryValue: "대기"},
        { CategoryName: "승낙", CategoryValue: "승낙"},
        { CategoryName: "거절", CategoryValue: "거절"}
    ];
    
    var myStatusDropdown = myRequestTable.find("#myStatus-category").kendoDropDownList({
    	dataTextField: "CategoryName",
    	dataValueField: "CategoryValue",
    	autoBind: false,
    	optionLabel: "All",
    	dataSource: {
    		data: myStatusCategoryDB,
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
    			myRequestTable.data("kendoGrid").dataSource.filter({ field: "myRequestButton", operator: "eq", value: value });
    		} else {
    			myRequestTable.data("kendoGrid").dataSource.filter({});
    		}
    	}
    });
    /*
    $("table[role='grid']").find("thead").hide();*/
});
// 이슈 끝