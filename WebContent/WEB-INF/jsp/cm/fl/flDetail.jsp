<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.FamilyLetterVO" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 상세 보기</title>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js?ver=1"></script>
 	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		var butChk =0; //수정버튼과 삭제버튼을 구별하기 위한 변수
		$(function(){
			$("#pwdChk").hide();
			
			
			/*수정 버튼 클릭시 처리 이벤트*/
			$("#updatebutton").click(function(){
				$("#pwdChk").show();
				$("#buttons").hide();
				$("#msg").text("작성시 입력한 비빌번호를 입력해 주세요").css("color","#000099");
				butChk=1;
			});
			
			$("#cancelBut").click(function(){
				$("#pwdChk").hide();
				$("#buttons").show();
			});
			
			/*삭제 버튼 클릭시 처리 이벤트*/
			$("#deletebutton").click(function(){
				$("#pwdChk").show();
				$("#buttons").hide();
				$("#msg").text("작성시 입력한 비빌번호를 입력해 주세요").css("color","#000099");
				butChk=2;
			});
			

			/* 비밀번호 확인 버튼 클릭 시 처리 이벤트*/
			$("#pwdBut").click(function(){
				pwdConfirm();
			});
			
		});//end of 펑션
		
		/* 비밀번호 확인 버튼 클릭시 실질적인 처리 함수*/
		
		function pwdConfirm(){
			
				$.ajax({
					url:"/familyletter/pwdConfirm.ssm",
					type:"POST",
					data:$("#pwcheckform").serialize(),
					error:function(){
						alert('시스템 오류입니다 관리자에게 문의하세요');
					},
					success:function(resultData){
						var goUrl="";
						if(resultData ==0){
							$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
						}else if(resultData ==1){ //일치할 경우
							$("#msg").text("");
							if(butChk==1){
								goUrl="/familyletter/flupdateForm.ssm";
							}else if(butChk==2){
								goUrl="/familyletter/flDelete.ssm";
							}
							$("#f_data").attr("action",goUrl);
							$("#f_data").submit();
						}
					}
				});	
				
		
		}
		
		/* 학생번호가있으면 글쓰기버튼을 숨겨라 (세션)
		var ssno = "S7180001"; */
		if(ssno != "null" && ssno != ""){
			$("#buttons").hide();
		}
	</script>
	
	<style>
		html, body {
			  margin: 0;
			  padding: 0;
			  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
			  font-size: 4px;
			}
			
			table  {
				width : 500px;
				text-align : center;
				margin : auto;
			}
			
			.list
			{
				width : 500px;
				text-align : left;
				margin : auto;
			}	
	</style>
	
</head>
<body>
<div id="wrap">
			<%@include file="/common/ssmMain/header_.jsp"%>
			<nav include-html="/common/ssmMain/ssmCategory/cmwrapSide.html"></nav>
			<section>
				<div class="container">
	<div id="boardContainer">
	<%
	FamilyLetterVO fvo =(FamilyLetterVO)request.getAttribute("fldetail");
	String flFile=fvo.getFlFile();
	System.out.println(flFile);
	flFile = flFile.substring(10);
	%>
	<h3>글상세</h3>
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" id="flNo" name="flNo" value="<%=fvo.getFlNo() %>" />
		<input type="hidden" name="flfile" value="<%=fvo.getFlFile() %>" />
	</form>
	
	<%-- ========================비밀번호 확인 버튼 및 버튼 추가 종료 ================================ --%>
	
	<%-- ======================상세 정보 보여주기 시작 ========================================== --%>
	<div id="boardDetail">
		<table border="1">
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="300px" />
				<col width="300px" />
				</colgroup>
			<tbody>
				<tr>
					<td>작성자</td>
					<td><%=fvo.gettMembervo().getTtName() %></td>
					<td>작성일:<%=fvo.getFlInsertdate() %></td>
					<td>수정일:<%=fvo.getFlUpdatedate() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><%=fvo.getFlTitle() %></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan="3">
					<%
					if(flFile.equals("null")){
					%>
					첨부파일 없습니다.</td>
					<%
					}else{
					%>
					<p><%=flFile%>&nbsp;&nbsp;&nbsp;<a href="/familyletter/flDownload.ssm?file=<%=flFile%>">다운로드</a></p></td>
					<%	
					}
					%>
				</tr>
				<tr height="300px">
					<td>내용</td>
					<td colspan="3" ><%=fvo.getFlContents() %></td>
				</tr>
			</tbody>
		</table>
	</div>
	<%-- ======================상세 정보 보여주기 종료 ========================================== --%>
	<%--===============================비밀번호 확인 버튼 및 버튼 추가 시작======================== --%>
	<table id="boardPwdBut">
		<tr>
			<td>
				<div id="pwdChk">
					<form name="pwcheckform" id="pwcheckform">
						<label for="ttpw" id="l_pwd">비밀번호 : </label>
						<input type="password" name="ttPw" id="ttPw" />
						<input type="hidden" name="flNo" id="flNo" value="<%=fvo.getFlNo()%>"/>
						<input type="button" name="pwdBut" id="pwdBut" value="확인" />
						<input type="button" name="cancelBut" id="cancelBut" value="취소" />
						
						<span id="msg"></span>
					</form>
				</div>
			</td>
			<td>
				<div id="buttons">
					<input type="button" value="수정" id="updatebutton">
					<input type="button" value="삭제" id="deletebutton">
				</div>	
			</td>
		</tr>
	</table>
	</div>
			</section>
			<footer include-html="/common/ssmMain/footer.html"></footer>
		</div>
		<script>
			includeHTML();
		</script>	
</body>
</html>