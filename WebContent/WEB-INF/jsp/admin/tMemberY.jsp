<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "ssm.mi.vo.TMemberVO"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import= "ssm.common.utils.FilePath" %>
<% 
		Object obj1 = request.getAttribute("tmemberList"); 
		System.out.println("obj >>> : " +obj1);
		String result="";
		
		result = (String)request.getAttribute("result");
		if(result != null){
		
			System.out.println("result >>> : " +result);
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>tMemberY</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var result = "<%=result%>";
				if (result!=""){
					console.log(result);
				}
				$("#index").click(function(){
					alert("INDEX로 >>>");
					location.href="/default.jsp";
				});
				$("#U, #U2").click(function(){
					console.log("U >>>>> ");
					
					//var ttNo = $("#chAu").parents("tr").attr("data-num");
					//console.log("ttNo>>> : " + ttNo);
					//$("#ttNo").val(ttNo);
					//console.log("ttNo>>> : " + $("#ttNo").val());
					
					
					//var chAuthorityVal =$("#chAuthority").val();
					//console.log("chAuthority>> : "+chAuthorityVal);
					//$("#ttAuthority").val(chAuthorityVal);
					//console.log($("#ttAuthority").val());

					
					//$("#yMember").attr("action","/tMember/updateYTMember.ssm").submit();						
				
					$("#yMember").attr({
						"method":"POST",
						"action":"/tMember/updateYTMember.ssm"
					});
					$("#yMember").submit();	
				
				});	//U클릭
				
				$("#D, #D2").click(function(){
					var checkL = $("input:checkbox[name=chkInJno]:checked").length
					alert("check박스 선택 개수 >>> : " + checkL);
					if(checkL== 1){
						alert("D >>>>> ");
						$("#ISUD_TYPE").val("D");
						console.log("D >>> " + $("#ISUD_TYPE").val());
						$("#boardList").attr("action","/.ssm").submit();						
					}else{
						alert("오류 : 하나의 체크박스를 선택하시오");
					}//check박스 if					
				});	//D클릭
				
				$("#chkAll").click(function(){
					//클릭되었으면 
					if($("#chkAll").prop("checked")){ //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
						$("input[name=chkInNo]").prop("checked",true); //클릭이 안되있으면 
					}else{ //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의 
						$("input[name=chkInNo]").prop("checked",false);
					} 
				});

			});
		</script>
	</head>
	<body>
		<form name="yMember" id="yMember" 
		method ="POST"
		enctype="application/x-www-form-urlencoded">
<%		
		if (obj1 != null){
			ArrayList<TMemberVO> aList = (ArrayList<TMemberVO>) obj1;
			
			if (aList.size() == 0){
	
			%>	
			<div class="table-container">
				<table border="1">
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
						<td colspan="18" align="center"><h3>가입 교사 회원정보  </h3></td>
					</tr>	
					<tr>
						<td colspan="18" align="left">	
							<input type="hidden" name="ttNo" id="ttNo">												
							<input type="button" value="인덱스돌아가기" name="index" id="index">
							<input type="button" value="권한수정" id="U">
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
						<td>작성일</td>
						<td>수정일</td> 
					</tr>
				 		
			<% 		for(int i =0; i<aList.size(); i++){  
					TMemberVO tvo = aList.get(i);
					String chNo = "tMemberList["+i+"].ttNo";
					String chAu = "tMemberList["+i+"].ttAuthority";
					System.out.println("getTtAuthority >> : " + tvo.getTtAuthority());
			%>
					<tr>
					    <td align="center">
							<input type="checkbox" name="chkInNo" 
									id="chkInNo"  value=<%=tvo.getTtNo()%>
							 	    onclick="checkOnly(this)">
						</td>
						<td><%=tvo.getTtNo()%></td>
						<td><%=tvo.getTtName()%></td>
						<td><%=tvo.getTtBirth()%></td>
						<td><%=tvo.getTtGender()%></td>
						
						<td><input type="hidden" name="<%=chNo%>" id="<%=chNo%>" value="<%=tvo.getTtNo()%>">
							<select id="<%=chAu%>"  name="<%=chAu%>"  >
								<option value="<%=tvo.getTtAuthority()%>" selected="selected"><%=tvo.getTtAuthority()%></option>							
								<option value="2">담임교사</option>
								<option value="3">상담교사</option>
								<option value="4">관리자</option>
								
							</select>
							<%if(tvo.getTtAuthority().equals("담임교사")){%>
								<br><%=tvo.getTtGrade()%> <%=tvo.getTtClass()%>반
							<%} %></td>
							
						<td><%=tvo.getSjtCode()%></td>	
						<td><%=tvo.getTtId()%></td>	
						<td><%=tvo.getTtPw()%></td>	
						<td><%=tvo.getTtTransferyear()%></td>	
						<td><%=tvo.getTtPn()%></td>	
						<td><%=tvo.getTtEmail()%></td>				
						<td><img src = "/upload/<%=tvo.getTtImage()%>" border=0 width="50" height="50"></td>
						<td><%=tvo.getTtInsertdate()%></td>					
						<td><%=tvo.getTtUpdatedate()%></td>		
					</tr>
					
			<%			} //for끝
					} //aList.size if 끝
				}//object if 끝%>
				</table>	
			</div>
		</form>
	</body>
</html>