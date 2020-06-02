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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- 주소검색 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
//아이디 인증을 받으면 true
var idConfirmed = false;
//1.아이디 정규식 : 4 ~ 20 자리 영(대, 소), 숫자 / 첫글자는 숫자 사용 불가
var idpattern = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
//2. 비밀번호 정규식 : 최소 8 자, 최소 하나의 문자 및 하나의 숫자
var pwpattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
//3. 이메일 정규식 : 4 ~ 12 영(대, 소), 숫자
var emailpattern = /^[A-Za-z0-9+]{4,12}$/;
//3-2. 이메일 주소 정규식
var emailpattern2 = /@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//4. 숫자 정규식
var numpattern =  /^[0-9]*$/;
//5. 한글 정규식
var hanpattern = /^[가-힣]+$/;
//6. 전화번호 형태 : 전화번호 형태 000-0000-0000 만 받는다. ]
var phonepattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
//7. 주민번호, -까지 포함된 문자열로 검색
var juminpattern = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
//8. 영문 정규식
var engpattern = /^[a-zA-Z]*$/;
//9. 숫자, 하이픈 정규식
var numhapattern = /^[0-9-]{2,20}$/;

/////////////////////////////////서브밋
function signIn(){
	var iden = $("#insa_id").val();
	var pwd = $("#insa_pwd").val();
	var email = $("#insa_email").val();
	var email2 = $("#insa_email2").val();
	var name = $("#insa_name").val();
	var eng_name = $("#insa_eng_name").val();
	var phone = $("#insa_phone").val();
	var hp = $("#insa_hp").val();
	var cmp_reg_no = $("#insa_cmp_reg_no").val();
	var reg_no = $("#insa_reg_no").val();
	var join_day = $("#insa_join_day").val();

	if(iden==""){
		alert("아이디를 입력해주세요. ");
		$("#insa_id").focus();
		return false;
	}else if(pwpattern.test(pwd)==false){
		alert("비밀번호는 최소 8 자, 최소 하나의 문자 및 하나의 숫자를 입력해주세요");
		$("#insa_pwd").focus();
		return false;
	}else if($("#insa_pwd").val()!=$("#insa_pwd2").val()){
		alert("비밀번호가 일치하지 않습니다. 다시 작성해주세요");
		$("#insa_pwd2").focus();
		return false;
	}else if(email==""){
		alert("이메일을 입력해주세요.");
		$("#insa_email").focus();
		return false;
	}else if(emailpattern.test(email)==false){
		alert("이메일 형식에 맞지 않는 이메일입니다. 영문과 숫자만 입력 가능합니다");
		$("#insa_email").focus();
		return false;
	}else if(emailpattern2.test(email2)==false){
		alert("이메일 주소를 정확히 입력해주세요");
		$("#insa_email2").focus();
		return false;
	}else if(name==""){
		alert("이름을 입력해주세요");
		$("#insa_name").focus();
		return false;
	}else if(hanpattern.test(name)==false){
		alert("이름은 한글만 입력 가능합니다. 다시 확인해주세요");
		$("#insa_name").focus();
		return false;
	}else if(hp==""){
		alert("핸드폰번호를 입력해주세요");
		$("#insa_hp").focus();
		return false;
	}else if(phonepattern.test(hp)==false){
		alert("핸드폰번호 형식에 맞지 않습니다. 다시 확인해주세요");
		$("#insa_hp").focus();
		return false;
	}else if(eng_name != "" && engpattern.test(eng_name)==false){
		alert("영문이름은 영문만 입력 가능합니다. 다시 확인해주세요");
		$("#insa_eng_name").focus();
		return false;
	}else if(phone != "" && phonepattern.test(phone)==false){
		alert("전화번호 형식에 맞지 않습니다. 다시 확인해주세요");
		$("#insa_phone").focus();
		return false;
	}else if(cmp_reg_no != "" && numhapattern.test(cmp_reg_no)==false){
		alert("사업자번호는 숫자만 입력 가능합니다. 다시 확인해주세요");
		$("#insa_cmp_reg_no").focus();
		return false;
	}else if(join_day==""){
		alert("입사일자를 선택해주세요");
		$("#insa_join_day").focus();
		return false;
	}
	return;
}

