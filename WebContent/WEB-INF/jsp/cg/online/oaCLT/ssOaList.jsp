<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "ssm.cg.vo.OnlineApplication_BoardVO" %>
<%@ page import = "ssm.mi.vo.TMemberVO"%>
<%@ page import = "ssm.mi.vo.SMemberVO"%>
<%
		Object obj = request.getAttribute("ssOaList");
		ArrayList<OnlineApplication_BoardVO> aList = (ArrayList<OnlineApplication_BoardVO>) obj;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>온라인상담 관리</title>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" href="/common/ssmCss/default.css">
		<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
				
		<link rel="stylesheet" href="/common/ssmCss/s_base.css">
		<link rel="stylesheet" href="/common/ssmCss/s_content.css">
		<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
		<script src="/common/ssmJs/index.js"></script>
			<script>
			$(document).ready(function(){
				
				/* 제목 클릭 시 상세페이지로 이동*/
				$(".goDetail").click(function(){
					var oaNo = $(this).parents("tr").attr("dataNo");
					$("#oaNo") .val(oaNo);
					$("#ssOaList").attr({
						"method":"get",
						"action":"/onlineApplication/oaDetailForm.ssm"
					});
					$("#ssOaList").submit();
				});
			}); // ready()
			</script>
			<style>
			 #hr_ {
			 	margin : 10px 0;
			 }
			</style>
		</head>
	<body>
	<div id="wrap">
		<%@include file="/common/ssmMain/header_.jsp"%>
		<div class="subWrap">
			<!-- 네비게이션바 -->
			<nav include-html="/common/ssmMain/ssmCategory/cgTsideNav.jsp"></nav>
			
			<section>
			<div id="tit">
				<h1>온라인 상담신청 관리</h1>
				<p>
					<a href="#">홈</a> > <a href="co01.asp">신청/내역</a> > <a
						href="co03.asp" class="on">온라인상담</a>
				</p>
			</div>
			<div class="container">
			<div id="content">
				<br> <br>

		<form name="ssOaList" id="ssOaList" 
		method ="POST"
		enctype="application/x-www-form-urlencoded">
		<input type="hidden" id="oaNo" name="oaNo"/>
		<input type="hidden" id="ssNo" name="ssNo"/>
		<h1>[<%=aList.get(0).getSmemberVO().getSsName()%> 학생의 예약목록]</h1>
<%			boolean b = aList == null;
			if (b){
	
	%>	
				<table border="1">
					<tr>
						<td>NO DATA</td>
					</tr>
				</table>			
				<% 		
					}else{
				%>
				<div id="ssOaList">
			<table cellpadding="0" cellspacing="0" border="0" class="list_box mt_10" >
								
				<h3> 답변대기 목록</h3>
					<colgroup>
						<col width="8%">
						<col width="7%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th><a href="javascript:setOrder('oaNo');">신청번호
							</a></th>
							<th>답변상태</th>
							<th>상담분야</th>
							<th>제목</th>
							<th>작성자</th>
							<th>신청일</th>
						</tr>
					</thead>
					<tbody>
				
<% 					for(int i =0; i<aList.size(); i++){  
							OnlineApplication_BoardVO oaVo = aList.get(i);
							if(oaVo.getOaStatus().equals("대기")){
%>
					
						<tr align="center" dataNo = <%=oaVo.getOaNo() %>>
							<td><%=oaVo.getOaNo()%></td>
							<td>답변<%=oaVo.getOaStatus() %></td>
							<td><%=oaVo.getOaField() %></td>
							<td class="goDetail"><%=oaVo.getOaTitle()%></td>
							<td><%=oaVo.getSmemberVO().getSsName() %></td>
							<td><%=oaVo.getOaInsertdate() %></td>
						</tr>
					
								
<%							}//if끝
						} //for끝
%>					</tbody>
				</table>
				<hr id="hr_">
				<table cellpadding="0" cellspacing="0" border="0" class="list_box mt_10" >
					<h3>답변완료 목록</h3>
					<colgroup>
						<col width="8%">
						<col width="7%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th><a href="javascript:setOrder('oaNo');">신청번호
							</a></th>
							<th>답변상태</th>
							<th>상담분야</th>
							<th>제목</th>
							<th>작성자</th>
							<th>신청일</th>
						</tr>
					</thead>
					<tbody>


<%						
					for(int i =0; i<aList.size(); i++){  
							OnlineApplication_BoardVO oaVo = aList.get(i);
							if(oaVo.getOaStatus().equals("완료")){
						%>
						
						<tr align="center" dataNo = <%=oaVo.getOaNo() %>>
							<td><%=oaVo.getOaNo()%></td>
							<td>답변<%=oaVo.getOaStatus() %></td>
							<td><%=oaVo.getOaField() %></td>
							<td class="goDetail"><%=oaVo.getOaTitle()%></td>
							<td><%=oaVo.getSmemberVO().getSsName() %></td>
							<td><%=oaVo.getOaInsertdate() %></td>
						</tr>
						
							
						<%	}//if끝
						} //for끝	
					} //aList.size if 끝
%>					
					</tbody>
				</table>		
			</div>			
		</form>

</div>
			</div>
			</section>
		</div>
	<footer include-html="/common/ssmMain/footer.html"></footer> 
	</div>
	<script>
		includeHTML();
	</script>
	</body>
</html>