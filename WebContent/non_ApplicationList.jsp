<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,ssm.br.vo.Non_ApplicationVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	Non_ApplicationVO navo = new Non_ApplicationVO();
	List list =null;
	Object obj = request.getAttribute("list");
	if(obj!=null){
		list = (List)obj;
	}
	String npNo= (String)request.getAttribute("npNo");



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){
					
			});
			function approval(naNo){
				alert("뀨");
				location.href="/non_Application/approval.ssm?naNo="+naNo;
			}
			function approvalCancel(naNo){
				alert("뀨");
				location.href="/non_Application/approvalCancel.ssm?naNo="+naNo;
				
			}
		</script>
	</head>
	<body>
		<form>
			<table border='1'>
				<tr>
					<td>학번</td>
					<td>이름</td>
					<td>이메일</td>
					<td>내용</td>
					<td>첨부파일</td>
					<td>비고</td>	
				</tr>
				
				<%if(list.size()!=0){
					for (int i=0;i<list.size();i++){
						navo=(Non_ApplicationVO)list.get(i);
					%>
				<tr>
					<td><%=navo.getSsNo() %></td>
					<td><%=navo.getSsName() %></td>
					<td><%=navo.getSsEmail() %></td>
					<td><%=navo.getNaContents() %></td>
					<td><%=navo.getNaFile() %></td>	
					<%	if(navo.getNaStatus()=="00"){ %>
					<td><input type="button" id="approval" name="approval" value="승인" onclick="approval('<%=navo.getNaNo()%>')"></td>
					<%}else{ %>
					<td>
					<input type="button" id="approvalCancel" name="approvalCancel" value="승인취소" onclick="approvalCancel('<%=navo.getNaNo()%>')">
					</td>
				</tr>
				
				<%	}
					}
				}else{
					
				%>
					<tr>
					<td colspan='5'>신청한 사람이 없습니다</td>
					</tr>
				<%
				}
				%>
			</table>
		</form>
	</body>
</html>