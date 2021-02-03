<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUR-KR">
	<title>온라인 상담신청</title>
	<script src="/include/js/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<link rel="stylesheet" href="/common/ssmCss/oaBoardList.css">
	
	<link rel="stylesheet" href="/common/ssmCss/s_base.css">
	<link rel="stylesheet" href="/common/ssmCss/s_content.css">
	<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
	
	<script type="text/javascript" src="/navereditor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
	<script src="/common/ssmJs/index.js"></script>
	
	<script>
		function oaListBtn() {
			location.href = "/onlineApplication/oaBoardList.ssm";
		} // function()
	
		function oaInsertBtn() {
			if($("input[name='ttNo']:checked").val()==null){
				 alert("상담사를 선택하시오");
				 return;
			 }else if ($("input[name='oaField']:checked").val()==null){
				 alert("상담분야를 선택하시오");
				 return;
			 }else if(confirm("상담글을 등록하시겠습니까?")) {
				$("#oaInsertForm").attr("action",
						"/onlineApplication/oaBoardInsert.ssm").submit();
			} // if
		} // function()
	</script>
</head>

<body>
	<div id="wrap">
		<%@include file="/common/ssmMain/header_.jsp"%>

		<div class="subWrap">
			<nav include-html="/common/ssmMain/ssmCategory/cgSsideNav.jsp"></nav>
			<section>
			<div id="tit">
					<h1>온라인 상담 신청</h1>
					<p><a href="/main_1.jsp">홈</a> > <a href="#메인주소">상담/검사</a> > <a
						href="#주소걸기" class="on">상담 신청</a>
				</p>
			</div>
			<div class="container">
			<div id="content">
			
			<br> <br>
			
			<!-- 글양식 -->
			<div id="oaInsert">
				<form id="oaInsertForm" name="oaInsertForm" method="POST"
					enctype="multipart/form-data" autocomplete="off">
					<table cellpadding="0" cellspacing="0" border="0" class="view_box" style="margin:auto;">
						<colgroup>
							<col width="18%" />
							<col width="35%" />
							<col width="18%" />
							<col width="35%" />
						</colgroup>
						<tr>
							<th>상담사</th>
							<td><input type="radio" name="ttNo" value="담임교사" />담임교사 
								<input type="radio" name="ttNo" value="상담교사" />상담교사</td>
							<th>상담분야</th>
							<td id="oaField">
								<input type="radio" name="oaField" value="CAC" />진로   
								<input type="radio" name="oaField" value="LIC" />생활   
								<input type="radio" name="oaField" value="LEC" />학습  
							</td>
						</tr>
						<tr>
							<th >제목</th>
							<td colspan="3"><input class="input" type="text" id="oaTitle"
								name="oaTitle"  style="width:70%; float:left; margin:0 0 0 8px"/></td>
						</tr>
						<tr>
							<th>상담내용</th>
							<td colspan="3"><textarea id="oaContents" name="oaContents" cols="50" 
									rows="10" style="width:95%; height:150px;"></textarea></td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td colspan="3"><input type="file" id="oaFile" name="oaFile" title="첨부파일찾기"></td>
						</tr>
					</table>
				</form>
				<!--버튼-->
				<div class="board_btn">
					<div style="float:right;">
						<a href="#" onclick="oaInsertBtn()" style="">
							<span>저장/등록</span>
						</a>
						<a href="/onlineApplication/oaBoardList.ssm">
							<span class="back">목록</span>
						</a>
						
					</div>
				</div>
				<!--버튼-->				
				
				<div class="clear_div"></div>
			
			</div>
			<!-- // div_oaInsert -->
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