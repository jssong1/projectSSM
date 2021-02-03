<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="ssm.common.utils.UserSession" %>
<% 
   request.setCharacterEncoding("UTF-8"); 
   Object obj = request.getAttribute("alert");
   String alertt ="";
   if(obj != null){
      alertt = (String)obj;
   }
   String sessionAU = UserSession.getSessionAU(request);
   System.out.println("sessionAU>>>:"+ sessionAU);
   if(sessionAU == null){
      sessionAU = "";
   }
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>메멩</title>
      <link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
      <link rel="stylesheet" href="/common/ssmCss/default.css">
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
      <script src="/common/ssmJs/goCategory.js?ver=1"></script>
      <script src="/common/ssmJs/index.js"></script>
      
      
      <script type="text/javascript">
         function goLogin(){
            $("#loginForm")
            .attr("action","/user/loginCheck.ssm")
            .submit();
         }
      </script>
   </head>
   <body>
   
      <div id="wrap">
      <header include-html="/common/ssmMain/header_.jsp"></header>
         <!-- 헤더 -->
      
         <!-- 본문 -->
         <!-- 화면 오른쪽/ 로그인 박스, 학교공지 -->
         <section>
            <div class="subWrap_1">
               <div id="loginBox">
                  <!-- 로그인폼 -->
                  <form id="loginForm" name="loginForm" method="POST">
                      <ul class="list">
                         <li>
<!--                          <button class="imgBtn" value="A"><img src="include/img/sick.png" alt="관리자"></button> -->
                            <input type="radio" id="userA" name="userAuthority" value="A" />
                            <span class="wrapRadio">
                               <label for="user01">관리자</label>
                            </span>
                         </li>
                         <li>
                            <input type="radio" id="userT" name="userAuthority" value="T" />
                            <span class="wrapRadio">
                               <label for="user02">교직원</label>
                            </span>
                            </li>
                         <li>
                           <input type="radio" id="userS" name="userAuthority" value="S" />
                            <span class="wrapRadio">
                               <label for="user03">학생</label>
                            </span>
                        </li>
                      </ul>
                      <input type="text" id="loginId" name="userId" placeholder="ID" /><br>
                      <input type="password" id="loginPw" name="userPw" placeholder="PASSWORD" /><br>
                      <a id="loginBtn" href="javascript:goLogin()">LOGIN</a><br>
                      <a href="#">회원가입</a>
                   </form>
               </div>
               <!-- 학교공지 -->
               <div id="noticeBox">
                   <h2><a href="/WEB-INF/cg/">학교공지</a></h2>
                   <div class="wrapTit">
                      <ul class="linkList">
                         <li><a href="/link/noticeBoard.ssm"><span class="titleTxt">공지1</span></a></li>
                         <li><a href="#"><span class="titleTxt">공zl</span></a></li>
                         <li><a href="#"><span class="titleTxt">0g</span></a></li>
                      </ul>
                   </div>
               </div>
            </div>
            <!-- 화면 중앙 메인이미지/ 하단 외부 링크 -->
            <div class="subWrap_2">
               <div id="mainImg" style="background:url('/include/img/pengpeng.png')">
                  <ul class="mainImgList">
                     <li>
                        <h2>꺄롤롤롤</h2>
                        <!-- <img src="include/img/mint.jpg" alt="메인이미지"> -->
                     </li>
                  </ul>
               </div>
               <nav>
                  <div class="navWrap">
                     <div id="outLink">
                        <ul class="etcList">
                            <li><a href="#"><img src="/include/img/link.png"></a></li>
                            <li><a href="#"><img src="/include/img/link.png"></a></li>
                            <li><a href="#"><img src="/include/img/link.png"></a></li>
                            <li><a href="#"><img src="/include/img/link.png"></a></li>
                         </ul>
                     </div>
                  </div>
               </nav>
            </div>
            <!-- 화면 오른쪽/ 비교과활동, 영상, 링크 -->
            <div class="subWrap_3">
               <div id="nonSubject">
               <h2><a href="#">비교과활동</a></h2>
                   <div class="wrapTit">
                      <!-- <ul class="linkList">
                         <li><a href="#"><span class="titleTxt">비교과활동</span></a></li>
                         <li><a href="#"><span class="titleTxt">활동있나요</span></a></li>
                         <li><a href="#"><span class="titleTxt">활동안할래요</span></a></li>
                      </ul>
                       -->
                   </div>
               </div>
               <div id="schoolLink">
                  <a id="exLink" href="#">링크1</a>
                  <a id="school" href="http://bitcamp.co.kr/index.php?main_page=home">링크2/ 학교홈페이지</a>
                  <div id="goVideo">
                     <video autoplay>
                        <source src="   "/>
                     </video>
                  </div>
               </div>
            </div>
         </section>
         <!-- 화면 하단 -->
         <footer>
            <div class="footerTxt">
               <hr/>
               <p>
                  프프로로제젝<br>2019-2020Java142:ProjectSSM
               </p>
            </div>
         </footer>
      </div>
      <script>
      includeHTML();
      </script>
   </body>
</html>