<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = "ssm.mi.member.vo.TMemberVO"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import= "ssm.common.utils.FilePath" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<form name="mvcMember" id="mvcMember" action="/babyServlet/mvc/joinSelectAll.jsp" 
		method ="POST"
		enctype="multipart/form-data">
		<% 

		Object obj = request.getAttribute("tmemberList"); 
		System.out.println("obj1 >>> : " +obj);
				
		if (obj != null){
			ArrayList<TMemberVO> aList = (ArrayList<TMemberVO>) obj;
			if (aList.size() == 0){
	
			%>	
			<table border="1">
				<tr>
					<td>NO DATA</td>
				</tr>
			</table>			
			<% 		
	 		}else{
			%>
			<table border="1">
				<tr>
					<td colspan="18" align="center"><h3>회원정보  </h3></td>
				</tr>	
				<tr>
					<td colspan="18" align="left">	
						<input type="hidden" name="ISUD_TYPE" id="ISUD_TYPE">												
						<input type="button" value="인덱스돌아가기" name="index" id="index">
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
					<td>권한  </td>
					<td>담당과목  </td>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>현 근무지 전입년도 </td>
					<td>휴대폰번호</td>
					<td>이메일</td>
					<td>회원사진</td>
					<td>삭제여부</td>
					<td>작성일</td>
					<td>수정일</td> 
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
					<td><%=tvo.getTtAuthority()%></td>		
					<td><%=tvo.getSjtCode()%></td>	
					<td><%=tvo.getTtId()%></td>	
					<td><%=tvo.getTtPw()%></td>	
					<td><%=tvo.getTtTransferyear()%></td>	
					<td><%=tvo.getTtPn()%></td>	
					<td><%=tvo.getTtEmail()%></td>				
					<td><img src = "../../upload/<%=tvo.getTtImage()%>" border=0 width="30" height="40"></td>
					<td><%=tvo.getTtDeleteyn()%></td>
					<td><%=tvo.getTtInsertdate()%></td>					
					<td><%=tvo.getTtUpdatedate()%></td>		
				</tr>
				
		<%			} //for끝
				} //aList.size if 끝
			}//object if 끝%>
			</table>	
		</form>
	</body>
</html>