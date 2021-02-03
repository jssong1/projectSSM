<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="ssm.common.utils.UserSession" %>
<%
	request.setCharacterEncoding("UTF-8");
	Object obj  = request.getAttribute("dataS");
	Object obj2 = request.getAttribute("dataT");
	String no = "";
	String na = "";
	String id = "";
	String au = "";
	String date = "";
	
	if(obj != null){
		SMemberVO svo = (SMemberVO)obj;
		no = svo.getSsNo();
		na = svo.getSsName();
		id = svo.getSsId();
		date = svo.getSsUpdatedate();
	}
	if(obj2 != null){
		TMemberVO tvo = (TMemberVO)obj;
		no = tvo.getTtNo();
		na = tvo.getTtName();
		id = tvo.getTtId();
		date = tvo.getTtUpdatedate();
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#m").click(function(){
					location.href = "/smember/mainForm.ssm";
				});
			});
		</script>
	</head>
	<body>
		<form action="">
			<table border="1" align="center">
				<tr>
					<th align="center" colspan="8">가입승인 대기중입니다.</th>
				</tr>
				<tr>
					<td>번호 : <%=no %></td>
					<td>이름 : <%=na %></td>
					<td>아이디 : <%=id %></td>
					<td>가입일 : <%=date %></td>
				</tr>
				<tr>
					<td align="center" colspan="8">
						<input type="button" id="m" name="m" value="메인으로">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>