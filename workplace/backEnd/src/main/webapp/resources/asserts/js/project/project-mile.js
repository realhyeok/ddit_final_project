

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
    	{ template: '<span class="k-d-flex k-flex-row k-align-items-center ml-3"><strong>마일스톤</strong></span><br><br>' },
        { template: '<span class="k-d-flex k-flex-row k-align-items-center ml-3"><span class="status-icon k-icon k-i-warning"></span>&nbsp;5 진행중</span>' },
        { template: '<span class="k-d-flex k-flex-row k-align-items-center"><span class="status-icon k-icon k-i-check"></span> 0 완료됨</span>' }
    ]
});
function readMile() {
	$("#mileList").empty();
	$("#mileList").kendoListView({
		dataSource:mileDataSource,
		selectable: true,
		change: function() {
			var index = this.select().index();
			var selectedData = this.dataSource.view()[index];

			console.log(selectedData.id);
			sortingIssueByClick(selectedData.id);
		},
		height:760,
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
}


