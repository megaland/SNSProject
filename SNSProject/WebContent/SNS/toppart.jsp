<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<c:if test="${login==null }">
<input type="button" value="홈" id="" onclick="location.href='main.jsp?id=${login }'">
</c:if>
<c:if test="${login!=null }">
<input type="button" value="홈" id="" onclick="location.href='main.jsp'">
</c:if>


<input type="text" id="bak" onkeydown="enterdown2()"><input type="button" value="검색" id="searchbtn1" >

<c:if test="${login!=null }">
	<!-- 친구검색  -->
	<input type="button" value="친구찾기" id="fsearchbtn">
	<!--  친구검색 -->
</c:if>
<div class="stylelogin">
<c:if test="${login==null }">
	id : <input type="text" name="id" id="id">
	password : <input type="password" name="password" id="password" onkeydown="enterdown()">
	<input type="button" value="로그인" id="login" >
	<input type="button" value="회원가입" id="register" onclick="location.href='register.jsp'">
</c:if>
<c:if test="${login!=null }">
	${login }님 반갑습니다.
	<input type="button" value="로그아웃" id="loginout" onclick="location.href='logoutAction'">
	<input type="button" value="정보수정" onclick="location.href='SeleteRegisert?id=${login }'">
	<input type="button" value="마이홈" id="" onclick="location.href='ownerpage.jsp'">
	<input type="button" value="알림">
	<input type="hidden" id="myid" value="${login }">
</c:if>
</div>

<div class="styletop"  align="center"><img src="batang.png" width="100%" height = "100%"></div>