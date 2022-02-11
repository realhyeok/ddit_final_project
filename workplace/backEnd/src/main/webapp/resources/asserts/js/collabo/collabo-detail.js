if(window.location.pathname == '/app/collabo/main'){
		getTemplate('/app/collabo/getCollaboByCprojNo','collaboDetailIntro','collaboDetailIntroTarget');
		getTemplate('/app/collabo/getCollaboByCprojNo','collaboDetailNotify','collaboDetailNotifyTarget');
		//getTemplate('/document/getDocumentListForCollaboDetail','collaboDetailDocument','collaboDetailDocumentTarget');
}

function subProjList(cprojNo) {
	
	$.ajax({
		url : "/app/collabo/getCollaboSubProj",
		type : "POST",
		data : {"cprojNo":cprojNo},
		success : function(arg) {
			
			console.log(arg);
			
			let projUrl = "/app/project/main?projNo=";
			let subProjTitle = "";
			
			for (var i = 0; i < arg.length; i++) {
				
				subProjTitle += "<tr><td><a href='"+projUrl+""+arg[i].projNo+"' >"+arg[i].title+"</a></td></tr>";
			}
			
			//subProjTitle += "<tr><td><a href='"+projUrl+""+arg.projNo+"' >"+arg.title+"</a></td></tr>";
			
			document.getElementById('selectSubProject').innerHTML= subProjTitle;
		},
		error : function(arg) {
			alert("리스트 가져오는거 에러임 ㅎㅎ" + arg.status + "메세지" + arg.responseText);
		}
	})
	
};