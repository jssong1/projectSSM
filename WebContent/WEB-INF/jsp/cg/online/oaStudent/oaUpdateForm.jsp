<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ssm.cg.vo.OnlineApplication_BoardVO" %>
<%@ page import = "ssm.cg.controller.OnlineApplication_BoardController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>update</title>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" href="/common/ssmCss/default.css">
		<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
		<script src="/common/ssmJs/index.js"></script>
		
		
		<link rel="stylesheet" href="/common/ssmCss/s_base.css">
		<link rel="stylesheet" href="/common/ssmCss/s_content.css">
		<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
		<script>
			function oaListBtn(){
				location.href = "/onlineApplication/oaBoardList.ssm";
			} // function()
			
			function oaUpdateBtn(){
				if(confirm("상담글을 수정하시겠습니까?")){
					$("#oaUpdateForm").attr("action","/onlineApplication/oaBoardUpdate.ssm")
					.submit();
				} // if
			} // function()
		</script>
	</head>

	<body>
	<div id="wrap">
		<header include-html="/common/ssmMain/header_.jsp"></header>
		<div class="subWrap">
			<!-- 네비게이션바 -->
			<nav include-html="/common/ssmMain/ssmCategory/cgSsideNav.jsp"></nav>
		
		
		<section>
			<!-- 상단타이틀 -->
			<div id="tit">
	            <h1>나의 온라인 상담</h1>
	            <p>
	               <a href="#">홈</a> > <a href="co01.asp">신청/내역</a> > <a
	                  href="co03.asp" class="on">온라인상담</a>
	            </p>
	        </div>
	        <!-- 컨테이너-->
			<div class="container"><div id="content">
			<div id="oaUpdate">
			<div class="comm_titmin mt_10"  id="oaTitle" style="margin:0 auto;">
				<span>온라인 상담신청 수정</span>
			</div>
			<div class="clear_div"></div>
				<form id="oaUpdateForm" name="oaUpdateForm">
					 <table cellpadding="0" cellspacing="0" border="0" style="margin:auto;" class="view_box mt_5" >
              		 <colgroup>
                        <col width="18%">
                        <col width="35%">
                        <col width="18%">
                        <col width="35%">
                     </colgroup>
					<%
						Object obj = request.getAttribute("oaUpdateList");
						OnlineApplication_BoardVO oaVo = (OnlineApplication_BoardVO)obj;	
						if(obj == null){
					%>
						<tr><td>선택된 글이 없습니다. 목록으로 돌아가세요.</td></tr>
					<%
						} else {
					%>
						<tr>
							<th>신청번호</th>
							<td colspan="3"><input type="text" id=oaNo" name="oaNo" value=<%=oaVo.getOaNo()%> readOnly/></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td colspan="3"><input type="text" id="ssNo" name="ssNo" value=<%=oaVo.getSmemberVO().getSsName() %> readOnly/></td>
						</tr>
						<tr>
							<th>상담분야</th>
							<td>
					<%
								String oaField = oaVo.getOaField();
					%>
								<input type="radio" name="oaField" value="CAC" <%if("CAC".equals(oaField)){%>checked<%}%> />진로
								<input type="radio" name="oaField" value="LIC" <%if("LIC".equals(oaField)){%>checked<%}%> />생활
								<input type="radio" name="oaField" value="LEC" <%if("LEC".equals(oaField)){%>checked<%}%> />학습
							</td>	
							<th>상담사</th>
							<td>
								<input type="text" id="ttNo" name="ttNo" value=<%=oaVo.getTmemberVO().getTtName() %> />
							</td>
						</tr>
						<tr>
							<th>상담제목</th>
							<td colspan="3"><input type="text" id="oaTitle" name="oaTitle" value=<%=oaVo.getOaTitle() %>></td>
						</tr>
						<tr>
							<th>상담내용</th>
							<td colspan="3"><textarea id="oaContents" name="oaContents" cols="50" rows="10"><%=oaVo.getOaContents() %></textarea></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3"><input type="file" id="oaFile" name="oaFile" /></td>
						</tr>	
					</table>
					<%
						}
					%>
				</form>
				<div id="btn">
					<input type="button" onclick="oaUpdateBtn()" value="수정" />
					<input type="button" onclick="oaListBtn()" value="목록" />
				</div>
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