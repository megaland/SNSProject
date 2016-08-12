<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" rel="stylesheet" href="style.css">

<script src= "http://code.jquery.com/jquery-2.2.3.min.js"></script>
<style>
	body{
		clear:both;
		margin:0;
	}

</style>
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		getList();
		sogae($("#searchid").val());
		$("#login").click(function(){
			loginmethod();
				
			
		});
		/*팔로우  */
		$("#btnfollow").click(function(){
			follow();
		});
		
		$.post("takepicAction",
				{ "id": $("#searchid").val()},
				function(data){
					$("#idpicture").attr("src", data);
				}
				
		)
		
		$(document).on("mousewheel scroll", function(){
			if($(window).height()+$(window).scrollTop() >= $(document).height()){
				getList();
			}

		});
		
		$("#searchbtn1").click(function(){
			
			searchmethod();
		});

		$("#fsearchbtn").click(function(){
			friendsearch();
		});
	});
	
	function sogae(loginid){
		$.post("sogaeAction", 
				{"id" : loginid},
				function(data){
				$("#sogae").html(data);
		});
	}
	
	function loginmethod(){
		$.post("loginAction",
				{"id": $("#id").val() ,"password" : $("#password").val()},
				function(data){
				if(data==1){
					location.href= "main.jsp";
				}else if(data==2 || data==0){
					alert("아이디/비밀번호가 틀렸습니다.");
					$("#password").val("");
					$("#password").focus();
				}
		});
	}
		
	function enterdown(){
		
		if(event.keyCode==13){
			loginmethod();
		}

	}
	
	function searchmethod(){
		if($("#bak").val()==""){
			alert("값을 입력하세요")		
		}else{		
			location.href="search.jsp?bak="+$("#bak").val();
		}
		
	}

	function enterdown2(){
		if(event.keyCode==13){
			searchmethod();
		}
	}
	
var pagefirst = 1
var pagelast = 10
function getList(){

	$.post("idListAction", 
			{"pagefirst" : pagefirst , "pagelast" : pagelast, "id" : $("#searchid").val()},
			function(data){
			$("#area").append(data);
			pagefirst += 10;
			pagelast += 10;
	});
}
/* 팔로우 */
function follow(){
	alert($("#myid").val() +":" + $("#searchid").val());
	$.get("followAction",
		{"myid":$("#myid").val(), "friendid":$("#searchid").val()},
		function(data){		
		}
	);
}

</script>

</head>
<body>
<div id="all" ></div>
<%@ include file="toppart.jsp"%>

<div class="styleleft">  
	<br>
	<img src="dd.png" width="100" height="120" id="idpicture"><br>
	${param.id }<br>
	

	
	<div id="sogae">소개글</div>
	<c:if test="${login!=null }"><input type="button" value="친구등록" id="btnfollow"></c:if>
	<div id="result"></div>
	<br>

</div>


<%@ include file="centerpart.jsp" %>

<input type ="hidden" id="searchid" value="${param.id }">

<input type="hidden" id="myid" value="${login }"><!-- 내아이디  -->

</body>
</html>