<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
<script>
	function resize(img){
		if(img.width >= $(".bbsright").width()){
			img.width = $(".bbsright").width();
		}
	}

</script>
<link type="text/css" rel="stylesheet" href="style.css">



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
	<div class="bbsright" align="left" id="right">
		<a href="friend.jsp?id=${i.id }" style="text-decoration: none"><font size="4"><strong>${i.nicname }</strong></font></a> ${i.id } ${i.time }<br>
		${i.content }<br>
		<c:if test="${i.picture1!='(null)' }">
			<img src="${i.picture1 }" class="picclass" onload="resize(this)">
			<img src="${i.picture2 }" class="picclass" onload="resize(this)">
		</c:if>
		
	</div>
	<div class="forspace">
	
	</div>
</div>
</c:forEach>
