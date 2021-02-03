<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.common.utils.UserSession" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<%
	
	String sessionAU = UserSession.getSessionAU(request);
	String sessionID = UserSession.getSessionID(request);
	String sessionNO = UserSession.getSessionNO(request);
	if(sessionAU == null){
		sessionAU = "";
	}
	String you ="";
	if(sessionAU.equals("1")){
		you="학생";
	}
	if(sessionAU.equals("2")){
		you="선생님";
	}
%>
</head>

<body>
	<div class="wrapSide">
<!-- 					<div class="menuTit"><h2>상담창구</h2></div> -->
	<div id="sideLink">
		<div id="userImg">
			<img src="/file/G1.gif" alt="사용자">
		</div>
		<div id="goMypage">
			<ul class="userLink">	
				<li>
					<a href="/smember/basicInformation.ssm">마이페이지</a>
				</li>
				<li>
					<a href="/user/logout.ssm">로그아웃</a>
				</li>
			</ul>
		</div>
		<div id="sideDiv">
			<ul class="sideList">
				<li class="i"><a href="#">방문상담</a></li>
				<ul class="subList">
					<li><a href="/visitCounsel/vcSchedule.ssm">> 상담신청</a></li>	
					<li><a href="/visitCounsel/vcMineList.ssm">> 상담내역 및 관리</a></li>	
				</ul>	
				<li class="i"><a href="/onlineApplication/oaBoardList.ssm">온라인상담</a></li>
				<ul class="subList">
					<li><a href="/onlineApplication/oaInsertForm.ssm">> 상담신청</a></li>	
					<li><a href="/onlineApplication/oaBoardList.ssm">> 상담내역 및 관리</a></li>	
				</ul>			
			</ul>
		</div>
	</div>
</div>
</body>
</html>