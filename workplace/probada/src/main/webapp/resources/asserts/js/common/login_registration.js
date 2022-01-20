/*
  form 태그를 바로 컨트롤러로 보내고 싶지 않은 경우
  submit return false를 주고, 해당 form을 불러냄

  
 */


$(document).ready(function () {
  
  $('#login-form').submit(function (e) { 
    e.preventDefault();
    user_email = $('#user-email').val();
    user_pwd = $('#user-pwd').val();

    login_validation(user_email, user_pwd);

    // $.ajax({
    //   type: "POST",
    //   url: "/app/index",
    //   data: {
    //     "user_email" : user_email,
    //     "user_pwd" : user_pwd
    //   },
    //   dataType: "json",
    //   success: function (res) {
    //     // 이메일이 null이거나, 이메일 또는 비밀번호가 맞지 않을 경우
    //     if(res.user_email == null 
    //       || res.user_email != user_email 
    //       || res.user_pwd != user_pwd){
    //         $('.alert--error').show();
    //     }
    //   },
    //   error: function (err) {
    //     alert("로그인 버튼 클릭 에러 : " + err.status);
    //   }
    // });

  });

  // error js
  (function ($) {
    $(".alert .close ").click(function () {
      $(this).parent().fadeOut();
    });
  })(jQuery);

  // login validation
  const login_validation = (email, pwd) => {
  
    //테스트용
    let test_email = "asdasd";
    let test_pass = "asdasd";

    if(user_email == ""){
      $('.alert--error > ul > li:eq(0)').html("<span><strong>아이디</strong>를 입력해 주세요.</span>");
      document.getElementById('user-email').focus();
      $('.alert--error').show();
      return false;
    } else if(user_pwd == ""){
      $('.alert--error > ul > li:eq(0)').html("<span><strong>비밀번호</strong>를 입력해 주세요.</span>");
      document.getElementById('user-pwd').focus();
      $('.alert--error').show();
      return false;
    }
    if(user_email != test_email || user_pwd != test_pass){
      $('.alert--error > ul > li:eq(0)').html("<span>아이디 또는 비밀번호가 잘못 입력 되었습니다.\n<strong>아이디</strong>와 <strong>비밀번호</strong>를 정확히 입력해 주세요.</span>");
      $('.alert--error').show();
      return false;
    }
    if(user_email == test_email && user_pwd == test_pass){
      $('.alert--error').hide();
      // 접속 함수 추가 요망
      return false;
    }
  };


});

/*----------------------------------------- REGISTRATION JS -----------------------------------------*/
const form = document.getElementById('register-form');
const username = document.getElementById('username');
const email = document.getElementById('email');
const pass = document.getElementById('pass');
const re_pass = document.getElementById('re_pass');

form.addEventListener('submit', e => {
	e.preventDefault();
	checkInputs();
  if(!checkInputError()){
    return false;
  }
});

function setErrorFor(input, message) {
	const formControl = input.parentElement;
	const small = formControl.querySelector('small');
	formControl.className = 'form-group custom-validate error';
	small.innerText = message;
}

function setSuccessFor(input) {
	const formControl = input.parentElement;
	formControl.className = 'form-group custom-validate success';
}
	
function checkInputs() {
	// trim to remove the whitespaces
	const usernameValue = username.value.trim();
	const emailValue = email.value.trim();
	const passValue = pass.value.trim();
	const re_passValue = re_pass.value.trim();
	
	if(usernameValue === '') {
		setErrorFor(username, '닉네임을 입력하세요.');
	}else if (!isName(usernameValue)) {
		setErrorFor(username, '닉네임은 한글, 영문, 숫자만 가능하며 2~20자리까지 가능합니다.');
	} else {
		setSuccessFor(username);
	}
	
	if(emailValue === '') {
		setErrorFor(email, '이메일을 입력하세요.');
	} else if (!isEmail(emailValue)) {
		setErrorFor(email, '유효하지 않는 이메일 형식입니다.');
	} else {
		setSuccessFor(email);
	}
	
	if(passValue === '') {
		setErrorFor(pass, '비밀번호를 입력하세요.');
	} else if (!isPwd(passValue)) {
		setErrorFor(pass, '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
	}  else {
		setSuccessFor(pass);
	}
	
	if(re_passValue === '') {
		setErrorFor(re_pass, '비밀번호 재확인을 입력하세요.');
	} else if(passValue !== re_passValue) {
		setErrorFor(re_pass, '비밀번호와 일치하지 않습니다.');
	} else{
		setSuccessFor(re_pass);
	}

  if(!checkEmailDB(emailValue)){
    setErrorFor(email, '이미 가입된 이메일입니다.');
  }
}

function checkEmailDB(emailValue){
  // $.ajax({
  //   type: "get",
  //   url: "/app/checkEmail.do",
  //   data: {"email" : email},
  //   dataType: "json",
  //   success: function (res) {
  //     res.email = "apdlfthd@naver.com";
  //     if(email == res.email){
  //       setErrorFor(email, '이미 가입된 이메일입니다.');
  //     }
  //   },
  //   error: function (err) {
  //     alert('아이디 체크 error test => ' + err.status);
  //   }
  // });
  let resemail = "apdlfthd@asd.com"; // db아이디 추가
  if(emailValue == resemail){
    return false;
  } else {
    return true;
	}
}

function checkInputError() {
  let checkError = true;
  $.each(form, function (i, e) { 
    if($('#register-form div').attr('class') === "form-group custom-validate error"){
      checkError = false;
    }
  });
  return checkError;
}

function isEmail(email) {
	return /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/.test(email);
}
function isPwd(pass) {
  return /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/.test(pass);  
}
function isName(username) {
  return /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,20}$/.test(username);
}