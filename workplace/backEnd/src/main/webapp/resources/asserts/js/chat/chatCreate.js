

function createRoom(){
    	
  	  var title = document.getElementById('title');
  	  var selectProject = document.getElementById('selectProject');
  		
        
  		 if(title.value==""){
  			 checkCreateRoom.innerHTML = "채팅방 제목을 작성해주세요.";
  			
  			return false;
  	  	}
  		 
  		 if(selectProject.value==""){
  			 checkCreateRoom.innerHTML = "프로젝트를 선택해주세요.";
  			
  			return false;
  	  	}
  		  	
  		 var isSeasonChk = false;
  	        var arr_Season = document.getElementsByName("userId");
  	        for(var i=0;i<arr_Season.length;i++){
  	            if(arr_Season[i].checked == true) {
  	                isSeasonChk = true;
  	                break;
  	            }
  	        }
  	    
  	        if(!isSeasonChk){
  	        	 checkCreateRoom.innerHTML = "멤버는 적어도 한 명을 선택해야합니다.";
  	            return false;
  	        }
  		 
  	      var userId ="";
  	      var isChk = false;
  	        console.log("타이틀"+title.value);
  	        console.log("셀렉트 프로젝트"+selectProject.value);
	  	      for(var i=0;i<arr_Season.length;i++){
	  	    	  if(arr_Season[i].checked == true) {
	  	    		  	
	  	    		  if(i==arr_Season.length-1){
	  	    			  userId += arr_Season[i].value
	  	    			  break;
	  	    		  }
	  	    		  
	  	              console.log("인운"+arr_Season[i].value);
	  	              userId += arr_Season[i].value+",";
	  	    	  
	  	    	  }
	  	    	  
		        }
	  	      
	  	
	  	
	  	      
	    var chatTitle = title.value;
	    var projectNo = selectProject.value;
	    console.log("nbmn"+$('#createChatForm').serialize());
	    console.log("nbmvvvn"+$('#createChatForm').val());
  	        
  	        
			$.ajax({
				type : "POST",
				url : "/chat/createRoom.do",
				data : {"title":chatTitle,"ptitle":projectNo,"userId":userId},
				success : function(res) {

					alert("성공!");
					location.reload();
				},
				error : function(err) {
					alert("에러" + err.status);
				}
			});
        

  	        
  	//document.createForm.submit();

  }


function selectChatRoom(realRoomNumber){
	
	var chatTitle = chatTitle;
	var realRoomNo = realRoomNumber;
	
	
	
	
	var popup = window.open('/chat/chatRoom?roomNo='+realRoomNo, '채팅창', 'width=700px,height=800px,scrollbars=yes');
	
	
	
}


window.onload = function(){
	$.ajax({
	    url: "/chat/getProjectTitle.do",
	    type: "POST",
	    success : function(arg) {
	    	
	    	var projTitle ="<option value=''>==내가속한 프로젝트 리스트==</option>";
	    	
	    	 for (var i = 0; i < arg.length; i++) { 
	    	    
	    	      projTitle += 
	    	    	  "<option value='"+arg[i]+"'>"+arg[i]+"</option>";
	    	    }
	    	 document.getElementById('selectProject').innerHTML=projTitle;
	    }, 
	    error : function(arg){
		alert("통신실패시에만 실행"+arg.status);
	    }
	});
	//프로젝트 리스트 출력 끝	
	
	
	$("#selectProject").change(function(){


		var selectProj = $('#selectProject').val();
		
		
		
		 	/*<div class="col-lg-12" id="memberInvite">
		<input type="checkbox" id="member" name="member" value="석기현">석기현<br>
		<input type="checkbox" id="member" name="member" value="기순">기순<br>
		<input type="checkbox" id="member" name="member" value="순기">순기 
		</div>*/
		
		$.ajax({
		  url: "/chat/getProjectUser.do",
		  type: "POST",
		  data: {"selectProj":selectProj},
		
		  success : function(arg) {
			
		  	var userList ="";
		  	
		  	 for (var i = 0; i < arg.length; i++) { 
		  	     
		  	      userList += 
		  	    	  "<option >"+arg[i]+"</option>";
		  	    	 // "<input type='checkbox' class='member'"+i+" name='userId' value='"+arg[i]+"'>"+arg[i]+"<br>";
		  	      
		  	    }
		  	 
		  	
		  	 document.getElementById('optional').innerHTML=userList;
		  	
		  }, 
		  error : function(arg){
			alert("통신실패시에만 실행");
		  }
		}); 
	

	});
	
	
	
	
	 
      $("#optional").kendoListBox({
          connectWith: "selected",
          toolbar: {
              tools: ["moveUp", "moveDown", "transferTo", "transferFrom", "transferAllTo", "transferAllFrom", "remove"]
          }
      });

      $("#selected").kendoListBox();
 
	
	
	
	
	
	
	
	
	
	
	
	
};
