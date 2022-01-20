// 이슈 시작
$(document).ready(function () {
	var dataBase = [
		  {
		    "IssueNo": 1,
		    "IssueName": "<a href='my-work/issueDetail' style='color:black;'>자바스크립트가 안되요</a>",
		    "IssueImportant":"높음",
		    "MileName": "프로젝트 화면 검수",
		    "UserNickName": "RealHyukPL",
		    "IssueUpdatedate": "\/Date(1593561600000)\/",
		    "IssueStatus":"진행중"
		  },
		  {
		    "IssueNo": 2,
		    "IssueName": "JSP가 안되요",
		    "IssueImportant":"높음",
		    "MileName": "내 업무 화면 수정작업",
		    "UserNickName": "RealHyukPL",
		    "IssueUpdatedate": "\/Date(1542361600000)\/",
		    "IssueStatus":"진행중"
		  },
		  {
		    "IssueNo": 3,
		    "IssueName": "스타일이 이상해요",
		    "IssueImportant":"낮음",
		    "MileName": "콜라보 화면 설계",
		    "UserNickName": "EnergyWookAA",
		    "IssueUpdatedate": "\/Date(1593561600000)\/",
		    "IssueStatus":"완료"
		  },
		  {
		    "IssueNo": 4,
		    "IssueName": "자바가 안되요",
		    "IssueImportant":"낮음",
		    "MileName": "프로젝트 화면 구현",
		    "UserNickName": "RealHyukPL",
		    "IssueUpdatedate": "\/Date(1594231600000)\/",
		    "IssueStatus":"완료"
		  },
		  {
		    "IssueNo": 5,
		    "IssueName": "컴퓨터가 안되요",
		    "IssueImportant":"높음",
		    "MileName": "프로젝트 화면 구현",
		    "UserNickName": "EnergyWookAA",
		    "IssueUpdatedate": "\/Date(1511161600000)\/",
		    "IssueStatus":"진행중"
		  },
		  {
		    "IssueNo": 6,
		    "IssueName": "다 안되요",
		    "IssueImportant":"높음",
		    "MileName": "프로젝트 화면 설계",
		    "UserNickName": "EnergyWookAA",
		    "IssueUpdatedate": "\/Date(1513331600000)\/",
		    "IssueStatus":"진행중"
		  },
		  {
		    "IssueNo": 7,
		    "IssueName": "마우스가 안되요",
		    "IssueImportant":"낮음",
		    "MileName": "내 업무 화면 수정 및 검수",
		    "UserNickName": "EnergyWookAA",
		    "IssueUpdatedate": "\/Date(1511161600000)\/",
		    "IssueStatus":"완료"
		  },
		  {
		    "IssueNo": 8,
		    "IssueName": "모니터가 안되요",
		    "IssueImportant":"높음",
		    "MileName": "기기관련",
		    "UserNickName": "EnergyWookAA",
		    "IssueUpdatedate": "\/Date(1511161600000)\/",
		    "IssueStatus":"진행중"
		  },
		  {
		    "IssueNo": 9,
		    "IssueName": "배고파요",
		    "IssueImportant":"높음",
		    "MileName": "그 외",
		    "UserNickName": "EnergyWookAA",
		    "IssueUpdatedate": "\/Date(1511161600000)\/",
		    "IssueStatus":"진행중"
		  },
		  {
			  "IssueNo": 10,
			  "IssueName": "배고파요",
			  "IssueImportant":"높음",
			  "MileName": "그 외",
			  "UserNickName": "EnergyWookAA",
			  "IssueUpdatedate": "\/Date(1511161600000)\/",
			  "IssueStatus":"진행중"
		  },
		  {
			  "IssueNo": 11,
			  "IssueName": "배고파요",
			  "IssueImportant":"높음",
			  "MileName": "그 외",
			  "UserNickName": "EnergyWookAA",
			  "IssueUpdatedate": "\/Date(1511161600000)\/",
			  "IssueStatus":"진행중"
		  }
		];
    
    $("#my-issue").kendoGrid({
        dataSource: {
            data: dataBase,
            schema: {
                model: {
                    fields: {
                    	IssueName: { type: "string" },
                    	IssueImportant: { type: "string" },
                    	MileName: { type: "string" },
                    	UserNickName: { type: "string" },
                    	IssueUpdatedate: { type: "date"},
                    	IssueStatus: { type: "string" },
                    }
                }
            }
        },
        columnMenu: {
            filterable: false
        },
        batch: true,
        pageSize: 10,
        autoSync: true,
        height: 850,
        pageable: true,
        numeric: true,
        sortable: true,
        navigatable: true,
        resizable: true,
        reorderable: true,
        groupable: true,
        toolbar: [
        	{ template: "<button class='btn btn-sm btn-dark' type='button' onclick=\"location.href='my-work/issueRegistForm';\">등록</button>" }
        	,"search","excel", "pdf" ],
        columns: [{
            selectable: true,
            width: 75,
            attributes: {
                "class": "checkbox-align",
            },
            headerAttributes: {
                "class": "checkbox-align text-center",
            }
        },  {
            field: "IssueName",
            title: "이슈 제목",
            format: "{0:c}",
 
                    width: 200,
                    encoded: false,
                }, {
                    field: "IssueImportant",
            title: "중요도",
            template: "<span id='badge_success' class='badgeTemplate badge_success'>#=IssueImportant#</span>",
            width: 100,
            editable: false,
        }, {
            field: "MileName",
            title: "마일스톤",
            /* editor: clientCategoryEditor, */
            groupHeaderTemplate: "마일스톤: <a href='' style='color:black;'>#=data.value#</a> ",
            width: 200
        },  {
            field: "UserNickName",
            title: "작성자",
            width: 105
        }, {
            field: "IssueUpdatedate",
            title: "갱신일",
            format: "{0:yyyy-MM-dd}",
            width: 120
        },  {
            field: "IssueStatus",
            title: "진행상태",
            width: 100
        }],
    });
});

function returnFalse() {
    return false;
}
// 이슈 끝