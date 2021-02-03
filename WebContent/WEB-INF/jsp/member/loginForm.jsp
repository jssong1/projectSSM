<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="ssm.common.utils.UserSession" %>
<% request.setCharacterEncoding("UTF-8"); 
	Object obj = request.getAttribute("alert");
	String alertt ="";
	if(obj != null){
		alertt = (String)obj;
	}
	String sessionID = UserSession.getSessionID(request);
	if(sessionID == null){
		sessionID = "";
	}
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>mainForm.jsp</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				if("<%=alertt%>".length > 0){
					Swal.fire("<%=alertt%>");
				}
				if("<%=sessionID%>".length > 0 && "<%=sessionID%>" != "" ){
					$("#table1").hide();
					$("#table2").show();
				}else{
					$("#table2").hide();
					$("#table1").show();
				}
				$("#join").click(function(){
					$("#loginform")
					.attr("action","/user/joinCheckForm.ssm")
					.submit();
				});
				$("#login").click(function(){
					if($("input[name='userAuthority']:checked").val() == null){
						Swal.fire("권한을 선택해주세요.");
					}else{
						Swal.fire("login");
						$("#loginform").attr("action","/user/loginCheck.ssm").submit();
					}
				});
				
				$("#logout").click(function(){
					$("form").attr("action","/user/logout.ssm").submit();
				});
			});
			
			
		</script>
	</head>
	<body>
		<form id="loginform" name="loginform" method="post">
			<div id="table1">
				<table border="1" align="center">
					<tr>
						<td colspan="2">
							<input type="radio" name="userAuthority" id="userAuthorityS" value="S">학생
							<input type="radio" name="userAuthority" id="userAuthorityT" value="T">선생님
							<input type="radio" name="userAuthority" id="userAuthorityA" value="A">관리자
						</td>
					</tr>
					<tr>
						<th>ID : </th><td><input type="text" id="userId" name="userId" placeholder="ID"></td>
					</tr>
					<tr>
						<th>PW : </th><td><input type="password" id=userPw name="userPw" placeholder="Password"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" name="login" id="login" value="로그인">
							<input type="button" name="join" id="join" value="회원가입">
						</td>
					</tr>
				</table>
			</div>
		</form>
		<form name="form" id="form" method="post">
			<div id="table2">
				<table border="1" align="center">
					<tr>
						<td><%=sessionID%>님</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="버튼버튼">
							<input type="button" value="버튼버튼">
							<input type="button" id="logout" name="logout" value="로그아웃">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>