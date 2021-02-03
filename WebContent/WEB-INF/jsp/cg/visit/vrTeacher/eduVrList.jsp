<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "ssm.cg.vo.Edu_ScheduleVO" %>
<%@ page import = "ssm.cg.vo.VisitCounsel_EduRsvVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Object pageObj = request.getAttribute("page");
	Object dataObj = request.getAttribute("data");
	VisitCounsel_EduRsvVO data_vo = (VisitCounsel_EduRsvVO)dataObj;
	Object rsvObj = request.getAttribute("RsvList");
	ArrayList<Edu_ScheduleVO> rsvList = (ArrayList<Edu_ScheduleVO>)rsvObj;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUR-KR">
		<link rel="stylesheet" href="/common/ssmCss/default.css">
		<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
		<link rel="stylesheet" href="/common/ssmCss/s_base.css">
		<link rel="stylesheet" href="/common/ssmCss/s_content.css">
		<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
		<script src="/common/ssmJs/index.js"></script>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script src="/include/fullcalendar/moment.min.js"></script>
		<script>
			$(document).ready(function(){
				
				// 현재 날짜형식 설정
				var date = new Date();
				var today = moment(date).format('YYYY-MM-DD');

				
	<%--			// 주간일정표 여닫기
				$("#calBtn").click(function(){
					$("#calendar").show();
				});
				
				$("#calClose").click(function(){
					$("#calendar").hide();
				});
	--%>			
				// 예약/ 상담 진행 상태 변경
				$("select").change(function(){
					var vrNo = $(this).parents("tr").attr("vrNo");
					$("#vrNo").val(vrNo);
					var vrStatus = $(this).val();
					var vrDate = $(this).parents("tr").children().eq(2).html();
					var vrTime = $(this).parents("tr").children().eq(3).html();
					var ssName = $(this).parents("tr").children().eq(4).html();
				
					// 상담일이 오늘 날짜보다 미래일때 완료 수정 불가
					if(vrStatus == "04"){
						if(vrDate > today){
							alert("상담일 이전입니다. 상담을 완료 후에 변경하세요.");
							return;
						}
					}
					
					// 상태 수정 ajax
					$.ajax({
						url : '/eduSchedule/vrStatusUpdate.ssm',
						type : 'POST',
						headers : {
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						dataType : "text",
						data : JSON.stringify({
							vrNo : vrNo,
							vrTime : vrTime,
							vrDate : vrDate,
							vrStatus : vrStatus
						}),
						success : function(result){
							if(result=="SUCCESS"){
								alert("상태 변경 완료");
									window.location.reload();
							} else {
								alert("변경안됨");
							}
						},
						error : function(){
							alert ("오류");
						}
					});
				});
				
				// 키워드 조회
				<%
				if(data_vo.getKeyword() != "" && data_vo.getKeyword() != null){
				%>
					$("#keword").val("<%=data_vo.getKeyword() %>");
				<%
				}
				%>
				
				$("#vrSearchBtn").click(function(){
					goPage(1);
				});
			}); // ready
			
			function goPage(page){
				$("#page").val(page);
				$("#pagingForm").attr({
					"method":"get",
					"aciton":"/eduSchedule/eduRsvList.ssm"
				});
				$("#pagingForm").submit();
			}
		</script>
		<style>
			#keyword input[type=radio]{
				margin : 0 10px;
			}
		</style>
		<title>방문상담 교사화면</title>
	</head>
	<body>
<div id="wrap">
		<%@include file="/common/ssmMain/header_.jsp"%>
		<div class="subWrap">

			<nav include-html="/common/ssmMain/ssmCategory/cgTsideNav.jsp"></nav>
			<section>
			<div id="tit">
				<h1>방문상담 예약관리</h1>
				<p>
					<a href="#">홈</a> > <a href="co01.asp">신청/내역</a> > <a
						href="co03.asp" class="on">방문상담</a>
				</p>
			</div>
			<div class="container">
				<div id="content">
					<div id="calendar">
						<jsp:include page="eduCalendar.jsp"></jsp:include>
						<p> <!--  <input type="button" id="calClose" value="달력접기"/>-->
						4주 간의 예약이 조회됩니다. <br>
					</div>
					<%@include file="rsvDetailModal.jsp"%>
					<div id="rsv">
						<!-- 상세페이지 이동 form -->
						<form id="goRsvDetail" name="rsvDetail">
							<input type="hidden" id="vrNo" name="vrNo" />
						</form>
						<!-- 페이징/ 검색 form -->
						<form id="pagingForm">
							<input type="hidden" id="page" name="page" value=<%=pageObj%>/>
							<div class="searchGuide">
							<table class="search_box_app mt_10" id="content01">
								<tr>
									<th>상담 분야</th>
									<td id="keyword">
										<input type="radio" name="keyword" value="진로상담" />진로상담
										<input type="radio" name="keyword" value="생활상담" />생활상담
										<input type="radio" name="keyword" value="학습상담" />학습상담
									</td>
									<td>
										<span class="bt_search" id="vrSearchBtn" name="vrSearchBtn">&nbsp;&nbsp;검색&nbsp;&nbsp;</span>
<!-- 										<input type="button"  class="q_btn" id="vrSearchBtn" name="vrSearchBtn" value="검색" /> -->
									</td>
								</tr>
						</table>
						</div>
						</form>
						<table  id="rsvTable" class="list_box" cellpadding="0" cellspacing="0" border="0"> 
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>예약번호</th>
									<th>예약등록일</th>
									<th>상담희망일</th>
									<th>상담희망시간</th>
									<th>상담학생명</th>
									<th>상담분야</th>
									<th>상담진행상태</th>
									<th>상담상태변경</th>
								</tr>
							</thead>
			<%
							if(rsvList != null){
								for(int i = 0; i < rsvList.size(); i++){
									Edu_ScheduleVO esvo = rsvList.get(i);
			%>
							<tbody>
								<tr vrNo=<%=esvo.getVrNo() %> >
									<td class="goDetail"><%=esvo.getVrNo()%></td>
									<td class="goDetail"><%=esvo.getVrInsertdate()%></td>
									<td class="goDetail"><%=esvo.getVrDate()%></td>
									<td class="goDetail"><%=esvo.getVrTime()%></td>
									<td class="goDetail"><%=esvo.getSsNo()%></td>
									<td class="goDetail"><%=esvo.getVrField()%></td>
									<td class="goDetail"><%=esvo.getCode()%></td>
									<td>
										<select id="vrStatus" name="vrStatus">
											<option value="01" <%if(esvo.getVrStatus().equals("01")){%>selected<%}%>>대기</option>
											<option value="02" <%if(esvo.getVrStatus().equals("02")){%>selected<%}%>>승인</option>
											<option value="03" <%if(esvo.getVrStatus().equals("03")){%>selected<%}%>>반려</option>
											<option value="04" <%if(esvo.getVrStatus().equals("04")){%>selected<%}%>>완료</option>
										</select>
									</td>
								</tr>
			<%
							}
						} else {
			%>
						<tr><td colspan="7" align="center">예약이 없습니다.</td></tr>
			<%				
						}
			%>
							</tbody>
						</table>
						<!--  <input type="button" id="calBtn" value="달력펼치기" />-->
						<%@include file="paging.jsp" %>
					</div>
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