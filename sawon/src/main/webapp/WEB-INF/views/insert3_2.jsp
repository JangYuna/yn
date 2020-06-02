<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<!-- jquery-3.3.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	$("#uploadBtn").on("click", function(e){
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile1']");
		var files = inputFile[0].files;
		
		console.log(files);
		
		for(var i=0; i<files.length; i++){
		
			formData.append("uploadFile", files[i]);
			
		}		
		
		/* var inputFile1 = $("input[name='uploadFile1']");
		var inputFile2 = $("input[name='uploadFile2']");
		var inputFile3 = $("input[name='uploadFile3']");
		
		var arrFiles = new Array();
		debugger;
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
			url : 'fileupload.do',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			success : function(result){
				alert(result);
				$("#textFile1").val(result);
			}
		}); //$.ajax
	});
}); 
</script>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	<div>		
		<input type="submit" id="uploadBtn" name="uploadBtn" class="btn btn-primary mr-1" value="µî·Ï"/>

		<input type="text" name="textFile1" id="textFile1">
	 	<input type="file" name="uploadFile1" class="form-control" id="uploadFile1" >
<!-- 	 	<input type="file" name="uploadFile2" class="form-control" id="uploadFile2" >
	 	<input type="file" name="uploadFile3" class="form-control" id="uploadFile3" > -->
	</div>
</body>
</html>