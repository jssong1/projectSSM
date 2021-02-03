<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.NoticeBoardVO" %>    
<%@ page import="ssm.common.utils.UserSession" %>  


<%  String sessionAU = UserSession.getSessionAU(request);%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 상세 보기</title>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
    <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
    <link rel="stylesheet" href="/common/ssmCss/s_base.css">
    <link rel="stylesheet" href="/common/ssmCss/s_content.css">
    <link rel="stylesheet" href="/common/ssmCss/s_layout.css">
   
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
 	<script src="https://code.jquery.com/jquery-1.12.4.min.js?ver=1"></script>
	<script type="text/javascript">
		var butChk =0; //수정버튼과 삭제버튼을 구별하기 위한 변수
		$(function(){
			$("#pwdChk").hide();
			
			//취소버튼
			$("#cancelBut").click(function(){
				$("#pwdChk").hide();
				$("#buttons").show();
			});

			/* 비밀번호 확인 버튼 클릭 시 처리 이벤트*/
			$("#pwdBut").click(function(){
				pwdConfirm();
			});
			
			// 학생유저일경우만 삭제 수정버튼 숨겨라
			var SessionAU = "<%=sessionAU%>";
					if (SessionAU == 1) {
						$(".teacher_button").hide();
					}
		});//end of 펑션
		
		/*수정 버튼 클릭시 처리 이벤트*/
		function updatebutton(){
			$("#pwdChk").show();
			$("#buttons").hide();
			$("#msg").text("비밀번호를 입력하세요").css("color","#000099");
			butChk=1;	
		}
		
		/*삭제 버튼 클릭시 처리 이벤트*/
		function deletebutton(){
			$("#pwdChk").show();
			$("#buttons").hide();
			$("#msg").text("비밀번호를 입력하세요").css("color","#000099");
			butChk=2;
		}
		
		
		/* 비밀번호 확인 버튼 클릭시 실질적인 처리 함수*/
		function pwdConfirm(){
			
				$.ajax({
					url:"/noticeboard/pwdConfirm.ssm",
					type:"POST",
					data:$("#pwcheckform").serialize(),
					error:function(){
						alert('시스템 오류입니다 관리자에게 문의하세요');
					},
					success:function(resultData){
						var goUrl="";
						if(resultData ==0){
							$("#msg").text("비밀번호가 일치하지 않습니다.").css("color","red");
						}else if(resultData ==1){ //일치할 경우
							$("#msg").text("");
							if(butChk==1){
								goUrl="/noticeboard/nbupdateForm.ssm";
							}else if(butChk==2){
								goUrl="/noticeboard/nbDelete.ssm";
							}
							$("#f_data").attr("action",goUrl);
							$("#f_data").submit();
						}
					}
				});	
				
		
		}
		
	</script>
	<style>
   	.board_btn {
   		text-align : end;
   	}
   </style>
	
	
</head>
<body>
<div id="wrap">
			<!-- 헤더 -->
			<header include-html="/common/ssmMain/header_.jsp"></header>
			<div class="subWrap" style="margin-top:-5px;">
			<!-- 네비게이션 -->
			<%
			if(sessionAU.equals("1")){
			%><nav include-html="/common/ssmMain/ssmCategory/cmSSideNav.html"></nav><%
			}
			if(sessionAU.equals("2")){
			%><nav include-html="/common/ssmMain/ssmCategory/cmTSideNav.html"></nav><%
			}
			%>
			<section>
            <div id="tit">
	           	 <h1>상세 보기</h1>
	            <p>
	               <a href="../main_1.jsp">홈</a> > <a href="/noticeboard/nblist.ssm">커뮤니티</a> > <a class="on">공지사항 게시판 상세조회</a>
	            </p>
	         </div>
            <div class="container">
	<%
	NoticeBoardVO nvo =(NoticeBoardVO)request.getAttribute("nbdetail");
	String NbFile=nvo.getNbFile();
	NbFile = NbFile.substring(10);
	%>
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" id="nbNo" name="nbNo" value="<%=nvo.getNbNo() %>" />
		<input type="hidden" name="nbfile" value="<%=nvo.getNbFile() %>" />
	</form>
	<br><br><br>
	<%-- ========================비밀번호 확인 버튼 및 버튼 추가 종료 ================================ --%>
	
	<%-- ======================상세 정보 보여주기 시작 ========================================== --%>
	<div id="boardDetail">
	 <div class="clear_div"></div>
		<table cellpadding="0" cellspacing="0" border="0" style="margin:auto;" class="view_box mt_5" >
			<colgroup>
				<col width="18%">
                <col width="35%">
                <col width="18%">
                <col width="35%">
            </colgroup>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><%=nvo.gettMembervo().getTtName() %></td>
					<th>첨부파일</th>
					<td colspan="3">
					<%
					if(NbFile.equals("null")){
					%>
					첨부파일 없습니다.</td>
					<%
					}else{
					%>
					<p><%=NbFile%>&nbsp;&nbsp;&nbsp;<a href="/noticeboard/nbDownload.ssm?file=<%=NbFile%>">다운로드</a></p></td>
					<%	
					}
					%>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%=nvo.getNbInsertdate() %></td>
					<th>수정일</th>
					<td><%
               if(nvo.getNbUpdatedate() == null){
               %>-
               <%
               }else if(nvo.getNbUpdatedate() != null){
            	%>
            	<%=	 nvo.getNbUpdatedate()%>
            	<%  
               }
               %>
               </td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><%=nvo.getNbTitle() %></td>
				</tr>
				<tr height="300px">
					<th>내용</th>
					<td colspan="3" ><%=nvo.getNbContents() %></td>
				</tr>
			</tbody>
		</table>
	</div>
	<%-- ======================상세 정보 보여주기 종료 ========================================== --%>
	<%--===============================비밀번호 확인 버튼 및 버튼 추가 시작======================== --%>
	<table id="boardPwdBut" style="width: 100%;">
		<tr>
			<td>
				<div id="pwdChk">
					<form name="pwcheckform" id="pwcheckform">
						<label for="ttpw" id="l_pwd">비밀번호 : </label>
						<input type="password" name="ttPw" id="ttPw" />
						<input type="hidden" name="nbNo" id="nbNo" value="<%=nvo.getNbNo()%>"/>
						<input type="button" name="pwdBut" id="pwdBut" value="확인" />
						<input type="button" name="cancelBut" id="cancelBut" value="취소" />
						
						<span id="msg"></span>
					</form>
				</div>
			</td>
			<td colspan ="4" style="width: 100%;">
         <div class="board_btn" style="width: 100%;">
                  <a href="javascript:updatebutton()" class="teacher_button"><span>수정</span></a>
                  <a href="javascript:deletebutton()" class="teacher_button"><span>삭제</span></a>
                  <a href="/noticeboard/nblist.ssm"><span class="back">목록</span></a>
               <!-- <input type="button" value="수정" id="updatebutton">
               <input type="button" value="삭제" id="deletebutton"> -->
            </div>
         </td>
      </tr>
   </table>
   <br><br><br>
	</div>
			</section>
			<footer include-html="/common/ssmMain/footer.html"></footer>
		</div>
		<script>
			includeHTML();
		</script>	
</body>
</html>