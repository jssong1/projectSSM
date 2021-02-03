<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ssm.cg.vo.OnlineApplication_BoardVO"%>
<%@ page import="ssm.mi.vo.TMemberVO"%>
<%@ page import="ssm.mi.vo.SMemberVO"%>
<%
	request.setCharacterEncoding("UTF-8");
		Object dataObj = request.getAttribute("data");
		OnlineApplication_BoardVO oa_Vo = (OnlineApplication_BoardVO)dataObj;
		Object ssNo = request.getAttribute("ssNo");
		Object commentCnt = request.getAttribute("commentCnt");
		
		String SessionAU = UserSession.getSessionAU(request);
      	String SessionID = UserSession.getSessionID(request);
      	String SessionNO = UserSession.getSessionNO(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>온라인상담목록</title>
</head>
<link rel="stylesheet" href="/common/ssmCss/default.css">
<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
<link rel="stylesheet" href="/common/ssmCss/s_base.css">
<link rel="stylesheet" href="/common/ssmCss/s_content.css">
<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
<script src="/common/ssmJs/index.js"></script>
<script src="/include/js/jquery-1.11.3.min.js"></script>
<script>
		function oaInsertBtn(){
			location.href = "/onlineApplication/oaInsertForm.ssm";
		} 
		
		function oaListBtn(){
			location.href = "/onlineApplication/oaBoardList.ssm";
		}
		
		$(document).ready(function(){
			
			/* 검색 변경에 대해*/
			<%if(oa_Vo.getKeyword() != "" && oa_Vo.getKeyword() != null){%>
				$("#keyword").val("<%=oa_Vo.getKeyword()%>");
				$("#search").val("<%=oa_Vo.getSearch()%>");
			<%}%>
			
		/*검색버튼 클릭*/
		$("#oaSearchBtn").click(function() {
			goPage(1);
		});

		/*제목 클릭 시 상세페이지로 이동*/
		$(".goDetail").click(function() {
			var oaNo = $(this).parents("tr").attr("dataNo");
			console.log("(log)no : " + oaNo);
			$("#oaNo").val(oaNo);
			$("#goDetailForm").attr({
				"method" : "post",
				"action" : "/onlineApplication/oaDetailForm.ssm"
			});
			$("#goDetailForm").submit();
		});
	}); // ready()

	/* 정렬버튼 클릭*/
	function setOrder(orderBy) {
		$("#orderBy").val(orderBy);
		if ($("#orderSc").val() == 'DESC') {
			$("#orderSc").val('ASC');
			alert("최신글부터 조회합니다");
		} else {
			$("#orderSc").val('DESC');
			alert("오래된 글부터 조회합니다");
		}
		goPage(1);
	}

	/* 검색과 페이징에 대한 실질적 처리함수*/
	function goPage(page) {
		console.log("(log)goPage() >>>");
		$("#page").val(page);
		$("#oaSearchForm").attr({
			"method" : "get",
			"action" : "/onlineApplication/oaBoardList.ssm"
		});
		$("#oaSearchForm").submit();
	}
</script>
<style>
	.board_btn {
		text-align: end;
	}
</style>
<body>
	<div id="wrap">
		<%@include file="/common/ssmMain/header_.jsp"%>
		<div class="subWrap">
			<nav include-html="/common/ssmMain/ssmCategory/cgSsideNav.jsp"></nav>
			<section>
			<div id="tit">
				<h1>나의 온라인 상담 목록</h1>
				<p><a href="/chwc/index.asp">홈</a> > <a href="#메인주소">상담/검사</a> > <a
					href="#주소걸기" class="on">온라인상담</a>
				</p>
			</div>
			<div class="container">
			<div id="content">
				<div class="mt_10">
					<div class="detail_list">
						<ul>
							<li>* 상담결과 내용은 이메일로 확인 할 수 있습니다.</li>
							<li>상담 내용은 비공개 처리 됩니다.</li>
						</ul>
					</div>
				</div>

					<form id="oaSearchForm" name="oaSearchForm" action="">
						<input type="hidden" id="page" name="page"
							value=<%=oa_Vo.getPage()%> /> <input type="hidden" id="orderBy"
							name="orderBy" value=<%=oa_Vo.getOrderBy()%> /> <input
							type="hidden" id="orderSc" name="orderSc"
							value=<%=oa_Vo.getOrderSc()%> />
						<table class="search_box_app mt_20" id="content01">
							<colgroup>
								<col width="9%" />
								<col width="9%" />
								<col width="50%"/>
							</colgroup>
							<tr>
								<td>&nbsp;</td>
								<td>
									<select name="search" id="search" title="상담구분" class="select" >
											<option value="oaTitle">제목</option>
										<option value="oaField">상담분야</option>
									</select>
								</td>
								<td>
								<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" maxlength="50" class="input"  />
								<span class="bt">
								<span class="bt_search" id="oaSearchBtn" name="oaSearchBtn">&nbsp;&nbsp;검색&nbsp;&nbsp;</span></span></td>
							</tr>
						</table>
					</form>
					
					
					<!-- 본문리스트 -->
					<div id="oaBoardList"  >
						<table class="list_box" cellpadding="0" cellspacing="0" border="0"> 
										
							<colgroup>
								<col width="10%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="/%">
								<col width="8%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr >
									<th><a href="javascript:setOrder('oaNo');">신청번호</a></th>
									<th>상담교사</th>
									<th>답변상태</th>
									<th>상담분야</th>
									<th>제목</th>
									<th>작성자</th>
									<th>신청일</th>
								</tr>
							</thead>
							<%
								Object obj = request.getAttribute("oaBoardList");
																	ArrayList<OnlineApplication_BoardVO> aList = (ArrayList<OnlineApplication_BoardVO>)obj;
																	if(aList != null){
																		for(int i=0; i<aList.size(); i++){
																			OnlineApplication_BoardVO oaVo = aList.get(i);
							%>
							<tbody>
								<tr align="center" dataNo=<%=oaVo.getOaNo()%>>
									<td><%=oaVo.getOaNo()%></td>
									<td><%=oaVo.getTmemberVO().getTtName()%></td>
									<td>답변<%=oaVo.getOaStatus()%></td>
									<td><%=oaVo.getOaField()%></td>
									<td style="cursor: pointer;" class="content_left goDetail"><%=oaVo.getOaTitle()%></td>
									<td><%=oaVo.getSmemberVO().getSsName()%></td>
									<td><%=oaVo.getOaInsertdate()%></td>
								</tr>
							</tbody>

							<%
								} // for
																		} else {
							%>
							<tr>
								<td>NO DATA</td>
							</tr>
							<%
								} // if
							%>
						</table>
					</div>
					<div class="board_btn">
							<a href="/onlineApplication/oaInsertForm.ssm">
								<span>신청</span>
							</a>
						</div>
					<form id="goDetailForm" name="goDetailForm">
						<input type="hidden" id="ssNo" name="ssNo" value="<%=SessionID%>" />
						<input type="hidden" id="oaNo" name="oaNo" />
					</form>
					<!-- // div_container -->
					<div class="list" id="oaPaging">
						<%@include file="../visit/vrTeacher/paging.jsp"%>
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