/////////주소 검색
function execDaumPostcode(){
    new daum.Postcode({
        oncomplete: function(data) {
        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('insa_zip').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('insa_addr1').value = fullRoadAddr;
            
            /* // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            } */
        }
    }).open();
}

//////////////////////////function
$(function(){
///////////////////////////////////////////////////////form
/*	$("#uploadBtn").on("click", function(e){
		
		var inputFile1 = $("input[name='uploadFile1']");
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
		
		console.log(formData); 
		
		var iden = $("#insa_id").val();
		var pwd = $("#insa_pwd").val();
		var email = $("#insa_email").val();
		var name = $("#insa_name").val();
		var eng_name = $("#insa_eng_name").val();
		var phone = $("#insa_phone").val();
		var hp = $("#insa_hp").val();
		var cmp_reg_no = $("#insa_cmp_reg_no").val();
		var reg_no = $("#insa_reg_no").val();
		
		if(iden==""){
			alert("아이디를 입력해주세요. ");
			$("#insa_id").focus();
			return;
		}else if(idpattern.test(iden)==false){
			alert("형식에 맞지 않는 아이디입니다. ");
			$("#insa_id").focus();
			return;
		}else if(pwpattern.test(pwd)==false){
			alert("비밀번호는 최소 8 자, 최소 하나의 문자 및 하나의 숫자를 입력해주세요");
			$("#insa_pwd").focus();
			return;
		}else if($("#insa_pwd").val()!=$("#insa_pwd2").val()){
	 		alert("비밀번호가 일치하지 않습니다. 다시 작성해주세요");
	 		$("#insa_pwd2").focus();
	 		return;
	 	}else if(email==""){
			alert("이메일을 입력해주세요.");
			$("#insa_email").focus();
			return;
		}else if(emailpattern.test(email)==false){
			alert("이메일 형식에 맞지 않는 이메일입니다. 다시 확인해주세요");
			$("#insa_email").focus();
			return;
		}else if(name==""){
			alert("이름을 입력해주세요");
			$("#insa_name").focus();
			return;
		}else if(hanpattern.test(name)==false){
			alert("이름은 한글만 입력 가능합니다. 다시 확인해주세요");
			$("#insa_name").focus();
			return;
		}else if(hp==""){
			alert("핸드폰번호를 입력해주세요");
			$("#insa_hp").focus();
			return;
		}else if(phonepattern.test(hp)==false){
			alert("핸드폰번호 형식에 맞지 않습니다. 다시 확인해주세요");
			$("#insa_hp").focus();
			return;
		}else if(eng_name != "" && engpattern.test(eng_name)==false){
			alert("영문이름은 영문만 입력 가능합니다. 다시 확인해주세요");
			$("#insa_eng_name").focus();
			return;
		}else if(phone != "" && phonepattern.test(phone)==false){
			alert("전화번호 형식에 맞지 않습니다. 다시 확인해주세요");
			$("#insa_phone").focus();
			return;
		}else if(cmp_reg_no != "" && numhapattern.test(cmp_reg_no)==false){
			alert("사업자번호는 숫자만 입력 가능합니다. 다시 확인해주세요");
			$("#insa_cmp_reg_no").focus();
			return;
		}else if(reg_no != "" && juminpattern.test(reg_no)==false){
			alert("주민등록번호 형식에 맞지 않습니다. 다시 확인해주세요");
			$("#insa_reg_no").focus();
			return;
		}
		
		var form = $("#dataForm")[0];
		var formData = new FormData(form);
		
 		$.ajax({
			url : 'memberinsert.do',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			success : function(result){
				alert("Uploaded");
			}
		}); //$.ajax 
	}); */

/////////////////////////아이디 중복검사
$("#insa_id").on('change', function(){
	
	var iden = $("#insa_id").val();
	
		if(idpattern.test(iden)==false){
			alert("형식에 맞지 않는 아이디입니다. ");
			$("#insa_id").focus();
			return false;
		}else{
			$.ajax({
				url: "idConfirmation.do",
				data:{id: $("#insa_id").val()},
				type:"POST",
				success:function(result){
					if(result=='true'){
						idConfirmed=true;
						alert("사용할 수 있는 아이디 입니다");
					}else if(result='false'){
						idConfirmed=false;
						alert("사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요");
					}
				},
				error: function(){
					alert("아이디 인증 실패");
					idConfirmed=false;				
				}
			});
		}		
	
});	
////////////////////////주민번호
$("#insa_reg_no").on('change',function(){
	
	var jumin = $("#insa_reg_no").val(); // 주민등록번호 밸류 값 	
	console.log(jumin);
	
	var jumingubun = jumin.indexOf("-");
	var birthStr = jumin.substring(0, jumingubun);
	
	console.log("jumingubun:"+jumingubun);
	console.log("birthStr:"+birthStr);
	
	var century = jumin.substring(jumingubun+1, jumingubun+2);
	  if(century == 9 || century == 0) {
	   birthStr = "18" + birthStr;
	  } else if(century == 1 || century == 2 || century == 5 || century == 6) {
	   birthStr = "19" + birthStr;
	  } else if(century == 3 || century == 4 || century == 7 || century == 8) {
	   birthStr = "20" + birthStr;
	  }
	  
	  console.log("century:"+century);
	  console.log("birthStr"+birthStr);
	  
	  const date = new Date();
	  
	  console.log("date:"+date)
	 
	  var sdf = moment(date).format('YYYY MM DD');
	  
	  console.log("sdf:"+sdf);
	  
	  var birthDay = moment(birthStr).format('YYYY MM DD');
	  
	  console.log("birthDay:"+birthDay);
	  
	  var today = new Date();
	  
	  console.log("today:"+today);
	  console.log("birthDay:"+birthDay);
	  
	  var factor = 0;
	  if((moment(today).format('YYYY'))<(moment(birthDay).format('YYYY'))){
		  factor = -1;
	  }
	  
	  var age = moment(today).format('YYYY') - moment(birthDay).format('YYYY') + factor;
	  
	  console.log("insa_years:"+age);
	  
	  if(birthDay == "" && juminpattern.test(birthDay)==false){
		  $("#insa_years").val("");
	  }else {
		  $("#insa_years").val(age);
	  }
	  
	  if(century == 1 || century == 3){
		  $("#insa_sex option:eq(2)").attr("selected","selected");
	  }else if(century == 2 || century == 4){
		  $("#insa_sex option:eq(1)").attr("selected","selected");
	  }	
	
});
	
//////////////////////연봉
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$("input[name='insa_salary']").on("keyup", function() {
    $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
});

/////////////////////미필 군필 여부
$("#insa_mil_yn").on("change", function(){
	
	var state = $("#insa_mil_yn option:selected").val();
	
	console.log("state:"+state);
	
	if(state == '미필' || state == '면제'){
		$("#insa_mil_type2").attr('disabled', 'disabled');
		$("#insa_mil_level2").attr('disabled', 'disabled');
		$("#insa_mil_startdate2").attr('disabled', 'disabled');
		$("#insa_mil_enddate2").attr('disabled', 'disabled');
		
		$("#insa_mil_type2").val('');
		$("#insa_mil_level2").val('');
		$("#insa_mil_startdate2").val('');
		$("#insa_mil_enddate2").val('');
		
		$("#insa_mil_type").val('');
		$("#insa_mil_level").val('');
		$("#insa_mil_startdate").val('');
		$("#insa_mil_enddate").val('');		
		
	}else {
		$("#insa_mil_type2").removeAttr("disabled");
		$("#insa_mil_level2").removeAttr("disabled");
		$("#insa_mil_startdate2").removeAttr("disabled");
		$("#insa_mil_enddate2").removeAttr("disabled");

	}
	
});

//////////////////KOSA 등록 여부
$("#insa_kosa_reg_yn").on("change", function(){
	
	var state = $("#insa_kosa_reg_yn option:selected").val();
	
	console.log("state:"+state);
	
	if(state == 'N'){
		$("#insa_kosa_class_code2").attr('disabled', 'disabled');
		
		$("#insa_kosa_class_code2").val('');
		$("#insa_kosa_class_code").val('');
	}else {
		$("#insa_kosa_class_code2").removeAttr("disabled");

	}
	
});

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

$("#insa_mil_startdate2").datepicker({
	showOn:"both",
	 buttonImage: "resources/images/calendar.png",
     buttonImageOnly: true,
     dateFormat: "yy/mm/dd"
});

$("#insa_mil_enddate2").datepicker({
	showOn:"both",
	 buttonImage: "resources/images/calendar.png",
     buttonImageOnly: true,
     dateFormat: "yy/mm/dd"
});
////////////////////초기화
$("#reset").click(function(){
	$(":text").val('');
	$("select").each(function(){
		$(this).find('option:first').attr('selected','true')
	});
	$("#insa_self_intro").val('');
});
////////////////파일 업로드
$("#btn-upload").click(function(e){
	e.preventDefault();
	$("#insa_cmp_reg_image2").click();
});
$("#btn-upload2").click(function(e){
	e.preventDefault();
	$("#insa_carrier2").click();
});
$("#btn-upload3").click(function(e){
	e.preventDefault();
	$("#insa_profile2").click();
});
///////////////////////////////모달
$("#cmp_reg_image_bt").click(function() {
    $("#cmp_reg_image_modal").modal("show");
});

$("#insa_cmp_reg_image2").change(function(){
	readURL(this);
});

///////////////////////////////모달2
$("#carrier_bt").click(function() {
    $("#carrier_modal").modal("show");
});

$("#insa_carrier2").change(function(){
	readURL2(this);
});

//////////////////////////////사진올리기
$("#insa_profile2").change(function(){
	readURL3(this);
});

$("#insa_mil_type2").change(function(){
	var insa_mil_type = $("#insa_mil_type2").val();
	console.log("insa_mil_type2:"+insa_mil_type);
	$("#insa_mil_type").val(insa_mil_type);
	console.log("insa_mil_type:"+$("#insa_mil_type").val());
});

$("#insa_mil_level2").change(function(){
	var insa_mil_level = $("#insa_mil_level2").val();
	console.log("insa_mil_level2:"+insa_mil_level);
	$("#insa_mil_level").val(insa_mil_level);
	console.log("insa_mil_level:"+$("#insa_mil_level").val());
});

$("#insa_mil_startdate2").change(function(){
	var insa_mil_startdate = $("#insa_mil_startdate2").val();
	console.log("insa_mil_startdate2:"+insa_mil_startdate);
	$("#insa_mil_startdate").val(insa_mil_startdate);
	console.log("insa_mil_startdate:"+$("#insa_mil_startdate").val());
});

$("#insa_mil_enddate2").change(function(){
	var insa_mil_enddate = $("#insa_mil_enddate2").val();
	console.log("insa_mil_enddate2:"+insa_mil_enddate);
	$("#insa_mil_enddate").val(insa_mil_enddate);
	console.log("insa_mil_enddate:"+$("#insa_mil_enddate").val());
});

$("#insa_kosa_class_code2").change(function(){
	var insa_kosa_class_code = $("#insa_kosa_class_code2").val();
	console.log("insa_kosa_class_code2:"+insa_kosa_class_code);
	$("#insa_kosa_class_code").val(insa_kosa_class_code);
	console.log("insa_kosa_class_code:"+$("#insa_kosa_class_code").val());
});

$("#insa_email3").change(function(){
	
	$("#insa_email3 option:selected").each(function(){
		if($(this).val() == '1'){
			$("#insa_email2").removeAttr("readonly");
			$("#insa_email2").val('@');
			$("#insa_email2").focus();			
		}else{
			var insa_email3 = $("#insa_email3").val();
			console.log("insa_email3:"+insa_email3);
			$("#insa_email2").val(insa_email3);	
			$("#insa_email2").attr("readonly", true);
		}
	});	
});

$("#insa_reg_no").keyup(function(){
	
	var ContentsData = $("#insa_reg_no").val();
	var jumin = $("#insa_reg_no").val();
	var len;
	
	console.log("aaaaaaaaaaaa:"+ContentsData);
	
	var ninArray = ContentsData.match(/(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}[0-9]{6}\b/gi);
    if(ninArray== null || ninArray =="")
    {
        ContentsData = ContentsData;
    }
    else
    {
        len = ninArray.toString().split('-').length;
        ContentsData = ContentsData.toString().replace(ninArray,ninArray.toString().replace(/-?([1-4]{1})([0-9]{5})$/gi,"******"));
    }

    ninArray = ContentsData.match(/\d{13}/gi);
    if(ninArray== null || ninArray =="")
    {
        ContentsData = ContentsData;
    }
    else
    {
        ContentsData = ContentsData.toString().replace(ninArray,ninArray.toString().replace(/([0-9]{6})$/gi,"******"));
    }
    
    console.log("ContentsData:"+ContentsData);
    
    $("#insa_reg_no").val(ContentsData);
    
    var jumin2 =  $("#insa_reg_no2").val(jumin);
	
    console.log("jumin:"+jumin);
	console.log("insa_reg_no2:"+ jumin2);
		
});

$("#insa_cmp_reg_no").keyup(function(){
	var num = $("#insa_cmp_reg_no").val();
	num.trim();
	this.value = AutoHypen(num);
});

});

