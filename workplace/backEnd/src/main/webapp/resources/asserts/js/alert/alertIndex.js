//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
var socket = null;

$(document).ready(function (){
	connectWs();
	updateAlertList(); // 실시간 알림 리스트 갱신
	getListToAsideBar(); // 실시간 aside바 리스트들 갱신
	if(window.location.pathname === "/app/index"){
		getUserTotalCount(); // 유저 업무, 프로젝트, 이슈, 리퀘스트, 메일 총량 비동기 출력
	}
	if(getCookie("allAlertCheckBox")){
		$('#allAlertCheckBox').prop('checked', true);
	}
});

function connectWs(){
//	var sock = new WebSocket("ws://192.168.143.7/app/**");
	var sock = new WebSocket("ws://localhost/app/**");
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

			if($('#allAlertCheckBox').is(':checked') == false){
				toastr.success("["+ serderWhere +"]\n" + serderNickName + "님이 " + senderTarget + "를(을) " + senderWhatToDo + "했습니다.");
			} 

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
		var alertList = data.alertList;
		var alertCount = data.alertCount;
//		console.log("res => " + JSON.stringify(data));
		$('span.badge.bg-green').html(alertCount);
		if(alertList.length === 0){
			let alert_ul = document.querySelector("#alertVOList");
			const li = document.createElement("li");
			li.innerHTML =`<li class="nav-item">
             					<strong>해당 내용이 없습니다.</strong>
				 			</li>`;
			alert_ul.prepend(li.children[0]);
		}
		$(alertList).each(function(){
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
			where : "메일",
			target : "무엇을 작성햇는지 (ex.라마바 업무)",
			whatToDo : "어떤 CRUD를 했는지(수정/삭제/..)",
			projNo: "0",
			receiverId : "test30@example.com"
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
    
// aside에 있는 리스트를 비동기로 실시간 갱신하여 출력한다.
function getListToAsideBar() {
	$.ajax({
		type: "post",
		url: "/app/getListToAsideBar.do",
		success: function (resp) {
			let taskList = resp.taskList;
			let projectList = resp.projectList;

			showAsideBarList(taskList, projectList);
			monthProjectGraph(projectList);
			
		},error: function (err) {
			console.log("getTaskListToAsideBar() err status : " + err.status);
		}
	});
}

// aside바에 존재하는 리스트를 갱신해준다.
function showAsideBarList(taskList, projectList) {
	let task_list_ul = document.querySelector(".user_task_list");
	let project_list_ul = document.querySelector(".user_project_list");
	const li = document.createElement("li");

	// 업무 리스트 조회
	if(taskList.length === 0){
		li.innerHTML = `<li><a href="#">참여중인 업무가 존재하지 않습니다.</a></li>`;
		task_list_ul.prepend(li.children[0]);
	} else {
		taskList.forEach(e => {
			li.innerHTML = `<li><a href="#">${e.title}</a></li>`;
			while (li.children.length > 0) {
				task_list_ul.prepend(li.children[0]);
			}
		});
	}

	// 프로젝트 리스트 조회
	if(projectList.length === 0){
		li.innerHTML = `<li><a href="#">참여중인 프로젝트가 존재하지 않습니다.</a></li>`;
		project_list_ul.prepend(li.children[0]);
	} else {
		projectList.forEach(e => {
			li.innerHTML = `<li><a href="/app/project/main?projNo=#{projNo}">${e.title}</a></li>`;
			while (li.children.length > 0) {
				project_list_ul.prepend(li.children[0]);
			}
		});
	}

	getAlertModalProjectList(projectList);
	if(window.location.pathname === "/app/index"){
		task_list_for_index_page(taskList);
		project_list_for_index_page(projectList);
	}

}

// 알림설정에 프로젝트 리스트 가져오는 메서드
function getAlertModalProjectList(projectList) {

	let modalList = document.querySelector("#alarmModal .modal-body");
	const div = document.createElement("div");

	if(projectList.length === 0){
		div.innerHTML = 	`<div class="form-group row">
												<div class="col-lg-12">
													<h5>참여중인 프로젝트가 없습니다.</h5>
												</div>
											</div>`;
		modalList.append(div.children[0]);

	} else {
		projectList.forEach(e => {
			div.innerHTML = 	`<div class="form-group row">
													<div class="col-lg-12">
														<label class="switch float-right"> <input type="checkbox">
															<span class="slider round"></span>
														</label> <i class="fa fa-desktop fa-2x" style="float: left;"></i>
														<h5>&nbsp;${e.title}</h5>
													</div>
												</div> <hr style="margin: 10px;">`;
			while (div.children.length > 0) {
				modalList.append(div.children[0]);
			}
		});
	}
}

function settingAlert() {
	if($('#allAlertCheckBox').is(':checked') == true){
		setCookie("allAlertCheckBox", "", 3);
	} else {
		setCookie("allAlertCheckBox", "", 0);
	}
}

function setCookie(name, value, expiredays) { //쿠키 저장함수
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires="
					+ todayDate.toGMTString() + ";"
}

function getCookie(Name) { // 쿠키 불러오는 함수
	var search = Name + "=";
	if (document.cookie.length > 0) { // if there are any cookies
			offset = document.cookie.indexOf(search);
			if (offset != -1) { // if cookie exists
					offset += search.length; // set index of beginning of value
					end = document.cookie.indexOf(";", offset); // set index of end of cookie value
					if (end == -1)
							end = document.cookie.length;
					return unescape(document.cookie.substring(offset, end));
			}
	}
}

function task_list_for_index_page(taskList) {

	const tbody = document.querySelector(".task_list_for_index_page");
	
	if(taskList.length === 0){
		tbody.innerHTML = `<tr>
											<td colspan="3">참여중인 업무가 존재하지 않습니다.</td>
										</tr>`;
		// tbody.append(tr.children[0]);
	} else {
		let cnt = 0;
		taskList.forEach(e => {
			if(cnt >= 3){ 
				return false;
			}
			tbody.innerHTML += `<tr>
												<td scope="row">${e.title}</td>
												<td>${e.projNo}</td>
												<td>${e.status}</td>
											</tr>`;
			cnt++;
		});
	}
}

function project_list_for_index_page(projectList) {

	const tbody = document.querySelector(".project_list_for_index_page");
	
	if(projectList.length === 0){
		tbody.innerHTML = `<tr>
											<td colspan="3">참여중인 프로젝트가 존재하지 않습니다.</td>
										</tr>`;
	} else {
		let cnt = 0;
		projectList.forEach(e => {
			if(cnt >= 3){ 
				return false;
			}
			tbody.innerHTML += `<tr>
												<td scope="row">${e.title}</td>
												<td>${dateFormat(new Date(e.enddate))}</td>
												<td>${e.status}</td>
											</tr>`;
			cnt++;
		});
	}
}

function dateFormat(date) {
	let year = date.getFullYear();
	let month = (1 + date.getMonth());
	month = month >= 10 ? month : '0' + month;
	let day = date.getDate();
	day = day >= 10 ? day : '0' + day;
	return year + '-' + month + '-' + day;
}


////////////////////////////////////////////////////////////////////////////////////
// custom graph


var test_data_bar = {
	type: "bar",
  data: {
		labels: [
			"1월",
			"2월",
			"3월",
			"4월",
			"5월",
			"6월",
			"7월",
			"8월",
			"9월",
			"10월",
			"11월",
			"12월",
		],
		datasets: [
			{
				label: "진행중",
				backgroundColor: "rgba(75, 192, 192, 0.2)",
				borderColor: "rgb(75, 192, 192)",
				data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				borderWidth: 1,
			},
			{
				label: "지연",
				backgroundColor: "rgba(255, 205, 86, 0.2)",
				borderColor: "rgb(255, 205, 86)",
				data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				borderWidth: 1,
			},
			{
				label: "완료",
				backgroundColor: "rgba(54, 162, 235, 0.2)",
				borderColor: "rgb(54, 162, 235)",
				data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				borderWidth: 1,
			},
			{
				label: "파기요청",
				backgroundColor: "rgba(255, 99, 132, 0.2)",
				borderColor: "rgb(255, 99, 132)",
				data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				borderWidth: 1,
			},
		],
	},
	options: {
		scales: {
			y: {
				stacked: true,
			},
			x: {
				stacked: true,
			},
		},
	},
};


function monthProjectGraph(projectList) {
  let dataset = test_data_bar.data.datasets;
	let labels = test_data_bar.data.labels;

  projectList.forEach(project => {
		let month = (new Date(project.enddate).getMonth()) + 1;
		
		// 프로젝트 상태와 비교하기 위한 for문
    for (let i = 0; i < dataset.length; i++) {
			// 프로젝트 상태와 같다면 if문으로 이동
			if(project.status === dataset[i].label){
				// 1월부터 12월까지 for문을 돌린다.
        for (let j = 0; j < labels.length; j++) {
					// 프로젝트 종료일까지 데이터 넣어주고, 나머진 0으로 처리
          if(j < month){
            dataset[i].data[j] += 1;
          }
        }
      }
    }
  });
	// canvas 드로잉
	const custom_monthBarChart = new Chart(
		document.getElementById("custom_monthBarChart"),
		test_data_bar
	);
};

