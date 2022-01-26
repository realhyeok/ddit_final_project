//받은 메일 시작
$(function(){
	var tempMailList = $("#tempMailList").kendoGrid({
		dataSource: {
			type: "json",
			transport: {
				read: "/app/myWork/getTempMailList?userFrom=realhyuk@ddit.com"
			},
			pageSize: 9,
			schema: {
				model: {
					fields: {
						mailNo  : { type: "string" },
						title   : { type: "string" },
						userTo  : { type: "string" },
						regDate : { type: "string" }
					}
				}
			},
			change: function(e) {
				var data = e.sender.data();
				if(data){
					tempMailDetail(data[0].mailNo);
				}
			}
		},
		batch: true,
		pageable: {
	        alwaysVisible: false
	    },
		toolbar: [
			{ template:
				"<div class='btn-group'>" +
					"<button type='button' class='btn btn-sm btn-dark' style='padding-top:5px;padding-bottom:0px;'>" +
						"<input id='tempAllCheckButton' type='checkbox' onchange='tempAllCheck();'>" +
					"</button>" +
					"<button type='button' class='btn btn-sm btn-dark btn-append' onclick='deleteTempMailAll();'>삭제</button>" +
				"</div>"
			},
			"search"
		],
		columns: [
			{ field: "mailNo" , hidden: true },    
			{ field: "title"  , hidden: true },    
			{ field: "userTo" , hidden: true }, 
			{ field: "regDate", hidden: true },
			{ template: kendo.template($("#tempMailList-template").html()) }
		]
	});
	
	$('#tempMailList').find('thead').hide();
});
