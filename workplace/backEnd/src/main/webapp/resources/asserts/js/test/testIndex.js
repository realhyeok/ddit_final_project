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
		console.log("ReceivMessage : " + event.data + "\n");

		let datas = event.data.split(',');
		if(datas != null && datas.length == 6){

			let serderNickName = datas[0];
			let serderWhere = datas[1];
			let senderTarget = datas[2];
			let senderWhatToDo = datas[3];
			let senderProjNo = datas[4];
			let receiverUserId = datas[5];
			
			var alertData = {
				serderNickName: serderNickName,
				receiverUserId: receiverUserId,
				content: "["+ serderWhere +"]\n" + serderNickName + "님이 " + senderTarget + "를(을) " + senderWhatToDo + "했습니다."
			};

//			toastr.success("["+ serderWhere +"]\n" + serderNickName + "님이 " + senderTarget + "를(을) " + senderWhatToDo + "했습니다.");
			toastr.success("[가나다프로젝트]"+"\n"+"사이고님이 가나다업무를(을) 수정했습니다.");

			$.ajax({
					type: "post",
					url: "/app/addToAlertList.do",
					data: JSON.stringify(alertData),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					success: function (data) {
						add_alert_li(data);
					},
					error: function (err) {
						console.log(this + "에서 알림 전송 실패, 에러 상태 : " + err.status);
					},
			});
		}
	
	};

	sock.onclose = function() {
		console.log('info: connection closed');
		/* setTimeout(function(){conntectWs();} , 1000); */
	};

	sock.onerror = function (err) {console.log('Errors : ' , err);};

}

	

	let socketData = {
			nickname : "작성자 닉네임(ex.도전자)",
			where : "어디서 작성했는지(ex.가나다 프로젝트)",
			target : "무엇을 작성햇는지 (ex.라마바 업무)",
			whatToDo : "어떤 CRUD를 했는지(수정/삭제/..)",
			projNo: "3"
//			~~했습니다는 적지 마세요. 나중에 붙여줘야합니다. 
// 			senderProjNo에 해당 프로젝트 넘버를 넣어주세요. 같은 구성원인지 비교합니다.
	};
	
	
    $("#doingTest").on("click", function (e) {
      e.preventDefault();

      
      if (socket) {
//    	  protocol : 누가(nickname) 어디서(분야) 무엇(target)을 curd(어떻게)
//    	  ","를 구분자로 분리합니다. 반드시 위처럼 순서대로 작성해주세요.
          let socketMsg = socketData.nickname + "," + socketData.where + "," + socketData.target + "," + socketData.whatToDo + "," + socketData.projNo;
          console.log("msgmsg : " + socketMsg);
          socket.send(socketMsg);
        }
  
    });

    function add_alert_li(alertData) {
      let ul = document.querySelector("#alertVOList");
	  const li = document.createElement("li");
	  li.innerHTML = `<li class="nav-item">
						<a class="dropdown-item" id="doingTest">
							<span class="image">
								<img src="/resources/asserts/images/img.jpg" alt="Profile Image" />
							</span>
							<span>
								<span>${alertData.serderNickName}</span>
								<span class="time">3 mins ago</span>
							</span>
							<span class="message">${alertData.content}</span>
						</a>
					  </li>`;
	  while (li.children.length > 0) {
        ul.prepend(li.children[0]);
      }
    }

function updateAlertList() {
	$.ajax({
		type: "post",
		url: "/app/updateAlertList.do",
//		data : ${userVO.userId},
		success: function (res) {
			let alertList = res;
			console.log("alertList => " + alertList);
			
		},
		error: function (err) {
			console.log("updateAlertList err status : " + err.status);
		}
	});
}
    
    function timeForToday(value) {
        const today = new Date();
        const timeValue = new Date(value);
//        const timeValue = value;

        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        if (betweenTime < 1) return '방금전';
        if (betweenTime < 60) {
            return `${betweenTime}분전`;
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
            return `${betweenTimeHour}시간전`;
        }

        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
            return `${betweenTimeDay}일전`;
        }

        return `${Math.floor(betweenTimeDay / 365)}년전`;
 }