<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.QnABoardVO" %>    
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
   
   
   
   <script src="/include/js/jquery-1.11.3.min.js?ver=1"></script>
   <script src="/common/ssmJs/goCategory.js"></script>
   <script src="/common/ssmJs/index.js"></script>
   <script type="text/javascript">
      var butChk =0; //수정버튼과 삭제버튼을 구별하기 위한 변수
      $(function(){
         $("#pwdChk").hide();

         
         $("#cancelBut").click(function (){
            $("#pwdChk").hide();
            $("#buttons").show();
         });

         /* 비밀번호 확인 버튼 클릭 시 처리 이벤트*/
         $("#pwdBut").click(function(){
            pwdConfirm();
         });
         
           // 선생유저일경우만 삭제 수정버튼 숨겨라
		var SessionAU = "<%=sessionAU%>";
				if (SessionAU == 2) {
					$(".student_button").hide();
				}
      });//end of 펑션
      
      /*수정 버튼 클릭시 처리 이벤트*/
       function updatebutton(){
         $("#pwdChk").show();
         $("#buttons").hide();
         $("#msg").text("비빌번호를 입력해 주세요").css("color","#000099");
         butChk=1;
      }
      
      /*삭제 버튼 클릭시 처리 이벤트*/
      function deletebutton(){
         $("#pwdChk").show();
         $("#buttons").hide();
         $("#msg").text("비빌번호를 입력해 주세요").css("color","#000099");
         butChk=2;
      }
      
      /* 비밀번호 확인 버튼 클릭시 실질적인 처리 함수*/
      function pwdConfirm(){
         
            $.ajax({
               url:"/qnaboard/pwdConfirm.ssm",
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
                        goUrl="/qnaboard/qbupdateForm.ssm";
                     }else if(butChk==2){
                        goUrl="/qnaboard/qbDelete.ssm";
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
		<!-- 해더 -->
         <header include-html="/common/ssmMain/header_.jsp"></header>
         <div class="subWrap">
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
               <h1>나의 질문과 답변</h1>
               <p><a href="/chwc/index.asp">홈</a> > <a href="#메인주소">커뮤니티</a> > <a
                  href="#주소걸기" class="on">질문과 답변 상세조회</a>
               </p>
            </div>
            
            <div class="container">
   <%
   QnABoardVO qvo =(QnABoardVO)request.getAttribute("qbdetail");
   %>
   <form name="f_data" id="f_data" method="POST">
      <input type="hidden" name="qbNo" value="<%=qvo.getQbNo() %>" />
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
               <td><%=qvo.getsMembervo().getSsName() %></td>
               <th>유형</th>
               <td colspan="3"><%=qvo.getQbType() %></td>
            </tr>
            <tr>
               <th>작성일</th>
               <td><%=qvo.getQbInsertdate() %></td>
               <th>수정일</th>
               <td><%
               if(qvo.getQbUpdatedate() == null){
               %>-
               <%
               }else if(qvo.getQbUpdatedate() != null){
            	%>
            	<%=	 qvo.getQbUpdatedate()%>
            	<%  
               }
               %>
               </td>
            </tr>
            <tr>
               <th>제목</th>
               <td colspan="3"><%=qvo.getQbTitle() %></td>
            </tr>
            <tr height="300px">
               <th>내용</th>
               <td colspan="3" ><%=qvo.getQbContents() %></td>
            </tr>
         </tbody>
      </table>
   </div>
   <%-- ======================상세 정보 보여주기 종료 ========================================== --%>
   
   <%--===============================비밀번호 확인 버튼 및 버튼 추가 시작======================== --%>
   <table id="boardPwdBut" width="100%">
      <tr>
         <td colspan ="4">
            <div id="pwdChk">
               <form name="pwcheckform" id="pwcheckform">
                  <label for="sspw" id="l_pwd">비밀번호 : </label>
                  <input type="password" name="ssPw" id="ssPw" />
                  <input type="hidden" name="qbNo" id="qbNo" value="<%=qvo.getQbNo() %>"/>
                  <input type="button" name="pwdBut" id="pwdBut" value="확인" />
                  <input type="button" name="cancelBut" id="cancelBut" value="취소" />
                  
                  <span id="msg"></span>
               </form>
            </div>
         </td>
         <td colspan ="4">
         <div class="board_btn">
                  <a href="javascript:updatebutton()" class="student_button"><span>수정</span></a>
                  <a href="javascript:deletebutton()" class="student_button"><span>삭제</span></a>
                  <a href="/qnaboard/qblist.ssm"><span class="back">목록</span></a>
               <!-- <input type="button" value="수정" id="updatebutton">
               <input type="button" value="삭제" id="deletebutton"> -->
            </div>
         </td>
      </tr>
   </table>
   <br><br><br>
   <jsp:include page="qnaanswer.jsp"></jsp:include>
   
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