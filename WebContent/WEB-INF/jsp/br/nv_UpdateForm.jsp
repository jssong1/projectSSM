<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,ssm.br.vo.Non_VideoVO,ssm.common.utils.UserSession" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userAuthoriry = UserSession.getSessionAU(request);
	List list = null;
	list = (List)request.getAttribute("list");
	Non_VideoVO nvvo = (Non_VideoVO)list.get(0);


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
    <link rel="stylesheet" href="/common/ssmCss/default.css">
     <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<script src="/common/ssmJs/goCategory.js?ver=2"></script>
	<script src="/common/ssmJs/index.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#update").click(function(){
					$("#updateVideoForm").attr("action","/Non_Video/updateVideo.ssm").submit();
				});
					
				$("#back").click(function(){
					history.go(-1);
				});
			})
		</script>	
	</head>


	<body>
			<header include-html="/common/ssmMain/header_.jsp"></header>
	<%
	if(userAuthoriry.equals("1")){%>
		<nav include-html="/common/ssmMain/ssmCategory/brSideStudents.html"></nav>
		<%}else if(userAuthoriry.equals("2") || userAuthoriry.equals("3")){%>
			<nav include-html="/common/ssmMain/ssmCategory/brSideTeachers.html"></nav>
			<%
		}
	%>
		<form id="updateVideoForm" name="insertVideoForm" encType="multipart/form-data" method="POST">
			<table>
				<tr>
					<td>동영상 제목</td>
					<td><input type="text" id="nvTitle" name="nvTitle" value="<%=nvvo.getNvTitle()%>"></td>
				</tr>
				<tr>
					<td>동영상 업로드</td>
					<td>
					<input type="file" id="nvVideo" name="nvVideo">
					</td>
				</tr>
				<tr>
					<td>
					<input type="button" id="update" name="update" value="수정하기">
					 <input type="button" id="back" name="back" value="뒤로가기">
					</td>
				</tr>
			</table>
			<input type="hidden" id="nvNo" name="nvNo" value="<%=nvvo.getNvNo()%>">
		</form>
			<script type="text/javascript">
	includeHTML();
	</script>
		
	</body>
</html>