function AutoHypen(companyNum){
    companyNum = companyNum.replace(/[^0-9]/g, '');
    var tempNum = '';   

    if(companyNum.length < 4){
      return companyNum;
    }
    else if(companyNum.length < 6){
      tempNum += companyNum.substr(0,3);
      tempNum += '-';
      tempNum += companyNum.substr(3,2);
      return tempNum;
    }
    else if(companyNum.length < 11){
      tempNum += companyNum.substr(0,3);
      tempNum += '-';
      tempNum += companyNum.substr(3,2);
      tempNum += '-';
      tempNum += companyNum.substr(5);
      return tempNum;
    }
    else{        
      tempNum += companyNum.substr(0,3);
      tempNum += '-';
      tempNum += companyNum.substr(3,2);
      tempNum += '-';
      tempNum += companyNum.substr(5);
      return tempNum;
    }
}

function readURL(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		
		reader.onload = function (e) {
			$("#cmp_reg_image").attr('src', e.target.result);  
		  }
		reader.readAsDataURL(input.files[0]);
	}
	$("#insa_cmp_reg_image").val(input.files[0].name);
}

function readURL2(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		
		reader.onload = function (e) {
			$("#carrier_image").attr('src', e.target.result);  
		  }
		reader.readAsDataURL(input.files[0]);
	}
	$("#insa_carrier").val(input.files[0].name);
}

