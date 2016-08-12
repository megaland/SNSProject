<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

		getList($("#searchword").val());

		$(document).on("mousewheel scroll", function(){
			if($(window).height()+$(window).scrollTop() >= $(document).height()){
				getList($("#searchword").val());
			}

		});
		
		$("#searchbtn1").click(function(){
			searchmethod();
		});
		
		$("#login").click(function(){
			loginmethod();
		});
		
		$("#fsearchbtn").click(function(){
			friendsearch();
		});
	});
	
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

function getList(str){
	
	$.post("lookingAction", 
			{"pagefirst" : pagefirst , "pagelast" : pagelast, "bak" : str},
			function(data){
			$("#area").append(data);
			pagefirst += 10;
			pagelast += 10;
	});
}

function friendsearch(){
	var lp = (screen.width-300)/2;
	var tp = (screen.height-300)/2;
	window.open("win.jsp?friendid="+$("#friendid").val()+"&myid="+$("#myid").val(),"","width=300,height=300,left="+lp+",top="+tp+",toolbar=no,menubar=no,location=no,scrollbars=yes"  );
	window.focus();
}

</script>
</head>
<body>
<div id="all" ></div>
<%@ include file="toppart.jsp"%>
<input type="hidden" id="searchword" value="${param.bak }">

<div>
	<div class="styleleft"></div>
<%@ include file="centerpart.jsp" %>
</div>

</body>
</html>