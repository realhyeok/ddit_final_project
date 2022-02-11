// 이슈 시작
var issueGridFlag = false;

function readMyIssue(uid){
	var sessionId = uid;
	
	const myIssueDataSource = new kendo.data.DataSource({
		transport: {
			read: "/app/issue/getIssueListByUserId?userId=" + sessionId,
		},
		schema: {
			model: {
				id: "id",
				fields: {
					title     : { from:"title"     , type: "string" },
					important : { from:"important" , type: "string" },
					userId    : { from:"userId"    , type: "string" },
					updatedate: { from:"updatedate", type: "date"   },
					status    : { from:"status"    , type: "string" },
					mileNo    : { from:"mileNo"    , type: "string" }
				}
			}
		}
	});
	
	if(issueGridFlag == true){
		$("#myIssueGrid").data("kendoGrid").dataSource.read();
		return;
	}
	
	var myIssueTable = $("#myIssueGrid").kendoGrid({
		dataSource: myIssueDataSource,
		toolbar: [
			{ template: "<a class='k-button' href='javascript:getOverlayIssueRegistTemplate(\"issueRegistFormTemplate\",\"/app/issue/getIssueRegistInfoByProjNo\");'>이슈 등록</a>" },
			{ template: "<input type='search' id='myIssueProject-category' style='width: 170px;vertical-align:middle;'/>" },
			"search"
		],
		columns: [
			{
				selectable: true,
				hidden: true,
				width: 75,
				attributes: {
					"class" : "checkbox-align"
				},
				headerAttributes: {
					"class" : "checkbox-align"
				}
			},
			{
				field: "title",
				title: "이슈 제목",
				template: "<a href=\"javascript:getIssueTemplate('/app/issue/getIssueByIssueNo','#:issueNo#','issueDetailForm','issueDetailFormTarget')\" class='text-dark'>#:title#</a>",
				width: 200,
				encoded: false
			},
			{
				field: "important",
				title: "중요도",
				template: "<span id='badge_success' class='badgeTemplate badge_success'>#=important#</span>",
				width: 125,
				editable: false
			},
			{
				field: "userId",
				title: "작성자",
				width: 125
			},
			{
				field: "status",
				title: "진행상태",
				width: 125
			},
			{
				field: "updatedate",
				title: "갱신일",
				format: "{0:yy-MM-dd}",
				width: 100
			}
		]
	});
	
	var issueGrid = $("#myIssueGrid").data("kendoGrid");
	issueGrid.setOptions({
		batch: true,
	    autoSync: false,
	    height: "100%",
	    numeric: true,
	    sortable: true,
	    navigatable: true,
	    resizable: true,
	    groupable: true
	});
			
	issueGridFlag = true;
	
	var myIssueDropdown = myIssueTable.find("#myIssueProject-category").kendoDropDownList({
		dataSource: {
			type: "json",
	        transport: {
	        	read: "/app/issue/getIssueSortByUserId?userId=" + sessionId
	        },
			schema: {
				model: {
					fields: {
						projTitle : { type: "string" }
					}
				}
			}
		},
		dataTextField: "projTitle",
		dataValueField: "projTitle",
		autoBind: false,
		optionLabel: "All",
		change: function() {
			var value = this.value();
			if (value) {
				myIssueTable.data("kendoGrid").dataSource.filter({ field: "projTitle", operator: "eq", value: value });
			} else {
				myIssueTable.data("kendoGrid").dataSource.filter({});
			}
		}
	});
}
//이슈 끝

function readMileIssue(){
	getDefaultTemplate('issueListTemplate','issue-content');
	setTimeout(readIssue,200);
	setTimeout(readMile,200);
}
