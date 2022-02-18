

//이슈 데이터리소스
const mileDataSource = new kendo.data.DataSource({
		transport: {
			type:"json",
			read: "/app/milestone/getMilestoneListByProjNo?projNo="+projNo,
	    },
	    schema: {
            model: {
            	id:"id",
                fields: {
                	id : { from:"mileNo", type:"string"},
                	title: { from:"title", type: "string" },
                	content: { from:"content", type: "string" },
                	userId: { from:"userId", type: "string" },
                	regdate: { from:"regdate", type: "date"},
                	status: { from:"status", type: "string" },
                }
            }
        },

});


$('#toolbar').kendoToolBar({
    items: [
    	"search",
     	{ template: "<a class='k-button' href='javascript:getOverlayIssueRegistTemplate(\"issueRegistFormTemplate\",\"/app/issue/getIssueRegistInfoByProjNo\");'>이슈 등록</a>" }
      	],
});
var mileViewFlag = false;
function readMile() {
	if(mileViewFlag == true){
		reloadMile();
		return;
	}
	$("#mileList").kendoListView({
		dataSource:mileDataSource,
		selectable: true,
		change: function() {

			var index = this.select().index();
			var selectedData = this.dataSource.view()[index];

			console.log(selectedData.id);
			sortingIssueByClick(selectedData.id);

			//한번더 클릭시 해제 이벤트 추가필요

		},
		template: $("#mileTemplate").html(),
		dataBound: function() {
			$('.B301').kendoBadge({
				themeColor: 'tertiary',
				text: '진행중'
			});

			$('.B302').kendoBadge({
				themeColor: 'primary',
				text: '완료'
			});
		}

	});

	mileViewFlag = true;
}
function reloadMile() {
	$("#mileList").data("kendoListView").dataSource.read();
}

$('#search-term').on('keyup', function () {
    var search = $.trim($(this).val());
    if (search != "")
    	mileDataSource.filter({ field: "title", operator: "contains", value: search });
    else
    	mileDataSource.filter({});

     return;
});
