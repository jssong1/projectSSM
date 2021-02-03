<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="ssm.common.utils.UserSession" %>
<% request.setCharacterEncoding("UTF-8"); 

   Object result = (String)request.getAttribute("result");
   Object message =(String)request.getAttribute("message");
      
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>결과화면</title>
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js">  
      </script>
	<script src="/include/js/sweetalert2.all.min.js"></script>
	
  
      
   <body>
    <script type="text/javascript">
          if("<%=result%>".indexOf("failed")>-1){
        	 
        	 alert("<%=message%>");
        	
            //openner.location.reload();
            //history.go(-1);   
            location.href="/main_1.jsp";
         }else{
        	 
        alert('로그인 되었습니다');
        	
            location.href="/main_1.jsp";
          
         }
      </script>
   </body>
</html>