function readURL3(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		
		reader.onload = function (e) {
			$("#profile_img_2").attr('src', e.target.result);  
		  }
		reader.readAsDataURL(input.files[0]);
	}
	$("#insa_profile").val(input.files[0].name);
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

function checkDate2(){
	var ckjoinDate = $("#insa_mil_startdate2").val();
	var jArr = ckjoinDate.split('/');
	console.log("ckjoinDate:"+ckjoinDate);
	console.log("jArr:"+jArr);
	
	var ckretireDate = $("#insa_mil_enddate2").val();
	var rArr = ckretireDate.split('/');
	console.log("ckretireDate:"+ckretireDate);
	console.log("rArr:"+rArr);
	
	var join1 = new Date(jArr[0],jArr[1],jArr[2]);
	var retire1 = new Date(rArr[0],rArr[1],rArr[2]);
	console.log("join1:"+join1);
	console.log("retire1:"+retire1);
	
	if(join1.getTime()>retire1.getTime()){
	alert("전역일자보다 입영일자가 작아야합니다");
		$("#insa_mil_enddate2").val("");
	}
}

function insertPass(){
    var a = document.getElementById("insa_pwd_s");
    var b = document.getElementById("insa_pwd");
    var c = "";
    if(a.value.substring(a.value.length-1,a.value.length)=='*'){
     b.value = b.value.substring(0,b.value.length-1);
     console.log("b:"+b);
    }else if(a.value.substring(a.value.length-1,a.value.length)==""){

	    b.value = b.value.substring(0,b.value.length-1);
	    console.log("b.:"+b);

	}else{

     b.value = b.value + a.value.substring(a.value.length-1,a.value.length);
     console.log("b:"+b);
      }
    for(i=0;i<a.value.length-1;i++){
     c = c+"*";
    }
    c = c+a.value.substring(a.value.length-1,a.value.length);
    a.value = c;
}

