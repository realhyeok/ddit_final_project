function receiveMailBox(userId){
	receiveMailBox = function(){};
	
	var sessionId = userId;
	
	var myReceiveMailDateSource = new kendo.data.DataSource({
		transport: {
			read: "/app/myWork/getReceiveMailList?userTo=" + sessionId
		},
		pageSize: 7,
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
	    height: 580,
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
		messages: {
			commands: {
				search: "검색"
		    }
		},
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
}

//콜라보 메일 관련

function acceptCollabo() {
	
	alert("수락수락");
	
	let userFromCproj = document.getElementById('cprojReplyUserTo').value; //test29
	console.log("userFrom =>" + userFromCproj);
	
	let userToCproj = document.getElementById('cprojReplyUserFrom').innerText; //pooh_00
	console.log("userTo =>" + userToCproj);
	
	let title = document.getElementById('CollboMailTitle').value + "제안 수락메일입니다.";
	
	console.log("title =>" + title);
	
	let receiveContent = replyMailForm(userFromCproj,userToCproj);
	console.log("receiveContent =>" + receiveContent);
	
	document.getElementById('collaboContent').value = receiveContent;
	
	document.getElementById('tags_1').value = userToCproj;
	
	document.getElementById('CollboMailTitle').value = title;
	
	console.log(document.getElementById('collaboContent').value);
	
	document.collaboMailRegist.submit();
	
}
function replyMailForm(userFromCproj,userToCproj) {
	
	let receiveContent = "";
	receiveContent +=
		`
		<div class="x_content">
		<div class="item form-group">
			<h4>`+userFromCproj+`님이 콜라보 제안을 수락하셨습니다.</h4>
		</div>
		
		<div class="col-md-6 col-sm-6 offset-md-3">
		<button class="btn btn-primary" type="button" onclick="";>바로 가기</button>
		</div>
		
		</div>  
		`;
	
	return receiveContent;
	
}
















