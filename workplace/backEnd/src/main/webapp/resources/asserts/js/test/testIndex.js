//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
var socket = null;

$(document).ready(function (){
	connectWs();
});

function connectWs(){
	var sock = new WebSocket("ws://localhost:8088/app/**");
	socket = sock;

	sock.onopen = function(e) {
				console.log('info: connection opened.');
	};

	sock.onmessage = function(event) {
		var data = event.data;
			console.log("ReceivMessage : " + data + "\n");
			toastr.success(event.data);
	
//			$.ajax({
//				url : '/app/test.do',
//				type : 'post',
//				dataType: 'text',
//				success : function(data) {
//					if(data == '0'){
//					}else{
//						$('#alarmCountSpan').addClass('bell-badge-danger bell-badge')
//						$('#alarmCountSpan').text(data);
//					}
//				},
//				error : function(err){
//					alert('err');
//				}
//			});
	};

	sock.onclose = function() {
		console.log('connect close');
		/* setTimeout(function(){conntectWs();} , 1000); */
	};

	sock.onerror = function (err) {console.log('Errors : ' , err);};

}

	
	var senderUserId = "apdlfthd@gmail.com";
	var serderNickName = "도전자나가신다!";
	var senderProjNo = "3";
    $("#doingTest").on("click", function(e){
    	e.preventDefault();
    	
    	var alarmData = {
    			"senderUserId" : senderUserId,
    			"serderNickName" : serderNickName,
    			"content" :  serderNickName + "님이 <a href='#'>돔황챠!!!</a> 에세이를  등록했습니다.",
    			"senderProjNo" : senderProjNo
    	};
    	
    	
    	if(socket){
    		let socketMsg = "test"+ "," + serderNickName + "," + senderProjNo;
    		console.log("msgmsg : " + socketMsg);
    		socket.send(socketMsg);
    	}
//    	$.ajax({
//    		type : 'post',
//    		url : '/app/test.do',
//    		data : JSON.stringify(alarmData),
//    		contentType: "application/json; charset=utf-8",
//    		dataType : 'json',
//    		success : function(data){
//    			
//    		},
//    		error : function(err){
//    			console.log(this + "에서 알림 전송 실패, 에러 상태 : " + err.status);
//    		}
//    	});
    });
	