function goBack(){
	window.history.go(-1);
}

function inputPhoneNumber(obj) {

    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

function pwdchecking(){
	
	if($("#insa_pwd").val()!=$("#insa_pwd2").val()){
		alert("비밀번호가 일치하지 않습니다. 다시 작성해주세요");
		$("#insa_pwd2").focus();
	}
	
}
</script>
<title>인사관리시스템</title>
</head>

<style type="text/css">
table {
    width: 100%;
    table-layout: fixed;
}
/* .textbox label {
  color: gray;
  padding: 8px;
}

.textbox_email label {
  color: gray;
  padding: 8px;
} */

.textbox input[type="text"], 
.textbox input[type="password"]{
    width: 60%;
}

.textbox_email input[type="text"]{
    width: 25%;
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

.modal-content img{
	width : 400px;
	height : 600px;
}

.modal-body img {
	max-width : 100%;
	max-height : 100%;
}

.nav-item {
	text-align:right;
}

#insa_sabun, #insa_cmp_reg_image, #insa_carrier{
   background-color: rgb(220, 220, 220);
}

.textbox_salary{
	width:88%;
}
</style>
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
	<h2>직원 상세 정보</h2>
	</div>
	<form id="dataForm" enctype="multipart/form-data" method="post" action="memberinsert.do" onsubmit="return signIn();">
	<div class="col-xl text-right">
		<button type="submit" class="btn btn-primary mr-1">등록</button>
		<button type="button" class="btn btn-primary mr-1" onclick="goBack()">전화면</button>
		<button type="button" id="reset" class="btn btn-primary mr-1">초기화</button>
	</div>
	<br>
    <table>
    	<tr>
    		<td rowspan="6" align = "center">
    		<img src="resources/images/base_profile.png" id="profile_img_2" name ="profile_img_2" style="width : 180px; height : 180px;"><br>
    		<button type="button" class="btn btn-outline-primary" id="btn-upload3">사진올리기</button>
    		<input type="file" id="insa_profile2" name="insa_profile2" style="display: none;">
    		<input type="hidden" id="insa_profile" name="insa_profile">
    		</td>
    		<td>
    		<div class="textbox">
    		<label>*사번&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_sabun" name="insa_sabun" readonly>
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<label>*한글성명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_name" name="insa_name">
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<label>영문성명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_eng_name" name="insa_eng_name">
            </div>
    		</td>
    	</tr>
    	<tr>
    		<td>
    		<div class="textbox">
    		<label>*아이디&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_id" name="insa_id">
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<label>*패스워드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="password" id="insa_pwd" name="insa_pwd">
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<label>*패스워드확인</label>
             <input type="password" id="insa_pwd2" name="insa_pwd2" onchange="pwdchecking()">
            </div>
    		</td>
    	</tr>
    	<tr>
    		<td>
    		<div class="textbox">
    		<label>전화번호&nbsp;&nbsp;</label>
            <input type="text" id="insa_phone" name="insa_phone" onKeyup="inputPhoneNumber(this);">
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<label>*핸드폰번호&nbsp;&nbsp;</label>
            <input type="text" id="insa_hp" name="insa_hp" onKeyup="inputPhoneNumber(this);">
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<label>주민번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_reg_no" name="insa_reg_no">
            <input type="hidden" id="insa_reg_no2" name="insa_reg_no2">
            </div>
    		</td>
    	</tr>
    	<tr>
    		<td>
    		<div class="textbox">
    		<label>연령&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_years" name="insa_years">
            </div>
    		</td>
    		<td>
    		<div class="textbox_email">    		
    		<label>*이메일</label> 		
            <input type="text" id="insa_email" name="insa_email">
            <input type="text" id="insa_email2" name="insa_email2">
            <select id="insa_email3" name="insa_email3">
            	<option value="">선택</option>
            	<option>@naver.com</option>
            	<option>@daum.net</option>
            	<option>@gmail.com</option>
            	<option>@yahoo.com</option>
            	<option value="1">직접입력</option>
            </select>
            </div>
    		</td>
    		<td>
    		<div class="textbox_gender">
    		<label>직종체크</label>
    		<select id="insa_join_gbn_code" name="insa_join_gbn_code">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list }">
            		<c:if test="${insacom.note ==  'insa_join_gbn_code'}">
            			<option value="${insacom.name }">${insacom.name }</option>
            		</c:if>
            	</c:forEach>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		<label>성별</label>
    		<select id="insa_sex" name="insa_sex">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list }">
            		<c:if test="${insacom.note == 'insa_sex' }">
            			<option value="${insacome.name }">${insacom.name }</option>
            		</c:if>
            	</c:forEach>
            </select>
            </div>
    		</td>
    	</tr>
    	<tr>
    		<td>
    		<div class="textbox_zip">
    		<label>주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_zip" name="insa_zip" placeholder="우편번호">
            &nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-outline-primary" onclick="execDaumPostcode()">주소검색</button>
            </div>
    		</td>
    		<td>
    		<div class="textbox_addr">
            <input type="text" id="insa_addr1" name="insa_addr1" placeholder="주소">
            </div>
    		</td>
    		<td>
    		<div class="textbox_addr">
            <input type="text" id="insa_addr2" name="insa_addr2" placeholder="세부주소">
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
    		<div class="textbox">
    		<label>부서&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select id="insa_dept_code" name="insa_dept_code">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list}">
					<c:if test="${insacom.note == 'insa_dept_code'}">
						<option value="${insacom.name}">${insacom.name}</option>
					</c:if>
				</c:forEach>
            </select>
            </div>
    		</td>
    		<td>
    		<div class="textbox_salary">
    		<div style="width:20%; float: left;">	
    		<label>연봉</label></div>  	
    		<div style='border:solid 1px #AAAAAA; width:68%; float: right;'>
            <input type="text" id="insa_salary" name="insa_salary" style='width:75%; border:0px; text-align:right;'>
            (만원)</div>
            </div>
    		</td>
    	</tr>
    	<tr>
    		<td>
    		<div class="textbox">
    		<label>입사구분&nbsp;&nbsp;&nbsp;&nbsp;</label>
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
    		<label>등급&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select id="insa_gart_level" name="insa_gart_level">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list}">
					<c:if test="${insacom.note == 'insa_gart_level'}">
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
    		<td>
    		<div class="textbox">
    		<label>군필여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select id="insa_mil_yn" name="insa_mil_yn">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list}">
					<c:if test="${insacom.note == 'insa_mil_yn'}">
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
    		<label>군별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select id="insa_mil_type2" name="insa_mil_type2">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list}">
					<c:if test="${insacom.note == 'insa_mil_type'}">
						<option value="${insacom.name}">${insacom.name}</option>
					</c:if>
				</c:forEach>
            </select>
            <input type="hidden" id="insa_mil_type" name="insa_mil_type">
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<label>계급&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select id="insa_mil_level2" name="insa_mil_level2">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list}">
					<c:if test="${insacom.note == 'insa_mil_level'}">
						<option value="${insacom.name}">${insacom.name}</option>
					</c:if>
				</c:forEach>
            </select>
            <input type="hidden" id="insa_mil_level" name="insa_mil_level">
            </div>
    		</td>
    		<td>
    		<div class="textbox_date">
    		<label>입영일자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_mil_startdate2" name="insa_mil_startdate2" onchange="checkDate2();">
            <input type="hidden" id="insa_mil_startdate" name="insa_mil_startdate">
            </div>
    		</td>
    		<td>
    		<div class="textbox_date">
    		<label>전역일자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_mil_enddate2" name="insa_mil_enddate2" onchange="checkDate2();">
            <input type="hidden" id="insa_mil_enddate" name="insa_mil_enddate">
            </div>
    		</td>
    	</tr>
    	<tr>
    		<td>
    		<div class="textbox">
    		<label>KOSA등록&nbsp;&nbsp;</label>
            <select id="insa_kosa_reg_yn" name="insa_kosa_reg_yn">
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list}">
					<c:if test="${insacom.note == 'insa_kosa_reg_yn'}">
						<option value="${insacom.name}">${insacom.name}</option>
					</c:if>
				</c:forEach>
            </select>
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<label>KOSA등급</label>
            <select id="insa_kosa_class_code2" name="insa_kosa_class_code2">            
            	<option value="">선택</option>
            	<c:forEach var="insacom" items="${list}">
					<c:if test="${insacom.note == 'insa_kosa_class_code'}">
						<option value="${insacom.name}">${insacom.name}</option>
					</c:if>
				</c:forEach>
            </select>
            <input type="hidden" id="insa_kosa_class_code" name="insa_kosa_class_code">
            </div>
    		</td>
    		<td>
    		<div class="textbox_date">
    		<label>*입사일자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_join_day" name="insa_join_day" onchange="checkDate();">
            </div>
    		</td>
    		<td>
    		<div class="textbox_date">
    		<label>퇴사일자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_retire_day" name="insa_retire_day" onchange="checkDate();">
            </div>
    		</td>
    	</tr>
    	<tr>
    		<td>
    		<div class="textbox_cmp_reg_no">
    		<label>사업자번호</label>
            <input type="text" id="insa_cmp_reg_no" name="insa_cmp_reg_no">
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<label>업체명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_crm_name" name="insa_crm_name">
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<label>사업자등록증</label>
            <input type="text" id="insa_cmp_reg_image" name="insa_cmp_reg_image" readonly>
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<button type="button" class="btn btn-outline-primary" id="cmp_reg_image_bt" data-toggle="modal">미리보기</button>
    		<input type="file" id="insa_cmp_reg_image2" name="insa_cmp_reg_image2" style="display: none;">
    		<button type="button" class="btn btn-outline-primary" id="btn-upload">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
            </div>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    		<div class="textbox">
    		<label>자기소개&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <textarea cols="80" rows="1" id="insa_self_intro" name="insa_self_intro" placeholder="100자 내외로 적으시오"></textarea>
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<label>이력서&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" id="insa_carrier" name="insa_carrier" readonly>
            </div>
    		</td>
    		<td>
    		<div class="textbox">
    		<button type="button" class="btn btn-outline-primary" id="carrier_bt" data-toggle="modal">미리보기</button>
    		<input type="file" id="insa_carrier2" name="insa_carrier2" style="display: none;">
    		<button type="button" class="btn btn-outline-primary" id="btn-upload2">파일업로드</button>
            </div>
    		</td>
    	</tr>
    </table>
 	</form>
 </div>
  <!-- The Modal -->
  <div class="modal fade" id="cmp_reg_image_modal">
    <div class="modal-dialog modal-sm">
    	<div class="modal-content">  
        <!-- Modal body -->
          <img id="cmp_reg_image" />
    </div>
    </div>
  </div>
    <!-- The Modal -->
  <div class="modal fade" id="carrier_modal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <!-- Modal body -->
          <img id="carrier_image" />
      </div>
    </div>
  </div>
</body>
</html>