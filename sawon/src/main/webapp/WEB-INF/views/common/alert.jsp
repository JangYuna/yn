<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery-3.3.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
var message = '${msg}';
var returnUrl = '${loc}';
alert(message);
location.href = returnUrl;
</script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>