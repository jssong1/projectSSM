<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

	Object pgObj = request.getAttribute("page");
	Object pgSizeObj = request.getAttribute("pageSize");
	Object totalObj = request.getAttribute("total");
	
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<script src="/include/js/jquery-1.11.3.min.js"></script>
	<script>
	</script>
	<style>
		a {
			text-decoration : none;
			text-align : center;
		}
		#paging {
		    width: 100%;
		    margin: 20px auto;
		}
		#paging ul{
			margin : 0 auto;
		}
		#paging li {
			float: left;
		}
	</style>
	<body>	
<%
		int pg = (int)pgObj;
		int pgSize = (int)pgSizeObj;
		int total = (int)totalObj;
		int listSize = 10;
		
		int currentFirst = ((pg - 1) / pgSize) * pgSize + 1;
		int currentLast = ((pg - 1) / pgSize) * pgSize + pgSize;
		int nextFirst = (((pg - 1) / pgSize) + 1) * pgSize + 1;
		int prevLast = (((pg - 1) / pgSize) - 1) * pgSize + 1;
		
		int lastPage = total/listSize;
		
		if(total%listSize != 0) lastPage = lastPage + 1;
		
		currentLast = (currentLast > lastPage) ? lastPage : currentLast;
%>
		<div id="paging">
			<ul><li>
<%	
	for(int i= 0; i < currentLast; i++){
%>
<%-- 			<a href="javascript:goPage(<%=i+1%>)"><%=i+1%></a> --%>
		<a href="javascript:goPage(<%=i+1%>)"><input type="button" id="pageNo2" value=<%=i+1%>></a>
<%
	}
%>
		</li></ul>
		</div>
	</body>
</html>