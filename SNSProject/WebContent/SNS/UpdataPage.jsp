<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script>
	function deleteid(id){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href = "deleteAction?id="+id;
		}else{
			return false;
		}
	
	}

</script>
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<br><br><br><br><br><br>
<form action="ChangeModifie" method="post" enctype="multipart/form-data">
	<input type= "hidden" name="id" value="${list.id }">
	<table align="center">
	<tr align="center"><td >내 계정 정보수정</td></tr>
	
	<tr><td>아이디 </td><td><div id="id" name="id">${list.id }</div></td></tr>
	<tr><td>닉네임 <td><input type="text" name="nicname" value="${list.nicname}" id="nicname"></td></td></tr>
	<tr><td>패스워드 <td><input type="text" name="password1" value="${list.password}" id="password1"></td></td></tr>
	<tr><td>패스워드 확인 <td><input type="text" name="password2" value="${list.password}" id="password2"></td></td></tr>
	<tr><td>이메일 <td><input type="text" name="email" value="${list.email}" id="email"></td></td></tr>
	<tr><td>가입날짜 <td>${list.registerdate}</td></td></tr>
	<tr><td>전화번호 <td><input type="text" name="tel" value="${list.tel}" id="tel"></td></td></tr>
	<tr><td>자기소개 <td><input type="text" name="introduce" value="${list.introduce}" id="introduce"></td></td></tr>
	<tr><td>사진파일 <td><input type="file" name="filename" value="${list.picture}" id="file"></td></td></tr>
	
	<tr>
		<td>
			<input type="submit"  value="수정완료">
			<input type="button"  value="삭제" onclick="deleteid('${list.id }')">
		</td>
	
	</tr>

	</table>
</form>
</body>
</html>