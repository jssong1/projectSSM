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
					alert("<%=alertt%>");
				}
				if("<%=sessionID%>".length > 0 && "<%=sessionID%>" != "" ){
					$("#table1").hide();
					$("#table2").show();
				}else{
					$("#table2").hide();
					$("#table1").show();
				}
				$("#insert").click(function(){
					$("#m_form")
					.attr("action","/smember/checkForm.ssm")
					.submit();
				});
				$("#login").click(function(){
					if($("input[id='ssAuthority']:checked").val() == null){
						Swal.fire("권한을 선택해주세요.");
					}else{
						Swal.fire("login");
						$("#m_form").attr("action","/smember/loginCheck.ssm").submit();
					}
				});
				
				$("#logout").click(function(){
					$("#form").attr("action","/smember/logout.ssm").submit();
				});
				
				$("#basicInformation").click(function(){
					$("form").attr("action","/smember/basicInformation.ssm").submit();
				});
			});
			
			
		</script>
	</head>
	<body>
		<form id="m_form" name="m_form" method="post">
			<div id="table1">
				<table border="1" align="center">
					<tr>
						<td colspan="2">
							<input type="radio" name="ssAuthority" id="ssAuthority" value="S">학생
							<input type="radio" name="ssAuthority" id="ssAuthority" value="T">선생님
							<input type="radio" name="ssAuthority" id="ssAuthority" value="T">관리자
						</td>
					</tr>
					<tr>
						<th>ID : </th><td><input type="text" id="ssId" name="ssId" placeholder="ID"></td>
					</tr>
					<tr>
						<th>PW : </th><td><input type="text" id="ssPw" name="ssPw" placeholder="Password"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" name="login" id="login" value="로그인">
							<input type="button" name="insert" id="insert" value="회원가입">
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
							<input type="button" id="basicInformation" name="basicInformation" value="기초조사테이블">
							<input type="button" value="버튼버튼">
							<input type="button" id="logout" name="logout" value="로그아웃">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>