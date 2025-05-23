<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by probada</title>
	<link rel="icon" href="<%=request.getContextPath()%>/resources/asserts/images/tab-img.jpg">
    <!-- Font Icon -->
    <script src="https://kit.fontawesome.com/db5d9a0152.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/asserts/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/asserts/css/common/login_registration.css">
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content" style="justify-content: center;">
                    <div class="signup-form">
                        <h2 class="form-title" style="margin-bottom: 15px;">비밀번호 재설정</h2>
                        <div class="reset_guide" style="margin-bottom: 60px;">
                            <p><small>비밀번호를 재설정합니다. <br/>8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요. 테스트중 ${userId}</small></p>
                        </div>
                        <form class="register-form" id="password_reset_form" name="password_reset_form">

                            <input type="hidden" name="userId" value="${userId}">

                            <div class="form-group custom-validate">
                                <label for="pwd"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pwd" id="pass" placeholder="비밀번호" />
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <small>Error message</small>
                            </div>
                            <div class="form-group custom-validate">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="비밀번호 재확인" />
                                <i class="fas fa-check-circle"></i>
                                <i class="fas fa-exclamation-circle"></i>
                                <small>Error message</small>
                            </div>
                      
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="다음"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/ddit-vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/asserts/js/common/login_registration.js"></script>
</body>
</html>