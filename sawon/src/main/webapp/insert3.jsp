<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- jquery-3.3.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#uploadBtn").on("click", function(e){
		var form = $("#dataForm")[0];
		var formData = new FormData(form);
		
		/* var inputFile1 = $("input[name='uploadFile1']");
		var inputFile2 = $("input[name='uploadFile2']");
		var inputFile3 = $("input[name='uploadFile3']");
		
		var arrFiles = new Array();
		arrFiles[0] = inputFile1[0].files[0];
		arrFiles[1] = inputFile2[0].files[0];
		arrFiles[2] = inputFile3[0].files[0];
		
 		console.log(arrFiles[0]);
		console.log(arrFiles[1]);
		console.log(arrFiles[2]); 
		
		console.log(arrFiles);
		
		formData.append("fileObj1", arrFiles[0]);
		formData.append("fileObj2", arrFiles[1]);
		formData.append("fileObj3", arrFiles[2]);
		
		console.log(formData); */
		
 		$.ajax({
			url : 'uploadAjaxAction.do',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			success : function(result){
				alert("Uploaded");
			}
		}); //$.ajax 
	});
});
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<button id="uploadBtn" name="uploadBtn">등록</button>
		<form id="dataForm" action="#" method="post" enctype="multipart/form-data">
		 	<input type="file" name="uploadFile1" class="form-control" id="uploadFile1" >
		 	<input type="file" name="uploadFile2" class="form-control" id="uploadFile2" >
		 	<input type="file" name="uploadFile3" class="form-control" id="uploadFile3" >
		 	<input type="text" name="insa_profile" id="insa_profile">
		 </form>
	 </div>
</body>
</html>