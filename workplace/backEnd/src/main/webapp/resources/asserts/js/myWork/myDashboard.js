//대시보드 시작
function readMyDashboard(userId, nickname){
	readMyDashboard = function(){};

	var sessionId = userId;
	
	//내 업무 시작
	$.ajax({
		url     : "/app/myWork/getMyTaskChartByUserId", 
		type    : "GET",
		data    : {
			"userId" : sessionId
		},
		async   : false,
		dataType: "json",
		success : function(data){
			var myTaskChart = new Chart(document.getElementById('myTaskChartDashboard'), {
				type: 'doughnut',
				data: {
					labels: ['예정', '진행', '지연', '완료'],
					datasets: [{
						data: [data.b201, data.b202, data.b203, data.b204],
						backgroundColor: ['#6c757d', '#007bff', '#ffc107', '#28a745'],
						hoverOffset: 4,
						options: {
							legend: {position : 'right'}
						}
					}]
				}
			});
        },
        error   : function(error){
			alert(error.status);
		}
    });
	//내 업무 끝
	
	//내 이슈 시작
	$("#myIssueDashboard").kendoGrid({
		dataSource: {
			type: "json",
			transport: {
				read: "/app/issue/getIssueListByUserId?userId=" + sessionId
			},
			pageSize: 5,
			schema: {
				model: {
					fields: {
						issueNo    : { type: "string" },
						title      : { type: "string" },
						userId     : { type: "string" },
						updatedate : { type: "date"   }
					}
				}
			}
		},
		batch: true,
		noRecords: {
			template: function(e) {
				return "<h2>이슈가 존재하지 않습니다.</h2>";
			}
		},
		scrollable: false,
		columns: [
			{
				field: "title",
				title: "제목" ,
				headerAttributes: { style: 'text-align:center' },
				template: "<span class='text-dark d-inline-block text-truncate' style='max-width:150px;'>#:title#</span>"
			},
			{ 
				field: "userId",
				title: "작성자",
				headerAttributes: { style: 'text-align:center' },
				template: "<span class='text-dark d-inline-block text-truncate' style='max-width:120px;'>#:userId#</span>"
			},
			{ 
				field: "updatedate",
				title: "갱신일",
				headerAttributes: { style: 'text-align:center' },
				attributes: { style: 'text-align:center;width:100px;' },
				format:"{0:yyyy-MM-dd}",
				width: 130
			}
		]
	});
	//내 이슈 끝
	
	//내 메일 시작
	$("#myReceiveMailDashboard").kendoGrid({
		dataSource: {
			type: "json",
			transport: {
				read: "/app/myWork/getReceiveMailList?userTo=" + nickname
			},
			pageSize: 3,
			schema: {
				model: {
					fields: {
						mailNo   : { type: "number" },
						title    : { type: "string" },
						userFrom : { type: "string" },
						regDate  : { type: "string" }
					}
				}
			}
		},
		batch: true,
		noRecords: {
			template: function(e) {
				return "<h2>메일이 존재하지 않습니다.</h2>";
			}
		},
		scrollable: false,
		columns: [
			{ 
				field: "title",
				title: "제목",
				headerAttributes: { style: 'text-align: center' },
				template: "<span class='text-dark d-inline-block text-truncate' style='max-width:150px;'>#:title#</span>"
			},
			{ 
				field: "userFrom",
				title: "보낸사람",
				headerAttributes: { style: 'text-align: center' },
				template: "<span class='text-dark d-inline-block text-truncate' style='max-width:120px;'>#:userFrom#</span>"
			},
			{ 
				field: "regDate",
				title: "보낸날짜",
				headerAttributes: { style: 'text-align: center' },
				attributes: { style: 'text-align: center'},
				width: 130
			}
		]
	});
	//내 메일 끝
	
	//내 히스토리 시작
	$("#myHistoryDashboard").kendoGrid({
		dataSource: {
			type: "json",
			transport: {
				read: "/app/myWork/getHistory?userId=" + sessionId
			},
			pageSize: 3,
			schema: {
				model: {
					fields: {
						msg     : { type: "string" },
						url     : { type: "string" },
						regDate : { type: "string" },
						projNo  : { type: "string" },
						dist    : { type: "string" },
						userId  : { type: "string" },
						act     : { type: "string" }
					}
				}
			}
		},
	    batch: true,
	    pageable: false,
		noRecords: {
			template: function(e) {
				return "<h2>히스토리가 존재하지 않습니다.</h2>";
			}
		},
		scrollable: false,
	    columns: [
	    	{ field: "msg",     hidden:true },
	    	{ field: "url",     hidden:true },
	    	{ field: "regDate", hidden:true },
	    	{ field: "projNo",  hidden:true },
	    	{ field: "dist",    hidden:true },
	    	{ field: "userId",  hidden:true },
	    	{ field: "act",     hidden:true },
	    	{ template: kendo.template($("#myHistoryDashboard-template").html()) }
	    ]
	});
	$("#myHistoryDashboard").find("thead").hide();
	//내 히스토리 끝

	//내 리퀘스트 시작
	/*var yourRequestDashboard = $("#yourRequestDashboard").kendoGrid({
		dataSource: {
	        type: "json",
	        transport: {
	        	read: "/app/myWork/getYourRequest?userTo=" + sessionId
	        },
	        pageSize: 2,
	        schema: {
	            model: {
	                fields: {
	                	reqNo   : { type: "string" },
	                	userFrom: { type: "string" },
	                	userTo  : { type: "string" },
	                	projNo  : { type: "string" },
	                	title   : { type: "string" },
	                	content : { type: "string" },
	                	url     : { type: "string" },
	                	status  : { type: "string" },
	                	regDate : { type: "string" },
	                	reqRes  : { type: "string" }
	                }
	            }
	        },
	        change: function() {
	        	readMyDashboard(sessionId);
			}
	    },
	    batch: true,
	    pageable: false,
		noRecords: {
			template: function(e) {
				return "<h2>리퀘스트가 존재하지 않습니다.</h2>";
			}
		},
	   	columns: [
	   		{ field: "reqNo"   , hidden: true },
	   		{ field: "userFrom", hidden: true },
	   		{ field: "userTo"  , hidden: true },
	   		{ field: "projNo"  , hidden: true },
	   		{ field: "title"   , hidden: true },
	   		{ field: "content" , hidden: true },
	   		{ field: "url"     , hidden: true },
	   		{ field: "status"  , hidden: true },
	   		{ field: "regDate" , hidden: true },
	   		{ field: "reqRes"  , hidden: true },
	   		{ template: kendo.template($("#yourRequest-template").html()) }
	  	]
	});
	
	$('#yourRequestDashboard').find('thead').hide();
	
	var myRequestDashboard = $("#myRequestDashboard").kendoGrid({
		dataSource: {
	        type: "json",
	        transport: {
	        	read: "/app/myWork/getMyRequest?userFrom=" + sessionId
	        },
	        pageSize: 2,
	        schema: {
	            model: {
	                fields: {
	                	reqNo   : { type: "string" },
	                	userFrom: { type: "string" },
	                	userTo  : { type: "string" },
	                	projNo  : { type: "string" },
	                	title   : { type: "string" },
	                	content : { type: "string" },
	                	url     : { type: "string" },
	                	status  : { type: "string" },
	                	regDate : { type: "string" },
	                	reqRes  : { type: "string" }
	                }
	            }
	        }
	    },
	    batch: true,
	    pageable: false,
		noRecords: {
			template: function(e) {
				return "<h2>리퀘스트가 존재하지 않습니다.</h2>";
			}
		},
	   	columns: [
	   		{ field: "reqNo",    hidden: true },
	   		{ field: "userFrom", hidden: true },
	   		{ field: "userTo",   hidden: true },
	   		{ field: "projNo",   hidden: true },
	   		{ field: "title",    hidden: true },
	   		{ field: "content",  hidden: true },
	   		{ field: "url",      hidden: true },
	   		{ field: "status",   hidden: true },
	   		{ field: "regDate",  hidden: true },
	   		{ field: "reqRes",   hidden: true },
	   		{ template: kendo.template($("#myRequest-template").html()) }
	  	]
	});
	
	$('#myRequestDashboard').find('thead').hide();*/
	//내 리퀘스트 끝
	
	//내 문서 시작
	$("#myDocumentDashboard").kendoGrid({
		dataSource: {
			type: "json",
			transport: {
				read: "/document/getDocumentListByUserId?userId=" + sessionId
			},
			pageSize: 5,
			schema: {
				model: {
					fields: {
						projTitle : { type: "string" },
						name      : { type: "string" },
						size      : { type: "string" },
						created   : { type: "date"   },
						modified  : { type: "date"   }
					}
				}
			}
		},
		batch: true,
		noRecords: {
			template: function(e) {
				return "<h2>문서가 존재하지 않습니다.</h2>";
			}
		},
		scrollable: false,
		columns: [
			{ field: "projTitle", title: "소속 프로젝트"   , headerAttributes: { style: 'text-align: center' }, attributes: { style: 'overflow:hidden;text-overflow:ellipsis;white-space:nowrap;'}, width: 230 },
			{ field: "name"     , title: "문서명"        , headerAttributes: { style: 'text-align: center' }, attributes: { style: 'overflow:hidden;text-overflow:ellipsis;white-space:nowrap;'}},
			{ field: "size"     , title: "파일크기 (BYTE)", headerAttributes: { style: 'text-align: center' }, width: 110 },
			{ field: "created"  , title: "등록일"        , headerAttributes: { style: 'text-align: center' }, attributes: { style: 'text-align: center'}, format:"{0:yyyy-MM-dd}", width: 130 },
			{ field: "modified" , title: "갱신일"        , headerAttributes: { style: 'text-align: center' }, attributes: { style: 'text-align: center'}, format:"{0:yyyy-MM-dd}", width: 130 }
		]
	});
	//내 문서 끝
}