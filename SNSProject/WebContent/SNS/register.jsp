<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<style>
#button {
	width: 395px;
	background-color: #1da1f2;
	background-repeat: no-repeat;
	background-image: none;
	box-shadow: none;
	font-size: 16px;
	font-weight: normal;
	padding: 12px 16px;
	border: 0;
	color: white;
}

#id, #nicname, #password1, #password2, #email, #tel {
	width: 372px;
	padding: 8px;
	font-size: 18px;
	margin: 9px;
}
</style>
<script>
	$(document).ready(
			function() {
				$("#button").click(
						function() {
							if ($("#id").val() == "") {
								$("#id").focus();
								$("#div").text("이름을 입력하세요");

							} else if ($("#nicname").val() == "") {
								$("#nicname").focus();
								$("#div").text("닉네임을 입력하세요");
							} else if ($("#password1").val() == "") {
								$("#password1").focus();
								$("#div").text("비밀번호를 입력하세요");
							} else if ($("#password2").val() == "") {
								$("#password2").focus();
								$("#div").text("비밀번호확인 입력하세요");
							} else if ($("#email").val() == "") {
								$("#email").focus();
								$("#div").text("이메일 입력하세요");
							} else if ($("#tel").val() == "") {
								$("#tel").focus();
								$("#div").text("전화번호 입력하세요");
							} else if ($("#id").val() != ""
									&& $("#nicname").val() != ""
									&& $("#password1").val() != ""
									&& $("#password2").val() != ""
									&& $("#email").val() != ""
									&& $("#tel").val() != "") {

								if ($("#password1").val() == $("#password2").val()) {
									$.get("registerAction", {
										"id" : $("#id").val(),
										"nicname" : $("#nicname").val(),
										"password" : $("#password1").val(),
										"email" : $("#email").val(),
										"tel" : $("#tel").val()
									}, function(data) {
										location.href = "main.jsp";
									});
								} else {
									$("#div").text("비밀번호가 맞지 않습니다.")
									$("#password2").val("");
									$("#password2").focus();
								}
							}
						});
				$("#idsearchbtn").click(function(){
					if ($("#id").val() != "") {
						$.get("idsearch", {
							"id" : $("#id").val()
						}, function(data) {
							if(data==1){
							$("#div").text("중복된 아이디");
							$("#id").val("");
							$("#id").focus();
							}
						 else {
							$("#div").text("사용가능한 아이디");
							if($("#nicname").val()==""){
								$("#nicname").focus();
							}  else if ($("#password1").val() == "") {
								$("#password1").focus();
								$("#div").text("비밀번호를 입력하세요");
							} else if ($("#password2").val() == "") {
								$("#password2").focus();
								$("#div").text("비밀번호확인 입력하세요");
							} else if ($("#email").val() == "") {
								$("#email").focus();
								$("#div").text("이메일 입력하세요");
							} else if ($("#tel").val() == "") {
								$("#tel").focus();
								$("#div").text("전화번호 입력하세요");
							}
							}
						}); 
					}
				});
			});
</script>
<title>Insert title here</title>
</head>
<body>
	<br><br><br><br><br><br><br>
	
	<table align="center">
		<tr align="center">
			<td>회 원 가 입</td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td><input type="text" placeholder="이름" name="id" id="id"><td><input type="button" id="idsearchbtn" value="중복확인"></td></td>
		</tr>
		<tr>
			<td><input type="text" placeholder="닉네임" name="nicname"
				id="nicname"></td>
		</tr>
		<tr>
			<td><input type="password" id="password1" placeholder="비밀번호"
				name="password"></td>
		</tr>
		<tr>
			<td><input type="password" id="password2" placeholder="비밀번호확인"></td>
		</tr>
		<tr>
			<td><input type="email" placeholder="이메일을 입력해주세요" name="email"
				id="email"></td>
		</tr>
		<tr>
			<td><input type="text" placeholder="전화번호를 입력해주세요" name="tel"
				id="tel"></td>
		</tr>
		<tr>
			<td>&nbsp;<input type="button" id="button" value="회원가입"></td>
		</tr>
		<tr align="center">
			<td><div id="div"></div></td>
		</tr>
</body>
</table>
</html>