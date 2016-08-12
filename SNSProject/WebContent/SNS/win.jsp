<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<style>
.ui-dialog-titlebar { display: none; }; 
</style>
<title class="ui-dialog-titlebar>abcd"></title>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src= "http://code.jquery.com/jquery-2.2.3.min.js"></script>

<script>
$(document).ready(function(){
	$("#btn").click(function(){
		fsearchAction();
		
/* 		$.get("followAction",
				{"friendid":$("#friendid").val(),
				 "myid":$("#myid").val()},
				function(data){
					$("#area").html(data);
					alert("친구추가되었습니다");
					close();
				}
			);	 */
	});
	

});
	function fsearchAction(){
		$.post("fsearchAction",
				{"fsearch" : $("#searchword").val()},
			function(data){
				$("#area").html(data);
			}	
		);
	}


	function enterdown3(){
		if(event.keyCode == 13 ){
			fsearchAction();
		}
	}
</script>
<input type="text" id="searchword" onkeydown="enterdown3()"><input type="button" id="btn" value="검색">
<input type="hidden" id="friendid" value="${param.friendid }">
<input type="hidden" id="myid" value="${param.myid }">
<div id="area"></div>

