<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ssm.common.utils.UserSession"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>header_</title>
		<script src="/common/ssmJs/goCategory.js" charset="utf-8"></script>
		<script src="/common/ssmJs/index.js" charset="utf-8"></script>
		<script src="/common/ssmJs/goBoard.js" charset="utf-8"></script>
		<script src="/common/ssmJs/goLogin.js" charset="utf-8"></script>
		<script src="/include/js/sweetalert2.all.min.js"></script>
	</head>
	<%
		String sessionAU = UserSession.getSessionAU(request);
		String sessionID = UserSession.getSessionID(request);
		String sessionNO = UserSession.getSessionNO(request);
		String SessionName = UserSession.getSessionName(request);
		if (sessionAU == null) {
			sessionAU = "";
		}
		String user = "";
		if (sessionAU.equals("1")) {
			user = "학생";
		}
		if (sessionAU.equals("2")) {
			user = "선생님";
		}
		//mySession 로그인 체크
		Boolean mySession = sessionAU != "";
	%>
	<body>
		<header> 
			<div id="bitHigh">
				<a href="/main_1.jsp"><img src="/mainImg/bitHigh2.png"></a>
			</div>
			<hr>
			<nav>
				<div class="wrapMenu">
					<ul class="menuList">
						<li><a href="javascript:goCareerDesign('<%=sessionAU%>')"
							style="font-family: 'S-CoreDream-8Heavy' !important;">진로설계</a></li>
						<li><a href="javascript:goCounseling('<%=sessionAU%>')"
							style="font-family: 'S-CoreDream-8Heavy' !important;">상담창구</a></li>
						<li><a href="javascript:goBigyogwaRecommend()"
							style="font-family: 'S-CoreDream-8Heavy' !important;">비교과추천</a></li>
						<li><a href="javascript:goEportfolio('<%=sessionAU%>','<%=user%>')"
							style="font-family: 'S-CoreDream-8Heavy' !important;">E-포트폴리오</a></li>
						<li><a href="javascript:goCommunity()"
							style="font-family: 'S-CoreDream-8Heavy' !important;">커뮤니티</a></li>
					</ul>
				</div>
			</nav>
			<hr>
		</header>
	</body>
</html>