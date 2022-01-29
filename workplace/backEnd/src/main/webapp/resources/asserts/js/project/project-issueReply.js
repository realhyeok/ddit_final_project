var projNo = getParameterByName("projNo");
console.log(projNo);

// 이슈 데이터리소스
const IssueDataSource = new kendo.data.DataSource({
		transport: {
			read: "/app/issue/getIssueListByProjNo?projNo="+projNo,
	    },
	    schema: {
            model: {
            	id:"id",
                fields: {
                	title: { from:"title", type: "string" },
                	important: { from:"important", type: "string" },
                	userId: { from:"userId", type: "string" },
                	updatedate: { from:"updatedate", type: "date"},
                	status: { from:"status", type: "string" },
                	mileNo : { from:"mileNo", type: "string"}
                }
            }
        },
});

// 이슈 시작
var issueGridFlag = false;
function readIssue() {
			if(issueGridFlag == true){
				reloadIssue();
				return;
			}
			$("#issueGrid").kendoGrid({
				dataSource:IssueDataSource,
	             toolbar: [
	             	{ template: "<a class='k-button' href='javascript:getOverlayTemplate(\"issueRegistFormTemplate\");'>이슈 등록</a>" }
	             	,"search","excel", "pdf" ],
	             columns: [{
	                 selectable: true,
	                 hidden:true,
	                 width: 75,
	                 attributes: {
	                     "class": "checkbox-align",
	                 },
	                 headerAttributes: {
	                     "class": "checkbox-align",
	                 }
	             },  {
	                 field: "title",
	                 title: "이슈 제목",
	                 template: "<a href=\"javascript:getIssueTemplate('/app/issue/getIssueByIssueNo','#:issueNo#','issueDetailForm','issueDetailFormTarget')\" class='text-dark'>#:title#</a>",
	                 width: 200,
	                 encoded: false,
	             }, {
	                 field: "important",
	                 title: "중요도",
	                 template: "<span id='badge_success' class='badgeTemplate badge_success'>#=important#</span>",
	                 width: 125,
	                 editable: false,
	             }, {
	                 field: "userId",
	                 title: "작성자",
	                 width: 125
	             }, {
	                 field: "status",
	                 title: "진행상태",
	                 width: 125
	             },{
	                 field: "updatedate",
	                 title: "갱신일",
	                 format: "{0:yy-MM-dd}",
	                 width: 100
	             },  ],
	         });
			issueGridSetOpt();
			
			issueGridFlag = true;
}

function issueGridSetOpt(){
	var issueGrid = $("#issueGrid").data("kendoGrid");
	issueGrid.setOptions({
		 batch: true,
	     autoSync: false,
	     height: "100%",
	     numeric: true,
	     sortable: true,
	     navigatable: true,
	     resizable: true,
	     groupable: true,
	})
}

function reloadIssue() {
	$("#issueGrid").data("kendoGrid").dataSource.read();
}



		const sortingIssueByClick = function(tData) {
			var externalFilter = {
		              filters:[
		            	  { field:"mileNo", value:tData,
		            		  operator: "contains" }
		              ]
		            };
			$("#issueGrid").data("kendoGrid").dataSource.filter(externalFilter);
		}

		function readMileIssue(){
			getDefaultTemplate('issueListTemplate','issue-content');
			setTimeout(readIssue,200);
			setTimeout(readMile,200);
		}
