<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "ssm.mi.vo.TMemberVO"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import= "ssm.common.utils.FilePath" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>tMemberN</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<%--<link href="/include/css/bulma.css" rel="stylesheet"/>
		<link href="/include/css/bulma.min.css" rel="stylesheet"/> --%>
		<script type="text/javascript">
		$(document).ready(function(){				
			$("#index").click(function(){
				alert("INDEX로 >>>");
				location.href="/default.jsp";
			});
			$("#I").click(function(){
				alert("교사등록고고고 >>>");
				location.href="/tMember/insertFormTMember.ssm";
			});
		});
		</script>
	</head>
	<body>
		<form name="mvcMember" id="mvcMember" action="/babyServlet/mvc/joinSelectAll.jsp" 
		method ="POST"
		enctype="multipart/form-data">
		<% 

		Object obj1 = request.getAttribute("tmemberList"); 
		System.out.println("obj1 >>> : " +obj1);
				
		if (obj1 != null){
			ArrayList<TMemberVO> aList = (ArrayList<TMemberVO>) obj1;
			if (aList.size() == 0){
	
			%>	
			<div class="table-container">
 				 <table class="table">
				<tr>
					<td>NO DATA</td>
				</tr>
			</table>
			</div>			
			<% 		
	 		}else{
			%>
			<div class="table-container">
 				 <table class="table is-bordered is-striped is-narrow is-hoverable" >
				<tr>
					<td colspan="18" align="center"><h3>미가입 교사회원정보  </h3></td>
				</tr>	
				<tr>
					<td colspan="18" align="left">	
						<input type="hidden" name="ISUD_TYPE" id="ISUD_TYPE">												
						<input type="button" value="인덱스돌아가기" name="index" id="index">
						<input type="button" value="교사등록" id="I">
						<input type="button" value="정보수정" id="U">
						<input type="button" value="정보삭제" id="D">					
					</td>					
				</tr>
				<tr>
					<td><input type="checkbox" name="chkAll" id="chkAll"></td>
				 	<td>직원번호</td>
					<td>이름</td>
					<td>생년월일</td>
					<td>성별</td>
					<td>현 근무지 전입년도 </td>
					<td>휴대폰번호</td>
					<td>관리자 수정일</td>
				</tr>
			 		
		<% 		for(int i =0; i<aList.size(); i++){  
				TMemberVO tvo = aList.get(i);
		%>
				<tr>
				    <td align="center">
						<input type="checkbox" name="chkInJno" 
								id="chkInJno"  value=<%=tvo.getTtNo()%>
						 	    onclick="checkOnly(this)">
					</td>
					<td><%=tvo.getTtNo()%></td>
					<td><%=tvo.getTtName()%></td>
					<td><%=tvo.getTtBirth()%></td>
					<td><%=tvo.getTtGender()%></td>
					<td><%=tvo.getTtTransferyear()%></td>	
					<td><%=tvo.getTtPn()%></td>			
					<td><%=tvo.getTtAdmindate()%></td>
	
				</tr>
				
		<%			} //for끝
				} //aList.size if 끝
			}//object if 끝%>
			</table>	
			</div>
		</form>
	</body>
</html>