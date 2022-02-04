//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
var socket = null;

$(document).ready(function (){
	connectWs();
	updateAlertList(); // 실시간 알림 리스트 갱신
	getUserTotalCount(); // 유저 업무, 프로젝트, 이슈, 리퀘스트, 메일 총량 비동기 출력
});

function connectWs(){
	var sock = new WebSocket("ws://192.168.143.7/app/**");
	socket = sock;

	sock.onopen = function(e) {
				console.log('info: connection opened.');
	};

	sock.onmessage = function(event) {
//		console.log("ReceivMessage : " + event.data + "\n");

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

			toastr.success("["+ serderWhere +"]\n" + serderNickName + "님이 " + senderTarget + "를(을) " + senderWhatToDo + "했습니다.");
//			toastr.success("[가나다프로젝트]"+"\n"+"사이고님이 가나다업무를(을) 수정했습니다.");

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

function add_alert_li(alertData) {
  let ul = document.querySelector("#alertVOList");
  const li = document.createElement("li");

  li.innerHTML = `<li class="nav-item">
					  <a class="dropdown-item">
						  <span class="image">
						  	<img src="/resources/asserts/images/img.jpg" alt="Profile Image" />
						  </span>
						  <span>
							  <span>${alertData.nickname}</span>
							  <span class="time">${timeForToday(alertData.writeTime)}</span>
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
	success: function (data) {
//		console.log("res => " + JSON.stringify(data));
		if(data.length === 0){
			let ul = document.querySelector("#alertVOList");
			const li = document.createElement("li");
			li.innerHTML =`<li class="nav-item">
             					<strong>해당 내용이 없습니다.</strong>
				 			</li>`;
			  if (li.children.length > 0) {
				    ul.prepend(li.children[0]);
			  }
		}
		$(data).each(function(){
			add_alert_li(this);
//			console.log(this.userId + " " + timeForToday(this.writeTime));
		});
	},
	error: function (err) {
		console.log("updateAlertList err status : " + err.status);
	}
});
}

function timeForToday(value) {
    const today = new Date();
    const timeValue = new Date(value);

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
	
//////////////////////////////////////////////////////////////////////////////////////////////////
// 여기서부터 본인의 js파일에 구현해주세요. (개인이 구현해야될 부분)

// 	senderProjNo에 해당 프로젝트 넘버를 넣어주세요. 같은 구성원인지 비교합니다.
//	프로젝트 넘버가 필요없는 알림일 경우, 기본 값으로 0으로 지정합니다. DB의 PROJECT테이블에서 0은 사용하지 않는 상태입니다.
//	whatToDo에 "등록", "수정","삭제"라고만 적어주세요. "~~했습니다"라고 적지 마세요. 나중에 붙여줘야합니다. 
//  아래의 socketData에 들어갈 데이터는 반드시 5개여야합니다. 현재 socketData구조체에서 하나라도 로컬변수가 사라지면 에러납니다.
//  자신의 데이터에 맡게 변수명은 바꿔주세요. 그렇지 않으면 충돌이 일어납니다.
//	
	let socketData = {
			nickname : "작성자 닉네임(ex.도전자)",
			where : "어디서 작성했는지(ex.가나다 프로젝트)",
			target : "무엇을 작성햇는지 (ex.라마바 업무)",
			whatToDo : "어떤 CRUD를 했는지(수정/삭제/..)",
			projNo: "3",
			receiverId : "test29@gmail.com"
	};
	
	
    $("#doingTest").on("click", function (e) {
      e.preventDefault();

      
      if (socket) {
//    	  protocol : 누가(nickname) 어디서(분야) 무엇(target)을 curd(어떻게), 프로젝트 넘버
//    	  ","를 구분자로 분리합니다. 반드시 위처럼 순서대로 작성해주세요.
          let socketMsg = socketData.nickname 
				          + "," + socketData.where 
				          + "," + socketData.target 
				          + "," + socketData.whatToDo 
				          + "," + socketData.projNo
				          + "," + socketData.receiverId;
          console.log("socketData.receiverId => " + socketData.receiverId);
          
//        send()하게 되면 alert에 있는 AlertHandler의 handleTextMessage() 메서드로 파라미터를 전달하게 됩니다.
          socket.send(socketMsg);
        }
  
    });
//////////////////////////////////////////////////////////////////////////////////////////////////
// 개인용

function getUserTotalCount(){
	let taskTotalCount = document.querySelector('.dash-board-boxes .dashboard-stat .details .taskTotalCount');
	let issueTotalCount = document.querySelector('.dash-board-boxes .dashboard-stat .details .issueTotalCount');
	let requestTotalCount = document.querySelector('.dash-board-boxes .dashboard-stat .details .requestTotalCount');
	let mailTotalCount = document.querySelector('.dash-board-boxes .dashboard-stat .details .mailTotalCount');
	let collaboTotalCount = document.querySelector('.dash-board-boxes .dashboard-stat .details .collaboTotalCount');
	let projectTotalCount = document.querySelector('.dash-board-boxes .dashboard-stat .details .projectTotalCount');

	$.ajax({
		type: "get",
		url: "/getUserTotalCount.do",
		success: function (res) {
			taskTotalCount.innerHTML = res.taskCount;
			issueTotalCount.innerHTML = res.issueCount;
			requestTotalCount.innerHTML = res.requestCount;
			mailTotalCount.innerHTML = res.mailCount;
			collaboTotalCount.innerHTML = res.collaboCount;
			projectTotalCount.innerHTML = res.projectCount;
		},
		error: function (err) {
			console.log("getUserTotalCount() err status : " + err.status);
		}
	});
}
    
