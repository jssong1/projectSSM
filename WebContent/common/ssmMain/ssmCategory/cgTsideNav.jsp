<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="wrapSide">
<!--                <div class="menuTit"><h2>상담창구</h2></div> -->
   <div id="sideLink">
      <div id="userImg">
         <img src="/file/T1.png" alt="사용자">
      </div>
      <div id="goMypage">
         <ul class="userLink">   
            <li>
               <a href="#">마이페이지</a>
            </li>
            <li>
               <a href="/user/logout.ssm">로그아웃</a>
            </li>
         </ul>
      </div>
      <div id="sideDiv">
         <ul class="sideList">
         <li class="i"><a href="/eduSchedule/eduRsvList.ssm">방문상담관리</a></li>
            <li class="i"><a href="/onlineApplication/oaListCLT.ssm">온라인상담관리</a></li>
            
         </ul>
      </div>
   </div>
</div>
</body>
</html>