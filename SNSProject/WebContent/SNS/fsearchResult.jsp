<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script>


function addfriend(myid, friendid){
	$.post("followAction",
				{"myid": myid , "friendid": friendid},
		function(data){
			close();
		}
	);
}
</script>
<table>
<c:forEach var="flist" items="${flist }">
<tr><td>${flist.id }</td><td>${flist.nicname }</td><td><input type="button" value="친추추가" id="fbtn" onclick="addfriend('${login }', '${flist.id }')"></td></tr>
</c:forEach>

</table>