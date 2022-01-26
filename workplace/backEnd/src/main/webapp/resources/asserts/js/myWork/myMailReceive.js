//받은 메일 시작
$(function(){
	var receiveMailList = $("#receiveMailList").kendoGrid({
		dataSource: {
			type: "json",
			transport: {
				read: "/app/myWork/getReceiveMailList?userTo=realhyuk@ddit.com"
			},
			pageSize: 9,
			schema: {
				model: {
					fields: {
						mailNo   : { type: "string" },
						title    : { type: "string" },
						userFrom : { type: "string" },
						regDate  : { type: "string" }
					}
				}
			},
			change: function(e) {
				var data = e.sender.data();
				if(data){
					receiveMailDetail(data[0].mailNo);
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
						"<input id='receiveAllCheckButton' type='checkbox' onchange='receiveAllCheck();'>" +
					"</button>" +
					"<button type='button' class='btn btn-sm btn-dark btn-append' onclick='deleteReceiveMailAll();'>삭제</button>" +
				"</div>"
			},
			"search"
		],
		columns: [
			{ field: "mailNo"  , hidden: true },    
			{ field: "title"   , hidden: true },    
			{ field: "userFrom", hidden: true }, 
			{ field: "regDate" , hidden: true },
			{ template: kendo.template($("#receiveMailList-template").html()) }
		]
	});
	
	$('#receiveMailList').find('thead').hide();
});
