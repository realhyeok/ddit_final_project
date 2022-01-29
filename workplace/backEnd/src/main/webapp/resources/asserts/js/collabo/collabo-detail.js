if(window.location.pathname == '/app/collabo/main'){
		getTemplate('/app/collabo/getCollaboByCprojNo','collaboDetailIntro','collaboDetailIntroTarget');
		getTemplate('/app/collabo/getCollaboByCprojNo','collaboDetailNotify','collaboDetailNotifyTarget');
		getTemplate('/document/getDocumentListForCollaboDetail','collaboDetailDocument','collaboDetailDocumentTarget');
}