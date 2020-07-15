<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<button class="reBtn reBtnCencle" onclick="adminRecipeIns();" >등록</button>
<h1> 리스트  </h1>

<script>

function adminRecipeIns(){
	
	$.ajax({
		type: 'post',
		url: '/adminRecipeInsPage',
		contentType: "application/x-www-form-urlencoded;charset=UTF-8",
		dataType: "html",
		success: function(data){
			
			$('#adminContent').html(data);
			
		},
		error: function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
}

</script>


