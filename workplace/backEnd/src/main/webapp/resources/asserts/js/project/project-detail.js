if(window.location.pathname == '/app/project/main'){
		getTemplate('/app/project/getProjectByProjNo','projectDetailIntro','projectDetailIntroTarget');
		getTemplate('/app/project/getProjectByProjNo','projectDetailNotify','projectDetailNotifyTarget');
		getTemplate('/document/getDocumentListForProjDetail','projectDetailDocument','projectDetailDocumentTarget');
		getTemplate('/getUserByProjNo','projectDetailMember','projectDetailMemberTarget');
}