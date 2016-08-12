<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="style.css">
<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
<script>
var pagethird = 1;
var pagefourth = 10;

 $(document).ready(function(){
	Listkk();
	
	$(document).on("mousewheel scroll", function(){
		if($(window).height()+$(window).scrollTop() >= $(document).height()){
			Listkk();
		}

	});
	

	
});
 


function resize(img){
	if(img.width >= $(".bbsright").width()){
		img.width = $(".bbsright").width();
	}
}
	


 function Listkk(){

	 $.get("retwiteditAction",{"number1":$("#number1").val(),"pagefirst" : pagethird , "pagelast" : pagefourth },function(data){
			$("#retwitdiv").append(data);
			pagethird += 10;
			pagefourth += 10;
		});
 }
 
 function Listkk2(){

	 $.get("retwiteditAction",{"number1":$("#number1").val(),"pagefirst" : pagethird , "pagelast" : pagefourth },function(data){
			$("#retwitdiv").html(data);
			pagethird += 10;
			pagefourth += 10;
		});
 }
 
 function reply(){
	var formdata = new FormData(document.getElementById('frm'));
/* 	formdata.append("clicknum", $("#clicknum").val());
	formdata.append("addcontent" , $("#addcontent").val());
	formdata.append("addbbsid" , $("#addbbsid").val());
	formdata.append("filename1" , $("#filename1").val());
	formdata.append("filename2" , $("#filename2").val()); */
		   		$.ajax({
		   			method : "POST",
		   			url : "detailaddbbsAction",
		   			data : formdata,
		   			processData: false,
		   	     	contentType: false,
		   			success : function(data){
				    	pagethird = 1;
				    	pagefourth = 10;
				   		Listkk2();
		   			}
		   		});

	
 }
</script>
<html>
	<input type="hidden" value="${lists.num }" id="number1">
    <div class="stylecenter"  align="center">
		<div class="stylebbs1">
			<div class="styleshell"  >
				<div class="bbsleft">
					<img src="${lists2.picture }" class="imgstyle">
				</div>
				<div class="bbsright" align="left" id="right">
					<a href="friend.jsp?id=${lists.id }" style="text-decoration: none"><font size="4"><strong>${lists.nicname }</strong></font></a> ${lists.id } ${lists.time }<br>
					${lists.content }<br>
					<c:if test="${lists.picture1!='(null)' }">
						<img src="${lists.picture1 }" class="picclass" onload="resize(this)">
						<img src="${lists.picture2 }" class="picclass" onload="resize(this)">
					</c:if>
				</div>

			</div>
			<div class="forspace">
			
			</div>
			<c:if test="${login!=null }">
 					<form action="detailaddbbsAction" id="frm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="clicknum" value="${lists.num }">
						<div class="styleshell" align="center" >
							<br>
							<textarea rows="3" cols="80" id="addcontent" name="addcontent" ></textarea>
							<input type="hidden" name="addbbsid" value="${login }"> <br>
							<input type="file" name="filename1">
							<input type="file" name="filename2">
							<input type="button" id="addsave" name="addsave" value="저장" onclick="reply()">
						</div>
					</form><br>
						
						
					
<%-- 						<input type="hidden" name="clicknum" id="clicknum" value="${lists.num }">
						<div class="styleshell" align="center" >
							<br>
							<textarea rows="3" cols="80" id="addcontent" name="addcontent" ></textarea>
							<input type="hidden" name="addbbsid" id="addbbsid" value="${login }"> <br>
							<input type="file" name="filename1" id="filename1">
							<input type="file" name="filename2" id="filename2">
							<input type="button" id="addsave" name="addsave" value="저장" onclick="reply()">
						</div> --%>
					
			</c:if>
			<div class="stylebbs1" id="retwitdiv">

			</div>
		</div>
	</div>
  
 </html>



