// 이슈 시작
$(document).ready(function(){
	var dataBase = [
		{
			"HistoryNo"     : 1,
			"HistoryPicture": "img.jpg",
			"HistoryContent": "이슈가 등록되었습니다.",
			"UserName"      : "RealHyukPL",
			"HistoryDate"   : "\/Date(1593561600000)\/",
			"MoveButton"    : "이동"
		},
		{
			"HistoryNo"     : 2,
			"HistoryPicture": "img.jpg",
			"HistoryContent": "이슈가 등록되었습니다.",
			"UserName"      : "RealHyukPL",
			"HistoryDate"   : "\/Date(1593561600000)\/",
			"MoveButton"    : "이동"
		},
		{
			"HistoryNo"     : 3,
			"HistoryPicture": "img.jpg",
			"HistoryContent": "이슈가 등록되었습니다.",
			"UserName"      : "RealHyukPL",
			"HistoryDate"   : "\/Date(1593561600000)\/",
			"MoveButton"    : "이동"
		},
		{
			"HistoryNo"     : 4,
			"HistoryPicture": "img.jpg",
			"HistoryContent": "이슈가 등록되었습니다.",
			"UserName"      : "RealHyukPL",
			"HistoryDate"   : "\/Date(1593561600000)\/",
			"MoveButton"    : "이동"
		},
		{
			"HistoryNo"     : 5,
			"HistoryPicture": "img.jpg",
			"HistoryContent": "이슈가 등록되었습니다.",
			"UserName"      : "RealHyukPL",
			"HistoryDate"   : "\/Date(1593561600000)\/",
			"MoveButton"    : "이동"
		},
		{
			"HistoryNo"     : 6,
			"HistoryPicture": "img.jpg",
			"HistoryContent": "이슈가 등록되었습니다.",
			"UserName"      : "RealHyukPL",
			"HistoryDate"   : "\/Date(1593561600000)\/",
			"MoveButton"    : "이동"
		},
		{
			"HistoryNo"     : 7,
			"HistoryPicture": "img.jpg",
			"HistoryContent": "이슈가 등록되었습니다.",
			"UserName"      : "RealHyukPL",
			"HistoryDate"   : "\/Date(1593561600000)\/",
			"MoveButton"    : "이동"
		},
		{
			"HistoryNo"     : 8,
			"HistoryPicture": "img.jpg",
			"HistoryContent": "이슈가 등록되었습니다.",
			"UserName"      : "RealHyukPL",
			"HistoryDate"   : "\/Date(1593561600000)\/",
			"MoveButton"    : "이동"
		},
		{
			"HistoryNo"     : 9,
			"HistoryPicture": "img.jpg",
			"HistoryContent": "이슈가 등록되었습니다.",
			"UserName"      : "RealHyukPL",
			"HistoryDate"   : "\/Date(1593561600000)\/",
			"MoveButton"    : "이동"
		},
		{
			"HistoryNo"     : 10,
			"HistoryPicture": "img.jpg",
			"HistoryContent": "이슈가 등록되었습니다.",
			"UserName"      : "RealHyukPL",
			"HistoryDate"   : "\/Date(1593561600000)\/",
			"MoveButton"    : "이동"
		},
		{
			"HistoryNo"     : 11,
			"HistoryPicture": "img.jpg",
			"HistoryContent": "이슈가 등록되었습니다.11",
			"UserName"      : "RealHyukPL",
			"HistoryDate"   : "\/Date(1593561600000)\/",
			"MoveButton"    : "이동"
		}];

	$("#my-history").kendoGrid({
		dataSource: {
			data  : dataBase,
			schema: {
				model: {
					fields: {
                    	HistoryContent: { type: "string" },
                    	UserName      : { type: "string" },
                    	HistoryDate   : { type: "date"}
					}
				}
            }
        },
        columnMenu: {
            filterable: false
        },
        batch: true,
        pageSize: 10,
        height: 900,
        pageable: true,
        sortable: true,
        columns: [{
        	template: "<img src='../resources/asserts/images/#=HistoryPicture#' alt='img' style='margin:5px 10px 5px 3px;height:50px;width:50px;border-radius:100%;'/>",
        	width: 70
        },
        {	
        	template: "#=HistoryContent#"
        },
        {
        	template: "#=UserName#",
            width: 90
        },
        {
            field: "HistoryDate",
            title: " ",
            format: "{0:yyyy-MM-dd}",
            width: 90
        },
        {
            template: "<button type='button' class='btn btn-sm btn-dark m-0' onclick='location.href=\"\"' style='height:50px;width:50px;'>#=MoveButton#</button>",
            width: 80
        }],
    });
	/*
	$("table[role='grid']").find("thead").hide();*/
});


function returnFalse() {
    return false;
}

// 히스토리 끝