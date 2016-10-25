<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>


<html>
<head>
<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
<link type="text/css" rel="stylesheet" href="style.css">
<style>
	body{
		clear:both;
		margin:0;
	}

</style>
<script>
$(document).ready(function(){

	getList($("#loginid").val());
	sogae($("#loginid").val());
	
	$.post("takepicAction",
			{ "id": $("#loginid").val()},
			function(data){
				$("#idpicture").attr("src", data);
			}
			
	)
	
	
	$(document).on("mousewheel scroll", function(){
		if($(window).height()+$(window).scrollTop() >= $(document).height()){
			getList($("#loginid").val());
		}

	});
	
	$("#searchbtn1").click(function(){
		
		searchmethod();
	});
	
	$("#fsearchbtn").click(function(){
		friendsearch();
	});
	
/* 	$("#sogae").click(function(){
		$.get("sogahaza.jsp",{"test":"test"}, function(data){
			
			$("#sogae").html(data);	
		});
		
	}); */

	
	$("#login").click(function(){
		loginmethod();
			
		
	});
	
});
function sogae(loginid){
	$.post("sogaeAction", 
			{"id" : loginid},
			function(data){
			$("#sogae").html(data);
	});
}

var pagefirst = 1
var pagelast = 10
function getList(id){
	$.post("ownerlistAction", 
			{"pagefirst" : pagefirst , "pagelast" : pagelast, "id" : id},
			function(data){
			$("#area").append(data);
			pagefirst += 10;
			pagelast += 10;
			
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

function friendsearch(){
	var lp = (screen.width-300)/2;
	var tp = (screen.height-300)/2;
	window.open("win.jsp?friendid="+$("#friendid").val()+"&myid="+$("#myid").val(),"","width=300,height=300,left="+lp+",top="+tp+",toolbar=no,menubar=no,location=no,scrollbars=yes"  );
	window.focus();
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">



</style>
</head>
<body>
<div id="all" ></div>
<%@ include file="toppart.jsp"%>	

<div  class="styleleft">  
	<br>
	<img src="dd.png" width="100" height="120" id="idpicture"><br>
	${login }<br>
	

	
	<div id="sogae">소개글 </div>
	
	<div id="result"></div>
	<br>

</div>


<input type="hidden" name="loginid" id="loginid" value="${login }">
<div>
	<form action="addbbsAction" method="post" enctype="multipart/form-data">
		
		<div class="stylecenter" align="center" >
			<br>
			<textarea rows="3" cols="80" id="addcontent" name="addcontent" ></textarea>
			<input type="hidden" name="addbbsid" value="${login }"> <br>
			<input type="file" name="filename1" >
			<input type="file" name="filename2">
			<input type="submit" id="addsave" name="addsave" value="저장">
		</div>
	</form><br>
	<div class="stylecenter"  align="center">

		<div class="stylebbs1" id="area">
		게시글
		</div>
<!-- 		<div class="stylebbs2">
			<input class="stylebtn" type="button" value="더보기"  onclick="getList('${login }')">
		</div> -->
	</div>

</div>

</body>
</html>