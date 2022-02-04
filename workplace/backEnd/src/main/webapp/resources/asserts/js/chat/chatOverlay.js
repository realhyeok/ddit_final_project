function on() {
	$("#popoverlay").fadeIn(300);
}

function off() {
	$("#popoverlay").fadeOut(300);
}

var prevTarget = [];

function offChatList(){
	
	off();
	chatFlag = false;
}
chatFlag = false; 

function getOverlayTemplate(templateId) {

	
	if(chatFlag==false){
		
	
	
	
	 on();

		$.ajax({
			type: "POST",
		    url : "/chat/getMyChatProject",
		    success : function(data) {
		        console.log("Handlebars success!!");
		        var template = document.querySelector("#" + templateId).innerText;
		        var bindTemplate = Handlebars.compile(template);
		        var appe = document.querySelector('#popoverlay');
		        var html = bindTemplate(data);
		        appe.innerHTML = html;
		        $("#fadeInContent").fadeIn(300);
		        
		        
		    },
		    error : function(error) {
		        console.log("Handlebars error!!");
		    },
		});
		chatFlag = true;
	}else{
		
		off();
		chatFlag = false;
		
	}
	 
	   /*getModalTemplate(chatModalTemplate);*/
	   
	 
    
}


/*
function getModalTemplate(templateId) {
	
	
	 
	 $.ajax({
	    	type: "POST",
	        url :"/chat/getProjectTitle",
	        success : function(title) {
	        	
	            console.log("Handlebars success!!");
	            console.log(title);
	       
		        var template = document.querySelector("#" + templateId).innerText;
		        var bindTemplate = Handlebars.compile(template);
		        var appe = document.querySelector('#popoverlay');
		        var html = bindTemplate(data);
		        appe.innerHTML = html;
		        $("#fadeInContent").fadeIn(300);
	            
	            
	        },
	        error : function(error) {
	            console.log("Handlebars error!!");
	        },
	    });


}*/


/*alert("request.contextPath 이거 안탈 수 도 있음");
$.ajax({
	    url: "/chat/getMyChatProject",
	    type: "POST", 
	    success : function(arg) {
	   
	    	var projectTitle ="";
	    	
	    		//없는 경우 추가하기
	    		for(var i=0 in arg){  
	    		
	    		var realRoom = "'"+arg[i].realRoom+"'";
	    			
	    		 projectTitle += 
	    	    	  '<div class="roomEl" data-id="2" onclick="selectChatRoom('+realRoom+');">'+arg[i].title+'</div>';
	    	    }
	    		alert(projectTitle);
	    	
	    	 document.getElementById('roomSelect').innerHTML=projectTitle;
	    }, 
	    error : function(arg){
		alert("통신실패시에만 실행"+arg.status);
	    }
	});	   
 */
 
 
/*//모달을 열시 
	
 
	

	

})*/




