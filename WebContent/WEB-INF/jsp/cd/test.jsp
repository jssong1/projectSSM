<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.12.4.min.js"></script>
		<style type="text/css">
					  #modal {
					    display: none; /* Hidden by default */
			            position: fixed; /* Stay in place */
			            z-index: 1; /* Sit on top */
			            left: 0;
			            top: 0;
			            width: 100%; /* Full width */
			            height: 100%; /* Full height */
			            overflow: auto; /* Enable scroll if needed */
			            background-color: rgb(0,0,0); /* Fallback color */
			            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
					}
					
					#modal h2 {
					  margin:0;   
					}
					
					#modal button {
					  display:inline-block;
					  width:100px;
					  margin-left:calc(100% - 100px - 10px);
					}
					
					#modal .modal_content {
					  width:700px;
					  margin:100px auto;
					  padding:20px 10px;
					  background:#fff;
					  border:2px solid #666;
					}
					
					#modal .modal_layer {
					  position:fixed;
					  top:0;
					  left:0;
					  width:100%;
					  height:100%;
					  background:rgba(0, 0, 0, 0.5);
					  z-index:-1;
					}   
		</style>
		
	<script>
 // 모달창 아이디 지정
 	$(function(){
 		$("#ss").hide();
 		$("#modal_open_btn").click(function() {
 			alert("꾸");
 			$("#idid").append("잉");
 		    $("#modal").fadeIn(300); // 모달창 보여주기
 		});
 		  
 		// 모달 창 안에 있는 확인 버튼에 이벤트 걸기
 		$("#modal_closd_btn").click(function() {
 			alert("꾸");
 			 $("#modal").fadeOut(300); // 모달창 보여주기
 		});	
 	});
	
	
		</script>
	</head>
	<body>
		
	<!-- 모달창 여는 버튼 -->
	<div>
	<input type="button" id="modal_open_btn" name="modal_open_btn"value="모달창">
	</div>
	
	
	<!--모달창임  -->
	
	<div id="modal">
		<div class="modal_content">
		<h2>모달창</h2>
		<table>
			<tr>
			<td>학번</td>
			<td id="idid"></td>
			<td>이름</td>
			<td value="">~~~</td>
			</tr>
			<tr>
			<td>연락처</td>
			<td>~~~</td>
			<td>이메일</td>
			<td>~~~</td>
			</tr>
			<tr>
				<td>프로그램명</td>
				<td>~~~</td>
			</tr>
			<tr>
			</tr>
		</table>
		<input type="button" id="modal_closd_btn" name="modal_closd_btn" value="모달창닫기" >
		</div>
	</div>

	<div class="modal_layer"></div>
	
	<div>
	
	<video width="400" controls>
  	<source src="/video/직업탐구-교육과.mp4" type="video/mp4"/>
 	</video>
	</div>
	
	<div id="ss">
	<table border=2>
		<tr>
		<td>zzzzzzzzz</td>
		</tr>
		<tr>
		<td>zzzzzzzzz</td>
		</tr>
		<tr>
		<td>zzzzzzzzz</td>
		</tr>
		<tr>
		<td>zzzzzzzzz</td>
		</tr>
	</table>
	</div>
	
	</body>
</html>