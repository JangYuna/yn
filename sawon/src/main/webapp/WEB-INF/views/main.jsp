<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- jquery-3.3.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
 	body{
		background-color:#2a4365;
	} 

	.title{
		overflow:hidden;
		background-color:#333;
		position:fixed;
		top:0;
		width:100%;
	}
	
	.index_main .bt{
		color:black;
	}
	
	.main_logo, .main_top_center, .main_top_right{
		width:30%;
 		float:left;
    	border:1px #333 dotted;
	}
	
	.main_logo a{
		float:right;
		display:block;
		color:#f2f2f2;
		text-align:right;
		padding:14px 16px;
		text-decoration: none;
	}
	
	.main_top_right a{
		float:left;
		display:block;
		color:#f2f2f2;
		text-align:left;
		padding:14px 16px;
		text-decoration:none;
	}
	
	.main_top_right a:hover{
		background:#ddd;
		color:balck;
	}
	
	.index_main{
		margin-top:60px;
		width:100%;
		text-align:center;
		margin-top:20%;
		margin-bottom: 20%;
	}
	
	.main_footer{
		width:50%;
		text-align:center;
		margin-left:auto;
 		margin-right:auto;
	}
	
	.main_footer_container{
		margin-left:auto;
		margin-right:auto;
	}

h2, h4 {
  color: white;
}
</style>
<title>입사시스템</title>
</head>
<body>
<div class="flex-grow-1 d-flex flex-column">
<nav class="navbar navbar-expand-sm bg-light navbar-light">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${pageContext.request.contextPath }/main.do">피노소프트</a>
    </div>
    <ul class="nav navbar-nav">
  	  <li><a class="nav-link" href="${pageContext.request.contextPath }/main.do">Home</a></li>
      <li><a class="nav-link" href="${pageContext.request.contextPath }/memberinsertForm.do">Input</a></li>
      <li><a class="nav-link" href="${pageContext.request.contextPath }/selectForm.do">Search</a></li>
    </ul>
  </div>
</nav>
<br> 
</div>
<article class="index_main">
		<h2>인사관리 시스템</h2>
		<h4>인사정보를 입력하겠습니다&nbsp;<a href="memberinsertForm.do"><input type="button" value="입력" class="btn btn-primary mr-1"/></a></h4>
		<h4>인사정보를 조회하겠습니다&nbsp;<a href="selectForm.do"><input type="button" value="조회" class="btn btn-primary mr-1"/></a></h4>
</article>
<footer>
		<div class="main_footer_container">
			<div class="main_footer">
				<p style="color:white">서울시 금천구 서부샛길 606 A-1306(가산동 대성디폴리스 지식산업센터)/Tel 02-6049-1114 / Fax 02-861-9883 Copyright&copy;2015 IT&BIZ co.LTD.All rights reserved by itnbiz@naver.com</p>
			</div>
		</div>
</footer>
</body>
</html>