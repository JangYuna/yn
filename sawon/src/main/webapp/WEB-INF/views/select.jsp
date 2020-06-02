<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- jquery-3.3.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script type="text/javascript">
//////////////////////////function
$(function(){
////////////////////////////datepicker
	$("#insa_join_day").datepicker({
		showOn:"both",
		 buttonImage: "resources/images/calendar.png",
	     buttonImageOnly: true,
	     dateFormat: "yy/mm/dd"
	});

	$("#insa_retire_day").datepicker({
		showOn:"both",
		 buttonImage: "resources/images/calendar.png",
	     buttonImageOnly: true,
	     dateFormat: "yy/mm/dd"
	});
	
	$("#reset").click(function(){
		$(":text").val('');
		$("select").each(function(){
			$(this).find('option:first').attr('selected','true')
		});
	});
	
	$("#checkAll").click(function(){
		if($("#checkAll").prop("checked")){
			$("input[type=checkbox]").prop("checked", true);
		}else{
			$("input[type=checkbox]").prop("checked", false);
		}
	});
	
});

function goBack(){
	window.history.go(-1);
}

function checkDate(){
	var ckjoinDate = $("#insa_join_day").val();
	var jArr = ckjoinDate.split('/');
	console.log("ckjoinDate:"+ckjoinDate);
	console.log("jArr:"+jArr);
	
	var ckretireDate = $("#insa_retire_day").val();
	var rArr = ckretireDate.split('/');
	console.log("ckretireDate:"+ckretireDate);
	console.log("rArr:"+rArr);
	
	var join1 = new Date(jArr[0],jArr[1],jArr[2]);
	var retire1 = new Date(rArr[0],rArr[1],rArr[2]);
	console.log("join1:"+join1);
	console.log("retire1:"+retire1);
	
	if(join1.getTime()>retire1.getTime()){
		alert("퇴사날짜보다 입사날짜가 작아야합니다");
		$("#insa_retire_day").val("");
	}
}

function list(page, insa_sabun, insa_name, insa_join_type, insa_put_yn, insa_pos_gbn_code, insa_join_day, insa_retire_day, insa_join_gbn_code){	
	location.href="search.do?page="+page+"&insa_sabun="+insa_sabun+"&insa_name="+insa_name+"&insa_join_type="+insa_join_type+"&insa_put_yn="+insa_put_yn+"&insa_pos_gbn_code="+insa_pos_gbn_code+"&insa_join_day="+insa_join_day+"&insa_retire_day="+insa_retire_day+"&insa_join_gbn_code="+insa_join_gbn_code;
}

function dlbtck(){
	
	if($("input:checkbox[name=cksabun]").is(":checked") == true) {
		if(!confirm('선택한 사원을 삭제하시겠습니까?')){
			return false;
		}
	}else{
		alert("사원을 선택해주세요");
		return false;
	}
	
}

</script>
<style type="text/css">
table {
    width: 100%;
    table-layout: fixed;
}

.textbox input[type="text"], 
.textbox input[type="password"]{
    width: 60%;
}

.textbox_email input[type="text"]{
    width: 30%;
    margin: 0;
}

.textbox_zip input[type="text"]{
    width: 30%;
}

.textbox_addr input[type="text"]{
    width: 95%;
}

.textbox_cmp_reg_no input[type="text"]{
    width: 60%;
}

.textbox_date input[type="text"]{
	width: 50%;
}

.textbox select{
	width: 230px;
}

.textbox_gender select{
	width: 100px;
}

#insa_zip {
	text-align:center;
}

#insa_salary::-webkit-input-placeholder{
	text-align:right;
}

#insa_salary {
	text-align:right;
}

.modal-body {
	width : 400px;
}

.modal-body img {
	max-width : 100%;
}

table th{
	text-align:center;
}

#insa_list_tb{
	text-align:center;
}

#not_search{
	text-align:center;
}

/* div.left {
  width: 35%;
  float: left;
   box-sizing: border-box;
} */

div.right {
  position:absolute;
  top:70%;
  left:50%;
  transform:translate(-50%, -50%)
}
</style>
<title>직원리스트</title>
</head>
<body>
<div class="flex-grow-1 d-flex flex-column">
<nav class="navbar navbar-expand-sm bg-light navbar-light">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${pageContext.request.contextPath }/main.do">피노소프트</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a class="nav-link" href="${pageContext.request.contextPath }/memberinsertForm.do">입력하기</a></li>
      <li><a class="nav-link" href="${pageContext.request.contextPath }/selectForm.do">조회하기</a></li>
    </ul>
  </div>
