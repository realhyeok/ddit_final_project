function receiveMailBox(userId){
	receiveMailBox = function(){};
	
	var sessionId = userId;
	
	var myReceiveMailDateSource = new kendo.data.DataSource({
		transport: {
			read: "/app/myWork/getReceiveMailList?userTo=" + sessionId
		},
		pageSize: 9,
		schema: {
			model: {
				fields: {
					mailNo   : { type: "number" },
					title    : { type: "string" },
					userFrom : { type: "string" },
					regDate  : { type: "string" }
				}
			}
		},
		change: function(e) {
			var data = e.sender.data();
			if(data[0]){
				receiveMailDetail(data[0].mailNo);
			}else{
				mailNoDetail("receive");
			}
		}
	});
	
	var receiveMailList = $("#receiveMailList").kendoGrid({
		dataSource: myReceiveMailDateSource,
		batch: true,
		pageable: {
	        alwaysVisible: false
	    },
	    height: 600,
		toolbar: [
			{ template:
				"<div class='btn-group'>" +
					"<button type='button' class='btn btn-sm btn-dark' style='padding-top:5px;padding-bottom:0px;cursor:default;'>" +
						"<input id='receiveAllCheckButton' type='checkbox' onchange='receiveAllCheck();'>" +
					"</button>" +
					"<button type='button' class='btn btn-sm btn-dark btn-append' onclick='deleteReceiveMailAll();'>삭제</button>" +
				"</div>"
			},
			"search"
		],
		noRecords: {
			template: function(e) {
				return "<h2>메일이 존재하지 않습니다.</h2>";
			}
		},
		columns: [
			{ field: "mailNo"  , hidden: true },    
			{ field: "title"   , hidden: true },    
			{ field: "userFrom", hidden: true }, 
			{ field: "regDate" , hidden: true },
			{ template: kendo.template($("#receiveMailList-template").html()) }
		]
	});
	
	$('#receiveMailList').find('thead').hide();
	
	receiveMailList.refresh();
}
