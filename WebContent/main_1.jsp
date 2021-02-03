<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ssm.mi.vo.*"%>
<%@ page import="ssm.common.utils.UserSession"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>ssm project</title>
		<link rel="stylesheet" href="./common/ssmCss/ssmMain.css">
		<link rel="stylesheet" href="./common/ssmCss/default.css">
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="/include/js/sweetalert2.all.min.js"></script>
		
	</head>
	<body>
		<div id="wrap">
			<!-- 헤더 -->
			<%@include file="/common/ssmMain/header_.jsp"%>
			
			<!-- 본문 -->
			<!-- 화면 오른쪽/ 로그인 박스, 학교공지 -->
			<section>
				<div class="subWrap_1">
					<div id="loginBox">
						<% 
							if (!mySession) {
						%>
						<!-- 로그인폼 -->
						<form id="loginForm" name="loginForm" method="POST" autocomplete="off">
							<!-- 권한선택 -->
							<ul class="list">
								<li>
									<img class="imgBtn" value="A"><img src="/mainImg/a.png" alt="관리자"> 
									<input type="radio" id="userA" name="userAuthority" value="A" /> 
									<span class="wrapRadio"> <label for="user01">관리자</label></span>
								</li>
								<li>
									<img class="imgBtn" value="T"> <img src="/mainImg/t.png" alt="교직원"> 
									<input type="radio" id="userT" name="userAuthority" value="T" /> 
									<span class="wrapRadio"> 
									<label for="user02">교직원</label></span>
								</li>
								<li><img class="imgBtn" value="S"><img src="/mainImg/s.png" alt="학생"> 
									<input type="radio" id="userS" name="userAuthority" value="S" /> 
									<span class="wrapRadio"><label for="user03">학생</label></span>
								</li>
							</ul>
							<!-- 아이디,비번 입력 -->
							<input type="text" id="loginId" name="userId" placeholder="ID" /><br>
							<input type="password" id="loginPw" name="userPw"placeholder="PASSWORD" /><br> 
							<!-- 로그인, 회원가입 이동 -->
							<a id="loginBtn" href="javascript:goLogin()">로그인</a><br>
							<a href="javascript:goJoin()">회원가입</a>
						</form>
						<%
							} else if (mySession) {
						%>
						<!-- 로그인된 유저박스 -->
						<div id="userBox">
							<form id="userForm">
								<p>
									안녕하세요!
									<%=SessionName%>님!
								</p>
								<br>
								<%
									if (sessionAU.equals("1")) {
								%>
								<div id="userImg">
									<img src="/file/G1.gif" alt="사용자">
								</div>
								<%
									}
								%>
								<%
									if (sessionAU.equals("2")) {
								%>
								<div id="userImg">
									<img src="/file/T1.png" alt="사용자">
								</div>
								<%
									}
								%>
								<a class="afterLogin" href="/smember/basicInformation.ssm">[마이페이지]</a>
								<a class="afterLogin" href="javascript:goLogout()">[로그아웃]</a>
							</form>
						</div>
						<%
							}//end of else if (mySession)
						%>
					</div>					
					<!-- 학교공지 -->
					<div id="noticeBox">
						<form id="gonbBoardDetailForm">
							<input type="hidden" id="nbNo" name="nbNo">
						</form>
						<h2>
							<a href="/noticeboard/nblist.ssm">학교공지</a>
						</h2>
						<hr>
						<div class="wrapTit">
							<ul class="linkList" id="noticeList">
							</ul>
						</div>
					</div>
				</div>
				
				<!-- 화면 중앙 메인이미지/ 하단 외부 링크 -->
				<div class="subWrap_2">
					<div id="mainImg">
						<ul class="mainImgList">
							<li><img src="/mainImg/bitHighMain.png" alt="메인이미지"></li>
						</ul>
					</div>
					<nav>
						<div class="navWrap">
							<ul class="etcList">
								<li><a href="https://www.ggoomgil.go.kr" target=_blank><img src="/mainImg/link1.png"></a></li>
								<li><a href="https://www.bitcamp.co.kr" target=_blank><img src="/mainImg/link2.jpeg"></a></li>
								<li><a href="http://webzine-serii.re.kr/" target=_blank><img src="/mainImg/link4.png"></a></li>
								<li><a href="https://www.youtube.com/watch?v=7YS8w2TMZBs&t=15s" target=_blank>
									<img src="/mainImg/pengpeng.png"></a></li>
							</ul>
						</div>
					</nav>
				</div>
				
				<!-- 화면 오른쪽/ 비교과활동, 영상, 링크 -->
				<div class="subWrap_3">
					<div id="nonSubject">
						<form id="gonpBoardDetailForm">
							<input type="hidden" id="npNo" name="npNo">
						</form>
						<h2>
							<a href="/nonprogram/np_Main.ssm">비교과활동</a>
						</h2>
						<hr>
						<div class="wrapTit">
							<ul class="linkList" id="programList"> </ul>
						</div>
					</div>
					<div id="schoolLink">
						<a id="exLink" href="#" style="background: url('/mainImg/link11.png')"></a>
						<a id="school" href="http://bitcamp.co.kr/index.php?main_page=home" target=_blank style="background: url('/mainImg/link22.png')"></a>
						<div id="goVideo">
							<video controls> <source id="videoView" type="video/mp4" src="/video/반려동물관리사.mp4"/></video>
						</div>
					</div>
				</div>
			</section>
			
			<!-- 화면 하단 -->
			<footer>
			<div class="footerTxt">
				<hr />
				<p>
					해당 시스템은 IE10, 크롬에 최적화되어있습니다.<br>2019-2020Java142:ProjectSSM
				</p>
			</div>
			</footer>
		</div>
		<script>
			includeHTML();
		</script>
	</body>
</html>