</nav>
    <br>
    <div class="container-fluid">
	<h2>직원 리스트</h2>
	</div>
	<div class="container-fluid">
	<form action="search.do" id="search_list" name="search_list">
	<table>
		<tr>
			<td>
			<div class="textbox">
    		<label>사번&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_sabun" name="insa_sabun">
            </div>
			</td>
			<td>
			<div class="textbox">
    		<label>성명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_name" name="insa_name">
            </div>
			</td>
			<td>
			<div class="textbox">
    		<label>입사구분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select id="insa_join_type" name="insa_join_type">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list}">
					<c:if test="${insacom.note == 'insa_join_type'}">
						<option value="${insacom.name}">${insacom.name}</option>
					</c:if>
				</c:forEach>
            </select>
            </div>
			</td>
			<td>
			<div class="textbox">
    		<label>투입여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select id="insa_put_yn" name="insa_put_yn">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list}">
					<c:if test="${insacom.note == 'insa_put_yn'}">
						<option value="${insacom.name}">${insacom.name}</option>
					</c:if>
				</c:forEach>
            </select>
            </div>
			</td>
		</tr>
		<tr>
			<td>
			<div class="textbox">
    		<label>직위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select id="insa_pos_gbn_code" name="insa_pos_gbn_code">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list}">
					<c:if test="${insacom.note == 'insa_pos_gbn_code'}">
						<option value="${insacom.name}">${insacom.name}</option>
					</c:if>
				</c:forEach>
            </select>
            </div>
			</td>
			<td>
			<div class="textbox_date">
    		<label>입사일자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_join_day" name="insa_join_day" onchange="checkDate();">
            </div>
			</td>
			<td>
			<div class="textbox_date">
    		<label>퇴사일자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_retire_day" name="insa_retire_day" onchange="checkDate();">
            </div>
			</td>
			<td>
			<div class="textbox">
    		<label>직종체크&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    		<select id="insa_join_gbn_code" name="insa_join_gbn_code">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list }">
            		<c:if test="${insacom.note ==  'insa_join_gbn_code'}">
            			<option value="${insacom.name }">${insacom.name }</option>
            		</c:if>
            	</c:forEach>
            </select>
            </div>
			</td>
		</tr>
	</table>
	<div class="container-fluid text-right">
		<button id="uploadBtn" name="uploadBtn" class="btn btn-primary mr-1">검색</button>
		<button type="button" id="reset" class="btn btn-primary mr-1">초기화</button>
		<button type="button" class="btn btn-primary mr-1" onclick="goBack()">전화면</button>
	</div>
	<input type="hidden" name="currentPage"  value='<c:out value="${currentPage }"/>}'>
	</form>
	</div>
	<br>
	<div class="container-fluid">
	<form action="deleteChecked.do" id="deleteCheckform" name="deleteCheckform">
	<table id="insa_list_tb" border="1">
	<thead>
	<tr>
	<th><input type="checkbox" id="checkAll"></th>
	<th>사번</th>
	<th>성명</th>
	<th>주민번호</th>
	<th>핸드폰번호</th>
	<th>직위</th>
	<th>입사일자</th>
	<th>퇴사일자</th>
	<th>투입여부</th>
	<th>연봉</th>
	</tr>
	</thead>
	 <c:choose>
		<c:when test="${!empty select_insa }">
			<c:forEach items="${select_insa }" var="select_insa">
			<tbody>
			<tr id="table_list">
				<td><input type="checkbox" id="cksabun" name="cksabun" value="${select_insa.insa_sabun}"></td>
				<td onclick="javascript: location.href='memberupdateForm.do?insa_sabun=${select_insa.insa_sabun}&currentPage=${currentPage }'">${select_insa.insa_sabun }</td>
				<td>${select_insa.insa_name }</td>
				<td>${select_insa.insa_reg_no }</td>
				<td>${select_insa.insa_hp }</td>
				<td>${select_insa.insa_pos_gbn_code }</td>
				<td>${select_insa.insa_join_day }</td>
				<td>${select_insa.insa_retire_day }</td>
				<td>${select_insa.insa_put_yn }</td>
				<c:choose>
				<c:when test="${empty select_insa.insa_salary }">
				<td>${select_insa.insa_salary }</td>
				</c:when>
				<c:otherwise>
				<td style="text-align:right;">${select_insa.insa_salary }만원</td>
				</c:otherwise>
				</c:choose>
			</tr>
			</tbody>
			</c:forEach>			
		</c:when>
		<c:otherwise>     
			<tr id="not_search"><td colspan="10">검색된 결과가 없습니다</td></tr>
		</c:otherwise>
	</c:choose>
	</table>
	<br>
	<div class="left">
	<input type="hidden" name="qs" value="${url }">
	<c:if test="${!empty totalcnt }">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" id="deleteChecked" class="btn btn-primary mr-1" onclick="return dlbtck();">삭제</button>
	</c:if>
	</div>
	</form>
	<div class="riri">
	<div class="right">
	<c:if test="${!empty totalcnt }">
	<ul class="pagination">
	<c:set var="insa_sabun" value="${insa.insa_sabun}"/>
	<c:set var="insa_name" value="${insa.insa_name}"/>
	<c:set var="insa_join_type" value="${insa.insa_join_type}"/>
	<c:set var="insa_put_yn" value="${insa.insa_put_yn}"/>
	<c:set var="insa_pos_gbn_code" value="${insa.insa_pos_gbn_code}"/>
	<c:set var="insa_join_day" value="${insa.insa_join_day}"/>
	<c:set var="insa_retire_day" value="${insa.insa_retire_day}"/>
	<c:set var="insa_join_gbn_code" value="${insa.insa_join_gbn_code}"/>
	<c:if test="${curPage>1}">
		<li class='page-item'><a class="page-link" href="search.do?page=1&insa_sabun=${insa.insa_sabun }&insa_name=${insa.insa_name }&insa_join_type=${insa.insa_join_type }&insa_put_yn=${insa.insa_put_yn }&insa_pos_gbn_code=${insa.insa_pos_gbn_code }&insa_join_day=${insa.insa_join_day }&insa_retire_day=${insa.insa_retire_day }&insa_join_gbn_code=${insa.insa_join_gbn_code }&uploadBtn=">처음</a></li>
	</c:if> 									
	<c:if test="${curPage>1}">
		<li class='page-item'><a class="page-link" href="search.do?page=${beginPage-1}&insa_sabun=${insa.insa_sabun }&insa_name=${insa.insa_name }&insa_join_type=${insa.insa_join_type }&insa_put_yn=${insa.insa_put_yn }&insa_pos_gbn_code=${insa.insa_pos_gbn_code }&insa_join_day=${insa.insa_join_day }&insa_retire_day=${insa.insa_retire_day }&insa_join_gbn_code=${insa.insa_join_gbn_code }&uploadBtn=">Pre</a></li>
	</c:if>															
	<c:forEach var ="page" begin="${beginPage}" end="${finalPage}">
		<c:choose>
		<c:when test="${page==currentPage}">												
			<li class='page-item'><a class="page-link" style="color:red;">${page}</a></li>
		</c:when>										
		<c:otherwise> 
			<li class='page-item'><a class="page-link" onclick="list('${page}','${insa.insa_sabun}','${insa.insa_name}','${insa.insa_join_type}','${insa.insa_put_yn}','${insa.insa_pos_gbn_code}','${insa.insa_join_day}','${insa.insa_retire_day}','${insa.insa_join_gbn_code}')">${page}</a></li>
		</c:otherwise> 
		 </c:choose> 
	</c:forEach>  									
	<c:if test="${curPage!=totalPage}">
		<li class='page-item'><a class="page-link" href="search.do?page=${finalPage+1}&insa_sabun=${insa.insa_sabun }&insa_name=${insa.insa_name }&insa_join_type=${insa.insa_join_type }&insa_put_yn=${insa.insa_put_yn }&insa_pos_gbn_code=${insa.insa_pos_gbn_code }&insa_join_day=${insa.insa_join_day }&insa_retire_day=${insa.insa_retire_day }&insa_join_gbn_code=${insa.insa_join_gbn_code }&uploadBtn=">Next</a></li>
	</c:if>									
	<c:if test="${curPage!=totalPage}">
		<li class='page-item'><a class="page-link" href="search.do?page=${maxPage}&insa_sabun=${insa.insa_sabun }&insa_name=${insa.insa_name }&insa_join_type=${insa.insa_join_type }&insa_put_yn=${insa.insa_put_yn }&insa_pos_gbn_code=${insa.insa_pos_gbn_code }&insa_join_day=${insa.insa_join_day }&insa_retire_day=${insa.insa_retire_day }&insa_join_gbn_code=${insa.insa_join_gbn_code }&uploadBtn=">맨끝</a></li>
	</c:if>									
	</ul>
	</c:if>
	</div>
	</div>
	</div>
	</div>
</body>
</html>