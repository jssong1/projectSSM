<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String qbno= (String)request.getAttribute("QbNo");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/common/ssmCss/default.css">
   <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
   <link rel="stylesheet" href="/common/ssmCss/nbBoard.css">
   <script src="/common/ssmJs/goCategory.js"></script>
   <script src="/common/ssmJs/index.js"></script>
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <script type="text/javascript">
   $(document).ready(function(){
   
      
      $("#submitbutton").click(function(){
         pwdConfirm();
      });
      
      function pwdConfirm(){
         
         $.ajax({
            url:"/qnaboard/pwdConfirm.ssm",
            type:"POST",
            data:$("#pwcheckForm").serialize(),
            error:function(){
               alert('시스템 오류입니다 관리자에게 문의하세요');
            },
            success:function(resultData){
               var goUrl="";
               if(resultData ==0){
                  $("#msg").text("입력한 비밀번호가 일치하지 않습니다.").css("color","red");
               }else if(resultData ==1){ //일치할 경우
                  $("#msg").text("");
                  goUrl="/qnaboard/qbDetail.ssm";
                  $("#pwcheckForm").attr("action",goUrl);
                  $("#pwcheckForm").submit();
               }
            }
         });   
         
   
      }
      
   });
   </script>
   
   <style>
   <%--   html, body {
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
         }   --%>
   </style>
   
</head>
<body>
<div id="wrap">
         <header include-html="/common/ssmMain/header_.jsp"></header>
         <div class="subWrap">
         <nav include-html="/common/ssmMain/ssmCategory/cmSSideNav.html"></nav>
            <section>
               <div class="container">
                  <div id="checkPwDiv" style="width: 300px;" >
                     비밀글입니다 
                     <br>
                     비밀번호를 입력하세요!
                     <div id="checkPw">
                        <form id="pwcheckForm" name="pwcheckForm">
                     
                           <input type="password" id="ssPw" name="ssPw" style="height: 25px; width: 180px;" placeholder="비밀번호를 입력하세요"
                           > 
                           <input type="button" id="submitbutton" name="submitbutton" value="보내기" 
    style="width:50px; height: 25px; text-align:center;"
                           >
                           <input type="hidden" id="qbNo" name="qbNo" value="<%=qbno%>">
                           <br>
                           <span id="msg"></span></div>
                        </form>
                     </div>
               </div>
            </section>
            </div>
         <footer include-html="/common/ssmMain/footer.html"></footer>
      </div>
      <script>
         includeHTML();
      </script>   
</div>
</body>
</html>