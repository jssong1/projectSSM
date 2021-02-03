<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="ssm.mi.vo.*"%>
<%@ page import="ssm.cd.vo.*"%>
<%
   request.setCharacterEncoding("UTF-8");
   Object obj = null;
   Object obj2 = null;
   List list = null;
   List list2 = null;
   TestVO tvo = null;
   SMemberVO svo = null;
   String ssNo = "";
   String ssGrade = "";
   String ssGrade2 = "";
   String cdGrade = "";
   String cdValue = "";
   String cdUrl = "";
   String cdInsertdate = "";
   String ssNo2 = "";
   int intGrade = 0;
   String cdUrlJA1 = "";
   String cdUrlCM1 = "";
   String cdUrlJI1 = "";
   String cdUrlIH1 = "";
   String cdUrlVA1 = "";

   String cdUrlJA2 = "";
   String cdUrlCM2 = "";
   String cdUrlJI2 = "";
   String cdUrlIH2 = "";
   String cdUrlVA2 = "";

   String cdUrlJA3 = "";
   String cdUrlCM3 = "";
   String cdUrlJI3 = "";
   String cdUrlIH3 = "";
   String cdUrlVA3 = "";
   obj2 = request.getAttribute("list2");
   if (obj2 != null) {
      list2 = (List) obj2;
      if (list2.size() > 0 && list2 != null) {
         svo = (SMemberVO) list2.get(0);
         ssGrade = svo.getSsGrade(); //현재학년
         ssGrade2 = svo.getSsGrade(); //현재학년
         if (ssGrade.equals("FM")) {
            ssGrade = "1";
            intGrade = Integer.parseInt(ssGrade);
         } else if (ssGrade.equals("JR")) {
            ssGrade = "2";
            intGrade = Integer.parseInt(ssGrade);
         } else {
            ssGrade = "3";
            intGrade = Integer.parseInt(ssGrade);
         }
      }
   }

   obj = request.getAttribute("list");
   if (obj != null) {
      list = (List) obj;
      if (list.size() > 0 && list != null) {
         for (int i = 0; i < list.size(); i++) {
            tvo = (TestVO) list.get(i);
            if (tvo.getCdGrade().equals("FM")) {
               if (tvo.getCdValue().equals("JA")) {
                  cdUrlJA1 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("CM")) {
                  cdUrlCM1 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("JI")) {
                  cdUrlJI1 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("IH")) {
                  cdUrlIH1 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("VA")) {
                  cdUrlVA1 = tvo.getCdUrl();
               }
            }
            if (tvo.getCdGrade().equals("JR")) {
               if (tvo.getCdValue().equals("JA")) {
                  cdUrlJA2 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("CM")) {
                  cdUrlCM2 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("JI")) {
                  cdUrlJI2 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("IH")) {
                  cdUrlIH2 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("VA")) {
                  cdUrlVA2 = tvo.getCdUrl();
               }
            }
            if (tvo.getCdGrade().equals("SR")) {
               if (tvo.getCdValue().equals("JA")) {
                  cdUrlJA3 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("CM")) {
                  cdUrlCM3 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("JI")) {
                  cdUrlJI3 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("IH")) {
                  cdUrlIH3 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("VA")) {
                  cdUrlVA3 = tvo.getCdUrl();
               }
            }

         }
      } else {

      }

   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cd_Main</title>
<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
<link rel="stylesheet" href="/common/ssmCss/default.css">
<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
<link rel="stylesheet" href="/common/ssmCss/s_base.css">
<link rel="stylesheet" href="/common/ssmCss/s_content.css">
<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
<link rel="stylesheet" href="/common/ssmCss/cd.css">
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/common/ssmJs/goCategory.js"></script>
<script src="/common/ssmJs/index.js"></script>
<script src="/common/ssmJs/goBoard.js"></script>
<script src="/common/ssmJs/goLogin.js"></script>
<script type="text/javascript">
         $(function(){
            console.log("<%=ssGrade%>");
            val();
            valGrade();
            has();
            $(".tab").click(function(){
               var id = $(this).attr('id');
               sah(id);
            });   
            
            $(".result").click(function(){
               var vall = $(this).val();
               if(vall == "검사하러가기"){
                  var type = $(this).attr("id");
                  if(type == "JA1" || type == "JA2" || type == "JA3"){
                     
                     
                     location.href="/test/go_test.ssm?page=test_Job_Aptitude";
                  }
                  if(type == "CM1" || type == "CM2" || type == "CM3"){
                     location.href="/test/go_test.ssm?page=test_Career_Maturity";
                  }
                  if(type == "JI1" || type == "JI2" || type == "JI3"){
                     location.href="/test/go_test.ssm?page=test_Job_InterestK";
                  }
                  if(type == "IH1" || type == "IH2" || type == "IH3"){
                     location.href="/test/go_test.ssm?page=test_Job_InterestH";
                  }
                  if(type == "VA1" || type == "VA2" || type == "VA3"){
                     location.href="/test/go_test.ssm?page=test_Job_Value";
                  }
               }else{
                  var url = "";
                  var type = $(this).attr("id");
                  if(type == "JA1"){url = $("#JAURL1").val();}if(type == "JA2"){url = $("#JAURL2").val();}if(type == "JA3"){url = $("#JAURL3").val();}
                  if(type == "CM1"){url = $("#CMURL1").val();}if(type == "CM2"){url = $("#CMURL2").val();}if(type == "CM3"){url = $("#CMURL3").val();}
                  if(type == "JI1"){url = $("#JIURL1").val();}if(type == "JI2"){url = $("#JIURL2").val();}if(type == "JI3"){url = $("#JIURL3").val();}
                  if(type == "IH1"){url = $("#IHURL1").val();}if(type == "IH2"){url = $("#IHURL2").val();}if(type == "IH3"){url = $("#IHURL3").val();}
                  if(type == "VA1"){url = $("#VAURL1").val();}if(type == "VA2"){url = $("#VAURL2").val();}if(type == "VA3"){url = $("#VAURL3").val();}
                  window.open("","pop","width=1000,height=1000");
                  $("#def").attr("action",url).attr("target","pop").submit();
               }
            });
            butColor();
         });      
         
         function val(){
            $("#JAURL1").val("<%=cdUrlJA1%>");
            $("#CMURL1").val("<%=cdUrlCM1%>");
            $("#JIURL1").val("<%=cdUrlJI1%>");
            $("#IHURL1").val("<%=cdUrlIH1%>");
            $("#VAURL1").val("<%=cdUrlVA1%>");
            
            $("#JAURL2").val("<%=cdUrlJA2%>");
            $("#CMURL2").val("<%=cdUrlCM2%>");
            $("#JIURL2").val("<%=cdUrlJI2%>");
            $("#IHURL2").val("<%=cdUrlIH2%>");
            $("#VAURL2").val("<%=cdUrlVA2%>");
            
            $("#JAURL3").val("<%=cdUrlJA3%>");
            $("#CMURL3").val("<%=cdUrlCM3%>");
            $("#JIURL3").val("<%=cdUrlJI3%>");
            $("#IHURL3").val("<%=cdUrlIH3%>");
            $("#VAURL3").val("<%=cdUrlVA3%>");
            
         }
         
         function valGrade(){
            var ssGrade2 = "<%=ssGrade2%>";
            if($("#JAURL1").val() == "null" || $("#JAURL1").val() == ""){$("#JA1").val("검사하러가기");}else{$("#JA1").val("검사결과보기");}
            if($("#CMURL1").val() == "null" || $("#CMURL1").val() == ""){$("#CM1").val("검사하러가기");}else{$("#CM1").val("검사결과보기");}
            if($("#JIURL1").val() == "null" || $("#JIURL1").val() == ""){$("#JI1").val("검사하러가기");}else{$("#JI1").val("검사결과보기");}
            if($("#IHURL1").val() == "null" || $("#IHURL1").val() == ""){$("#IH1").val("검사하러가기");}else{$("#IH1").val("검사결과보기");}
            if($("#VAURL1").val() == "null" || $("#VAURL1").val() == ""){$("#VA1").val("검사하러가기");}else{$("#VA1").val("검사결과보기");}
            
            if($("#JAURL2").val() == "null" || $("#JAURL2").val() == ""){$("#JA2").val("검사하러가기");}else{$("#JA2").val("검사결과보기");}
            if($("#CMURL2").val() == "null" || $("#CMURL2").val() == ""){$("#CM2").val("검사하러가기");}else{$("#CM2").val("검사결과보기");}
            if($("#JIURL2").val() == "null" || $("#JIURL2").val() == ""){$("#JI2").val("검사하러가기");}else{$("#JI2").val("검사결과보기");}
            if($("#IHURL2").val() == "null" || $("#IHURL2").val() == ""){$("#IH2").val("검사하러가기");}else{$("#IH2").val("검사결과보기");}
            if($("#VAURL2").val() == "null" || $("#VAURL2").val() == ""){$("#VA2").val("검사하러가기");}else{$("#VA2").val("검사결과보기");}
            
            if($("#JAURL3").val() == "null" || $("#JAURL3").val() == ""){$("#JA3").val("검사하러가기");}else{$("#JA3").val("검사결과보기");}
            if($("#CMURL3").val() == "null" || $("#CMURL3").val() == ""){$("#CM3").val("검사하러가기");}else{$("#CM3").val("검사결과보기");}
            if($("#JIURL3").val() == "null" || $("#JIURL3").val() == ""){$("#JI3").val("검사하러가기");}else{$("#JI3").val("검사결과보기");}
            if($("#IHURL3").val() == "null" || $("#IHURL3").val() == ""){$("#IH3").val("검사하러가기");}else{$("#IH3").val("검사결과보기");}
            if($("#VAURL3").val() == "null" || $("#VAURL3").val() == ""){$("#VA3").val("검사하러가기");}else{$("#VA3").val("검사결과보기");}
            
            if(ssGrade2 == "FM"){
               $(".tab2").remove();
               $(".tab3").remove();
               $("#tab2").remove();
               $("#tab3").remove();
            }
            if(ssGrade2 == "JR"){
               if($("#JAURL1").val() == "null" || $("#JAURL1").val() == ""){$("#JA1").val("검사 불가"); $("#JA1").prop("disabled",true);}
               if($("#CMURL1").val() == "null" || $("#CMURL1").val() == ""){$("#CM1").val("검사 불가"); $("#CM1").prop("disabled",true);}
               if($("#JIURL1").val() == "null" || $("#JIURL1").val() == ""){$("#JI1").val("검사 불가"); $("#JI1").prop("disabled",true);}
               if($("#IHURL1").val() == "null" || $("#IHURL1").val() == ""){$("#IH1").val("검사 불가"); $("#IH1").prop("disabled",true);}
               if($("#VAURL1").val() == "null" || $("#VAURL1").val() == ""){$("#VA1").val("검사 불가"); $("#VA1").prop("disabled",true);}
               $(".tab3").remove();
               $("#tab3").remove();
            }
            if(ssGrade2 == "SR"){
               if($("#JAURL1").val() == "null" || $("#JAURL1").val() == ""){$("#JA1").val("검사 불가"); $("#JA1").prop("disabled",true);}
               if($("#CMURL1").val() == "null" || $("#CMURL1").val() == ""){$("#CM1").val("검사 불가"); $("#CM1").prop("disabled",true);}
               if($("#JIURL1").val() == "null" || $("#JIURL1").val() == ""){$("#JI1").val("검사 불가"); $("#JI1").prop("disabled",true);}
               if($("#IHURL1").val() == "null" || $("#IHURL1").val() == ""){$("#IH1").val("검사 불가"); $("#IH1").prop("disabled",true);}
               if($("#VAURL1").val() == "null" || $("#VAURL1").val() == ""){$("#VA1").val("검사 불가"); $("#VA1").prop("disabled",true);}
               
               if($("#JAURL2").val() == "null" || $("#JAURL2").val() == ""){$("#JA2").val("검사 불가"); $("#JA2").prop("disabled",true);}
               if($("#CMURL2").val() == "null" || $("#CMURL2").val() == ""){$("#CM2").val("검사 불가"); $("#CM2").prop("disabled",true);}
               if($("#JIURL2").val() == "null" || $("#JIURL2").val() == ""){$("#JI2").val("검사 불가"); $("#JI2").prop("disabled",true);}
               if($("#IHURL2").val() == "null" || $("#IHURL2").val() == ""){$("#IH2").val("검사 불가"); $("#IH2").prop("disabled",true);}
               if($("#VAURL2").val() == "null" || $("#VAURL2").val() == ""){$("#VA2").val("검사 불가"); $("#VA2").prop("disabled",true);}
            }
         }
   function has(){
      var ssGrade2 = "<%=ssGrade2%>";
      $(".tab1").hide();
      $(".tab2").hide();
      $(".tab3").hide();
      //$("#tab1").attr("style", "background-color: transparent");
      //$("#tab2").attr("style", "background-color: transparent");
      //$("#tab3").attr("style", "background-color: transparent");
      if (ssGrade2 == "FM") {
         $(".tab1").show();
         $("#tab1").attr("class", "tab on");
         //$("#tab1").attr("style", "background-color:orange");
      } else if (ssGrade2 == "JR") {
         $(".tab2").show();
         $("#tab2").attr("class", "tab on");
         //$("#tab2").attr("style", "background-color:orange");
      } else {
         $(".tab3").show();
         $("#tab3").attr("class", "tab on");
         //$("#tab3").attr("style", "background-color:orange");
      }
   }
   function sah(data) {
      $(".tab1").hide();
      $(".tab2").hide();
      $(".tab3").hide();
      $("#tab1").attr("class", "");
      $("#tab2").attr("class", "");
      $("#tab3").attr("class", "");
      $("#" + data).attr("class", "tab on");

      $("." + data).show();
   }
   function butColor(){
      for(var i=1;i<=3;i++){
         var JA = $("#JA"+i).val();
         var CM = $("#CM"+i).val();
         var JI = $("#JI"+i).val();
         var IH = $("#IH"+i).val();
         var VA = $("#VA"+i).val();
         if(JA == "검사결과보기"){$("#JA"+i).attr("style","background-color:orange");}else if(JA == "검사 불가"){$("#JA"+i).attr("style","background-color:lightgrey", "");}else{$("#JA"+i).attr("style","background-color:red");}
         if(CM == "검사결과보기"){$("#CM"+i).attr("style","background-color:orange");}else if(CM == "검사 불가"){$("#CM"+i).attr("style","background-color:lightgrey");}else{$("#CM"+i).attr("style","background-color:red");}
         if(JI == "검사결과보기"){$("#JI"+i).attr("style","background-color:orange");}else if(JI == "검사 불가"){$("#JI"+i).attr("style","background-color:lightgrey");}else{$("#JI"+i).attr("style","background-color:red");}
         if(IH == "검사결과보기"){$("#IH"+i).attr("style","background-color:orange");}else if(IH == "검사 불가"){$("#IH"+i).attr("style","background-color:lightgrey");}else{$("#IH"+i).attr("style","background-color:red");}
         if(VA == "검사결과보기"){$("#VA"+i).attr("style","background-color:orange");}else if(VA == "검사 불가"){$("#VA"+i).attr("style","background-color:lightgrey");}else{$("#VA"+i).attr("style","background-color:red");}
      }
   }
</script>
</head>
<style>
/* button */
.btn_wrap{text-align: center;clear:both;overflow:hidden;padding-top:20px;}
.btn_wrap a + a{margin-left:0;}
.btn_wrap .btn01{min-width:80px;}
a.btn01:hover{opacity: 0.8;}
a.btn01{padding:11px 12px;font-weight:400; display:inline-block;min-width:50px;border-radius:5px; text-align:center;font-size:16px;color: #303030;background: #ffffff;border: 1px solid #868686;opacity:1;}
a.btn01:active{transform:scale(0.95)}

a.btn01.col09{color: #fff;background:#179fec; border:1px solid #179fec;}


</style>


<body>
   <div id="wrap">

      <%@include file="/common/ssmMain/header_.jsp"%>

      <div class="subWrap">
         <nav include-html="/common/ssmMain/ssmCategory/cdSsideNav.html"></nav>
          <section>
          <div id="tit">
            <h1>진로검사</h1>
            <p>
               <a href="#">홈</a> > <a href="co01.asp">진로설계</a> > <a
                  href="co03.asp" class="on">진로검사</a>
            </p>
         </div>
         <div class="container">
            <div class="content">



            <form name="form" id="form">
               <input type="hidden" id="JAURL1" name="JAURL1"> 
               <input type="hidden" id="CMURL1" name="CMURL1"> 
               <input type="hidden" id="JIURL1" name="JIURL1"> 
               <input type="hidden" id="IHURL1" name="IHURL1"> 
               <input type="hidden" id="VAURL1" name="VAURL1"> 
               <input type="hidden" id="JAURL2" name="JAURL2"> 
               <input type="hidden" id="CMURL2" name="CMURL2"> 
               <input type="hidden" id="JIURL2" name="JIURL2">
               <input type="hidden" id="IHURL2" name="IHURL2"> 
               <input type="hidden" id="VAURL2" name="VAURL2"> 
               <input type="hidden" id="JAURL3" name="JAURL3"> 
               <input type="hidden" id="CMURL3" name="CMURL3"> 
               <input type="hidden" id="JIURL3" name="JIURL3"> 
               <input type="hidden" id="IHURL3" name="IHURL3"> 
               <input type="hidden" id="VAURL3" name="VAURL3">
                  
                  
               <!-- 탭버튼 -->
               <div class="tab_list" style="width: 100%;">
                  <ul>
                     <li id="tab1" class="tab" style="cursor: pointer;" value="1학년">1학년</li>
                     <li id="tab2" class="tab" style="cursor: pointer;"  value="2학년">2학년</li>
                     <li id="tab3" class="tab" style="cursor: pointer;" value="3학년">3학년</li>
                  </ul>
               </div>
         	   <!-- 탭버튼 -->   
               <table cellpadding="0" cellspacing="0" border="0" summary="개요" class="list_box mt_5">
                  <thead>
                     <tr class="tab1">
                        <th>직업적성검사</th>
                        <th><input type="button" class="result" id="JA1" name="JA1"   value="JA1"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab1">
                       <td colspan="2" style="text-align:left;">
                           적성이란, 특정 영역(학업, 업무 등)에서 능력을 발휘하는 잠재적인 가능성을 말합니다.이
                           검사는 직업과 관련된 다양한 능력을 여러분이 어느 정도 가지고 있는가를 스스로 진단하는 검사입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab1">
                        <th>진로성숙도검사</th>
                        <th><input type="button" class="result" id="CM1" name="CM1" value="CM1"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab1">
                       <td colspan="2" style="text-align:left;">
                           진로성숙도 검사는 여러분이 진로관련 문제를 해결하고 대처해 나갈 수 있도록 준비되어
                           있는지를 알아보기 위한 것입니다.진로성숙도는 여러분의 진로 선택과 결정에 대한 태도, 능력,행동을 갖춘 정도로,
                           진로성숙도 검사 결과를 통해 여러분의진로발달을 위해 어떠한 영역을 개발하는데 노력을 기울여야 하는지 확인하는데
                           도움이 될 것입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab1">
                        <th>직업흥미검사(K)</th>
                        <th><input type="button" class="result" id="JI1" name="JI1" value="JI1"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab1">
                        <td colspan="2" style="text-align:left;">
                           흥미란 어떤 종류의 활동에 대해서 개인이 가지고 있는 쾌, 불쾌, 수락, 거부의
                           경향성을 말하며 특히 직업흥미는 직업의 선택, 직업의 지속, 직업세계의 만족감, 직업에서의 성공등과 밀접히
                           관련됩니다.이 검사는 여러분이 어떤 종류의 일에 얼마나 흥미를 느끼고 있는가를 알아봄으로써, 장래에 자신에게 알맞은
                           직업을 탐색하는데 도움을 주기 위한 것입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab1">
                        <th>직업흥미검사(H)</th>
                        <th><input type="button" class="result" id="IH1" name="IH1" value="IH1"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab1">
                        <td colspan="2" style="text-align:left;">
                        흥미란 어떤 종류의 활동에 대해서 개인이 가지고 있는 쾌, 불쾌, 수락, 거부의
                        경향성을 말하며 특히 직업흥미는 직업의 선택, 직업의 지속, 직업세계의 만족감, 직업에서의 성공등과 밀접히
                        관련됩니다.이 검사는 여러분이 어떤 종류의 일에 얼마나 흥미를 느끼고 있는가를 알아봄으로써, 장래에 자신에게 알맞은
                        직업을 탐색하는데 도움을 주기 위한 것입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab1">
                        <th>직업가치관검사</th>
                     	<th><input type="button" class="result" id="VA1" name="VA1" value="VA1"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab1">
                        <td colspan="2" style="text-align:left;">
                        직업가치란 직업생활을 통하여 충족하고자 하는 욕구 또는 상대적으로 중요시하는 것을
                        의미합니다.이 검사는 직업과 관련된 다양한 욕구 및 가치들에 대해 여러분이 상대적으로 무엇을 얼마나 더 중요하게
                        여기는가를 살펴보고, 그 가치가 충족될 가능성이 높은 직업을 탐색할 수 있도록 도움을 주는 검사입니다
                     </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab2">
                        <th>직업적성검사</th>
                        <th><input type="button" class="result" id="JA2" name="JA2"   value="JA2"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab2">
                        <td colspan="2" style="text-align:left;">
                           적성이란, 특정 영역(학업, 업무 등)에서 능력을 발휘하는 잠재적인 가능성을 말합니다.이
                           검사는 직업과 관련된 다양한 능력을 여러분이 어느 정도 가지고 있는가를 스스로 진단하는 검사입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab2">
                        <th>진로성숙도검사</th>
                        <th><input type="button" class="result" id="CM2" name="CM2" value="CM2"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab2">
                        <td colspan="2" style="text-align:left;">
                           진로성숙도 검사는 여러분이 진로관련 문제를 해결하고 대처해 나갈 수 있도록 준비되어
                           있는지를 알아보기 위한 것입니다.진로성숙도는 여러분의 진로 선택과 결정에 대한 태도, 능력,행동을 갖춘 정도로,
                           진로성숙도 검사 결과를 통해 여러분의진로발달을 위해 어떠한 영역을 개발하는데 노력을 기울여야 하는지 확인하는데
                           도움이 될 것입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab2">
                        <th>직업흥미검사(K)</th>
                        <th><input type="button" class="result" id="JI2" name="JI2" value="JI2"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab2">
                        <td colspan="2" style="text-align:left;">
                           흥미란 어떤 종류의 활동에 대해서 개인이 가지고 있는 쾌, 불쾌, 수락, 거부의
                           경향성을 말하며 특히 직업흥미는 직업의 선택, 직업의 지속, 직업세계의 만족감, 직업에서의 성공등과 밀접히
                           관련됩니다.이 검사는 여러분이 어떤 종류의 일에 얼마나 흥미를 느끼고 있는가를 알아봄으로써, 장래에 자신에게 알맞은
                           직업을 탐색하는데 도움을 주기 위한 것입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab2">
                        <th>직업흥미검사(H)</th>
                        <th><input type="button" class="result" id="IH2" name="IH2" value="IH2"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab2">
                        <td colspan="2" style="text-align:left;">
                        흥미란 어떤 종류의 활동에 대해서 개인이 가지고 있는 쾌, 불쾌, 수락, 거부의
                        경향성을 말하며 특히 직업흥미는 직업의 선택, 직업의 지속, 직업세계의 만족감, 직업에서의 성공등과 밀접히
                        관련됩니다.이 검사는 여러분이 어떤 종류의 일에 얼마나 흥미를 느끼고 있는가를 알아봄으로써, 장래에 자신에게 알맞은
                        직업을 탐색하는데 도움을 주기 위한 것입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab2">
                        <th>직업가치관검사</th>
                        <th><input type="button" class="result" id="VA2" name="VA2" value="VA2"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab2">
                        <td colspan="2" style="text-align:left;">
	                        직업가치란 직업생활을 통하여 충족하고자 하는 욕구 또는 상대적으로 중요시하는 것을
	                        의미합니다.이 검사는 직업과 관련된 다양한 욕구 및 가치들에 대해 여러분이 상대적으로 무엇을 얼마나 더 중요하게
	                        여기는가를 살펴보고, 그 가치가 충족될 가능성이 높은 직업을 탐색할 수 있도록 도움을 주는 검사입니다
                     	</td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab3">
                        <th>직업적성검사</th>
                         <th><input type="button" class="result" id="JA3" name="JA3"   value="JA3"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab3">
                        <td colspan="2" style="text-align:left;">
                           적성이란, 특정 영역(학업, 업무 등)에서 능력을 발휘하는 잠재적인 가능성을 말합니다.이
                           검사는 직업과 관련된 다양한 능력을 여러분이 어느 정도 가지고 있는가를 스스로 진단하는 검사입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab3">
                        <th>진로성숙도검사</th>
                        <th><input type="button" class="result" id="CM3" name="CM3" value="CM3"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab3">
                        <td colspan="2" style="text-align:left;">
                           진로성숙도 검사는 여러분이 진로관련 문제를 해결하고 대처해 나갈 수 있도록 준비되어
                           있는지를 알아보기 위한 것입니다.진로성숙도는 여러분의 진로 선택과 결정에 대한 태도, 능력,행동을 갖춘 정도로,
                           진로성숙도 검사 결과를 통해 여러분의진로발달을 위해 어떠한 영역을 개발하는데 노력을 기울여야 하는지 확인하는데
                           도움이 될 것입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab3">
                        <th>직업흥미검사(K)</th>
                        <th><input type="button" class="result" id="JI3" name="JI3" value="JI3"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab3">
                        <td colspan="2" style="text-align:left;">
                           흥미란 어떤 종류의 활동에 대해서 개인이 가지고 있는 쾌, 불쾌, 수락, 거부의
                           경향성을 말하며 특히 직업흥미는 직업의 선택, 직업의 지속, 직업세계의 만족감, 직업에서의 성공등과 밀접히
                           관련됩니다.이 검사는 여러분이 어떤 종류의 일에 얼마나 흥미를 느끼고 있는가를 알아봄으로써, 장래에 자신에게 알맞은
                           직업을 탐색하는데 도움을 주기 위한 것입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab3">
                        <th>직업흥미검사(H)</th>
                        <th><input type="button" class="result" id="IH3" name="IH3" value="IH3"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab3">
                        <td colspan="2" style="text-align:left;">
                        흥미란 어떤 종류의 활동에 대해서 개인이 가지고 있는 쾌, 불쾌, 수락, 거부의
                        경향성을 말하며 특히 직업흥미는 직업의 선택, 직업의 지속, 직업세계의 만족감, 직업에서의 성공등과 밀접히
                        관련됩니다.이 검사는 여러분이 어떤 종류의 일에 얼마나 흥미를 느끼고 있는가를 알아봄으로써, 장래에 자신에게 알맞은
                        직업을 탐색하는데 도움을 주기 위한 것입니다.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab3">
                        <th>직업가치관검사</th>
                        <th><input type="button" class="result" id="VA3" name="VA3" value="VA3"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab3">
                        <td colspan="2" style="text-align:left;">
                        직업가치란 직업생활을 통하여 충족하고자 하는 욕구 또는 상대적으로 중요시하는 것을
                        의미합니다.이 검사는 직업과 관련된 다양한 욕구 및 가치들에 대해 여러분이 상대적으로 무엇을 얼마나 더 중요하게
                        여기는가를 살펴보고, 그 가치가 충족될 가능성이 높은 직업을 탐색할 수 있도록 도움을 주는 검사입니다
                     </td>
                     </tr>
                  </tbody>
               </table>
            </form>



            <form name="def" id="def" method="post"></form>


</div>
</div>
         
         </section>
      </div>
      <footer include-html="/common/ssmMain/footer.html"></footer>
      <script type="text/javascript">
         includeHTML();
      </script>
   </div>
</body>
</html>