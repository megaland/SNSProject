<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src= "http:/code.jquery.com/jquery-2.2.3.min.js"></script>
<script>
	var showflag=0;
	
	function resize(img){
		if(img.width >= $(".bbsright").width()){
			img.width = $(".bbsright").width();
		}
	}
	
	$(document).ready(function(){
		if(showflag==0){
			$("#hideshow").hide();
		}
		
		$("#all").click(function(){					
			$("#hideshow").hide();
			$("#all").css({"width":"0","height":"0"});
			$("body").css({"overflow":"auto"});
			
		});
		

	});
	
	function retwit(number){
	
		showflag=1;
		$("#hideshow").show();
		$.get("retwitAction?number1="+number,function(data){
			$("#twit_kk").html(data);
		});
		/* win=window.open("retwitAction?number1="+$("#number1").val(),width=100,height=300); */
		$("#all").css({"background":"rgba(0,0,0,0.8)","z-index":"2","width":"100%" ,"height":$(document).height(),"position":"absolute", "overflow" : "hidden"});
		$("body").css({"display":"block","z-index":"1", "overflow":"hidden"});
		$("#hideshow").css({"top" : $(window).scrollTop()+$(window).height()*1/4, "overflow":"auto", "height" : $(window).height()/2, "background-color": "white"});

	}
</script>
<div id=hideshow style="width:52%;position: absolute;top: 250px;left: 25%;z-index: 3; border-radius:5px; padding:10px; overflow:hidden;">
<div id=twit_kk></div>
</div>

<c:forEach var="i" items="${lists }">

<div class="styleshell"  >
	<div class="bbsleft">
		<img src=
		<c:forEach var="j" items="${lists2 }">
			<c:if test ="${i.id == j.id }">
				"${j.picture }"
			</c:if>
		</c:forEach>
		  class="imgstyle" onclick="location.href='friend.jsp?id=${i.id }'">
	</div>
	<div class="bbsright" align="left" id="right" onclick="retwit(${i.num })">
		<a href="friend.jsp?id=${i.id }" style="text-decoration: none"><font size="4"><strong>${i.nicname }</strong></font></a> ${i.id } ${i.time }<br>
		${i.content }<br>
		<c:if test="${i.picture1!='(null)' }">
			<img src="${i.picture1 }" class="picclass" onload="resize(this)">
			<img src="${i.picture2 }" class="picclass" onload="resize(this)">
		</c:if>
	</div>
</div>
<div class="forspace">

</div>

</c:forEach>
