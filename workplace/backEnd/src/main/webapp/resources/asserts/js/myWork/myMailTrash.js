//휴지통 메일 시작
window.addEventListener('load', function() {
	var sessionId = $('#sessionId').val();
	
	var trashMailList = $("#trashMailList").kendoGrid({
		dataSource: {
			type: "json",
			transport: {
				read: "/app/myWork/getTrashMailList?userId=" + sessionId
			},
			pageSize: 9,
			schema: {
				model: {
					fields: {
						mailNo   : { type: "number" },
						title    : { type: "string" },
						userTo   : { type: "string" },
						regDate  : { type: "string" },
						userTo   : { type: "string" },
						userFrom : { type: "string" }
					}
				}
			},
			change: function(e) {
				var data = e.sender.data();
				if(data){
					trashMailDetail(data[0].mailNo);
				}
			}
		},
		batch: true,
		noRecords: true,
		pageable: {
	        alwaysVisible: false
	    },
	    height: 600,
		toolbar: [
			{ template:
				"<div class='btn-group'>" +
					"<button type='button' class='btn btn-sm btn-dark' style='padding-top:5px;padding-bottom:0px;cursor:default;'>" +
						"<input id='trashAllCheckButton' type='checkbox' onchange='trashAllCheck();'>" +
					"</button>" +
					"<button type='button' class='btn btn-sm btn-dark btn-append' onclick='deleteTrashMailAll();'>삭제</button>" +
				"</div>"
			},
			"search"
		],
		noRecords: {
			template: function(e) {
				return "No data available on current page. Current page is: ";
			}
		},
		columns: [
			{ field: "mailNo"  , hidden: true },    
			{ field: "title"   , hidden: true },    
			{ field: "userTo"  , hidden: true }, 
			{ field: "regDate" , hidden: true },
			{ field: "userTo"  , hidden: true },
			{ field: "userFrom", hidden: true },
			{ template: kendo.template($("#trashMailList-template").html()) }
		]
	});
	
	$('#trashMailList').find('thead').hide();
});
//휴지통 메일 끝