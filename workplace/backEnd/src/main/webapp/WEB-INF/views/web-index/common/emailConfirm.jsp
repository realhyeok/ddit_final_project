<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <script type="text/javascript">
    var userEmail = '${email}';

    alert(userEmail + '님 회원가입을 축하합니다. 이제 로그인이 가능 합니다.');

    window.open('', '_self', ''); 
    
    self.location = '/register_success';
  </script>
</body>
</html>