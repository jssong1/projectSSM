<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cd.vo.TestVO" %>
<%
	TestVO cdvo=null;
	String ss = "";
	request.setCharacterEncoding("UTF-8");
	Object obj = request.getAttribute("resultUrl");
	if(obj!=null){
		cdvo = (TestVO)request.getAttribute("resultUrl");
		ss = cdvo.getCdUrl();
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>결과 화면</title>
			<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				if("<%=cdvo%>" != ""){
					if("${resultStr}".indexOf("실패")>-1){
						alert("실패");
						history.go(-1);
					}else{
						window.open("","pop","width=1000,height=1000");
						$("#def")
						.attr("action",'<%=ss%>')
						.attr("target","pop")
						.submit();
						location.href="/test/goMainPage.ssm";
						
						
					}
					
					
				}
				
				
			});

		</script>
	</head>
	<body>
		<form name="def" id="def" method='POST'>
			
		</form>
	</body>
</html>