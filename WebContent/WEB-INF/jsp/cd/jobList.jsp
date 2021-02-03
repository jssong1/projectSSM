<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ssm.cd.vo.*" %>
<%@ page import="java.lang.Math" %>
<%
   request.setCharacterEncoding("UTF-8");
   Object obj             = null;
   Object obj2            = null;
   Object obj3            = null;
   List list              = null;
   String jdNo            = "";
   String profession      = "";
   String summary         = "";
   String similarJob      = "";
   String salary          = "";
   String jobDicSeq       = "";
   String equalEmployment = "";
   String totalCount      = "";
   String ATCode          = "";
   String prospect        = "";
   String JCCode          = "";
   String JCode           = "";
   String job             = "";
   String possibility     = "";
   String listSize   = "";
   int curPage       = 0;
   String resCount   = "";
   String rowNum     = "";
   double dTC        = 0.0;
   double dLS        = 0.0;
   double dRes       = 0.0;
   int cRes          = 0;
   int iLS           = 0;
   String go = "";
   String go1 = "";
   String go2 = "";
   String JCCodee1 = "";
   String JCCodee2 = "";
   String JCCodee3 = "";
   String JCCodee4 = "";
   String JCCodee5 = "";
   String JCCodee6 = "";
   String JCCodee7 = "";
   String JCCodee8 = "";
   String JCCodee9 = "";
   String JCCodee10 = "";
   String JCCodee11 = "";
   String JCCodee12 = "";
   String JCCodee13 = "";
   String JCCodee14 = "";
   String JCCodee15 = "";
   String JCCodee16 = "";
   String JCCodee17 = "";
   String JCCodee18 = "";
   String JCCodee19 = "";
   String JCCodee20 = "";
   String JCCodee21 = "";
   String JCCodee22 = "";
   String JCCodee23 = "";
   String JCCodee24 = "";
   String JCCodee25 = "";
   String JCCodee26 = "";
   String JCCodee27 = "";
   String JCCodee28 = "";
   String JCCodee29 = "";
   String JCCodee30 = "";
   String JCCodee31 = "";
   String JCCodee32 = "";
   String JCCodee33 = "";
   String JCCodee34 = "";
   String JCCodee35 = "";
   
   String ATCodee1 = "";
   String ATCodee2 = "";
   String ATCodee3 = "";
   String ATCodee4 = "";
   String ATCodee5 = "";
   String ATCodee6 = "";
   String ATCodee7 = "";
   String ATCodee8 = "";
   String ATCodee9 = "";
   String ATCodee10 = "";
   String ATCodee11 = "";
   String ATCodee12 = "";
   String ATCodee13 = "";
   String ATCodee14 = "";
   String ATCodee15 = "";
   String ATCodee16 = "";
   String ATCodee17 = "";
   String ATCodee18 = "";
   String ATCodee19 = "";
   String ATCodee20 = "";
   String ATCodee21 = "";
   String ATCodee22 = "";
   String ATCodee23 = "";
   String ATCodee24 = "";
   String ATCodee25 = "";
   String ATCodee26 = "";
   String ATCodee27 = "";
   String ATCodee28 = "";
   String ATCodee29 = "";
   String ATCodee30 = "";
   String ATCodee31 = "";
   String ATCodee32 = "";
   String ATCodee33 = "";
   String ATCodee34 = "";
   String ATCodee35 = "";
   String ATCodee36 = "";
   String ATCodee37 = "";
   String ATCodee38 = "";
   String ATCodee39 = "";
   String ATCodee40 = "";
   String ATCodee41 = "";
   String ATCodee42 = "";
   String ATCodee43 = "";
   String salaryy = "";
   String prospectt = "";
   String possibilityy = "";
   String equalemploymentt = "";
   obj = request.getAttribute("list");
   obj2 = request.getAttribute("saveData");
   obj3 = request.getAttribute("saveData2");
   if(obj != null){
      list = (List)obj; 
      Job_DataVO jdvo = (Job_DataVO)list.get(0);
      totalCount = jdvo.getResCount();
      curPage = Integer.parseInt(jdvo.getCurPage());
      
      //--saveData : Major_DataVO --////////////////////////////////////////////////////////////////
      Job_DataVO jdvo2 = (Job_DataVO)obj2;
      listSize = jdvo2.getListSize();
      dTC = Double.valueOf(totalCount);
      dLS = Double.valueOf(listSize);
      dRes = Math.ceil(dTC/dLS);
      cRes =  (int)dRes;
      iLS  =  (int)dLS; 
      go = jdvo2.getGo();
      go1 = jdvo2.getGo1();
      go2 = jdvo2.getGo2();
   }
   if(obj3 != null){
      J_DataVO jvo = (J_DataVO)obj3;
      
      JCCodee1 = jvo.getJCCodee1();
      JCCodee2 = jvo.getJCCodee2();
      JCCodee3 = jvo.getJCCodee3();
      JCCodee4 = jvo.getJCCodee4();
      JCCodee5 = jvo.getJCCodee5();
      JCCodee6 = jvo.getJCCodee6();
      JCCodee7 = jvo.getJCCodee7();
      JCCodee8 = jvo.getJCCodee8();
      JCCodee9 = jvo.getJCCodee9();
      JCCodee10 = jvo.getJCCodee10();
      JCCodee11 = jvo.getJCCodee11();
      JCCodee12 = jvo.getJCCodee12();
      JCCodee13 = jvo.getJCCodee13();
      JCCodee14 = jvo.getJCCodee14();
      JCCodee15 = jvo.getJCCodee15();
      JCCodee16 = jvo.getJCCodee16();
      JCCodee17 = jvo.getJCCodee17();
      JCCodee18 = jvo.getJCCodee18();
      JCCodee19 = jvo.getJCCodee19();
      JCCodee20 = jvo.getJCCodee20();
      JCCodee21 = jvo.getJCCodee21();
      JCCodee22 = jvo.getJCCodee22();
      JCCodee23 = jvo.getJCCodee23();
      JCCodee24 = jvo.getJCCodee24();
      JCCodee25 = jvo.getJCCodee25();
      JCCodee26 = jvo.getJCCodee26();
      JCCodee27 = jvo.getJCCodee27();
      JCCodee28 = jvo.getJCCodee28();
      JCCodee29 = jvo.getJCCodee29();
      JCCodee30 = jvo.getJCCodee30();
      JCCodee31 = jvo.getJCCodee31();
      JCCodee32 = jvo.getJCCodee32();
      JCCodee33 = jvo.getJCCodee33();
      JCCodee34 = jvo.getJCCodee34();
      JCCodee35 = jvo.getJCCodee35();
      
      ATCodee1 = jvo.getATCodee1();
      ATCodee2 = jvo.getATCodee2();
      ATCodee3 = jvo.getATCodee3();
      ATCodee4 = jvo.getATCodee4();
      ATCodee5 = jvo.getATCodee5();
      ATCodee6 = jvo.getATCodee6();
      ATCodee7 = jvo.getATCodee7();
      ATCodee8 = jvo.getATCodee8();
      ATCodee9 = jvo.getATCodee9();
      ATCodee10 = jvo.getATCodee10();
      ATCodee11 = jvo.getATCodee11();
      ATCodee12 = jvo.getATCodee12();
      ATCodee13 = jvo.getATCodee13();
      ATCodee14 = jvo.getATCodee14();
      ATCodee15 = jvo.getATCodee15();
      ATCodee16 = jvo.getATCodee16();
      ATCodee17 = jvo.getATCodee17();
      ATCodee18 = jvo.getATCodee18();
      ATCodee19 = jvo.getATCodee19();
      ATCodee20 = jvo.getATCodee20();
      ATCodee21 = jvo.getATCodee21();
      ATCodee22 = jvo.getATCodee22();
      ATCodee23 = jvo.getATCodee23();
      ATCodee24 = jvo.getATCodee24();
      ATCodee25 = jvo.getATCodee25();
      ATCodee26 = jvo.getATCodee26();
      ATCodee27 = jvo.getATCodee27();
      ATCodee28 = jvo.getATCodee28();
      ATCodee29 = jvo.getATCodee29();
      ATCodee30 = jvo.getATCodee30();
      ATCodee31 = jvo.getATCodee31();
      ATCodee32 = jvo.getATCodee32();
      ATCodee33 = jvo.getATCodee33();
      ATCodee34 = jvo.getATCodee34();
      ATCodee35 = jvo.getATCodee35();
      ATCodee36 = jvo.getATCodee36();
      ATCodee37 = jvo.getATCodee37();
      ATCodee38 = jvo.getATCodee38();
      ATCodee39 = jvo.getATCodee39();
      ATCodee40 = jvo.getATCodee40();
      ATCodee41 = jvo.getATCodee41();
      ATCodee42 = jvo.getATCodee42();
      ATCodee43 = jvo.getATCodee43();
      
      salaryy = jvo.getSalaryy();
      prospectt = jvo.getProspectt();
      possibilityy = jvo.getPossibilityy();
      equalemploymentt = jvo.getEqualemploymentt();
   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>jobList.jsp</title>
      <link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
       <link rel="stylesheet" href="/common/ssmCss/default.css">
       <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
       <link rel="stylesheet" href="/common/ssmCss/s_base.css">
      <link rel="stylesheet" href="/common/ssmCss/s_content.css">
      <link rel="stylesheet" href="/common/ssmCss/s_layout.css">
        <link rel="stylesheet" href="/common/ssmCss/cd.css">
       <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
       <script src="/common/ssmJs/goCategory.js"></script>
       <script src="/common/ssmJs/index.js"></script>
       <script src="/common/ssmJs/goBoard.js"></script>
       <script src="/common/ssmJs/goLogin.js"></script>
      <script type="text/javascript">
         $(function(){
            val();
            hideshow('tab1','a');
            $("#go #go1 #go2").val("");
            $("#listSize").val(<%=listSize%>);
            $("#curPage").val(<%=curPage%>);
            var cp = $("#curPage").val();
            $("#curPage"+cp).attr("style","background-color:orange");
            but();
            $(".curPage").click(function(){
               abc();
               $("#listSize").val(<%=listSize%>);
               var ss = $(this).val();
               $("#curPage").val(ss);
               $("#form").attr("action","/test/jobList.ssm").submit();
            });
            $("#next").click(function(){
               abc();
               var page = $("#curPage").val();
               if(page <= 10){$("#curPage").val(Number(11));}
               else if(page <= 20){$("#curPage").val(Number(21));}
               else if(page <= 30){$("#curPage").val(Number(31));}
               else if(page <= 40){$("#curPage").val(Number(41));}
               else if(page <= 50){$("#curPage").val(Number(51));}
               $("#listSize").val(<%=listSize%>);
               $("#form").attr("action","/test/jobList.ssm").submit();
            });
            $("#last").click(function(){
               abc();
               $("#listSize").val(<%=listSize%>);
               $("#curPage").val(<%=cRes%>);
               $("#form").attr("action","/test/jobList.ssm").submit();
            });
            $("#prev").click(function(){
               abc();
               $("#listSize").val(<%=listSize%>);
               var page = $("#curPage").val();
               if(page <= 20){$("#curPage").val(Number(1));}
               else if(page <= 30){$("#curPage").val(Number(11));}
               else if(page <= 40){$("#curPage").val(Number(21));}
               else if(page <= 50){$("#curPage").val(Number(31));}
               $("#form").attr("action","/test/jobList.ssm").submit();
            });
            $("#first").click(function(){
               abc();
               $("#listSize").val(<%=listSize%>);
               $("#curPage").val(Number(1));
               $("#form").attr("action","/test/jobList.ssm").submit();
            });
            $("#reFresh").click(function(){
               abc();
               $("#curPage").val(Number(1));
               $("#form").attr("action","/test/jobList.ssm").submit();
            });
            $("#result").click(function(){
               os();
               abc();
               $("#curPage").val(Number(1));
               $("#form").attr("action","/test/jobList.ssm").submit();
            });
            $("#go0").click(function(){
               if($("#go0").prop("checked")){
                  $("#go0").prop("checked",true);
                  for(var i=1;i<=35;i++){
                     $("#JCCodee"+i).prop("checked",true);
                  }
               }else{
                  $("#go0").prop("checked",false);
                  for(var i=1;i<=35;i++){
                     $("#JCCodee"+i).prop("checked",false);
                  }
               }
            });
         });
         function abc(){
            $("#go").val("");
            $("#go1").val("");
            $("#go2").val("");
            for(var i=1;i<=35;i++){
               if($("#JCCode"+i).val()){
                  $("#go").val("go");
                  break;
               }
            }
            
            if($("#ssalary").val()){$("#go1").val("go1");}
            if($("#pprospect").val()){$("#go1").val("go1");}
            if($("#ppossibility").val()){$("#go1").val("go1");}
            if($("#eequalemployment").val()){$("#go1").val("go1");}
            
            for(var i=1;i<=43;i++){
               if($("#ATCode"+i).val()){
                  $("#go2").val("go2");
                  break;
               }
            }
         }
         function but(){
            var page = $("#curPage").val();
            var total =<%=cRes%>;
            if(page <=10){
               $("#prev").hide();
               $("#first").hide();
               if(total<=10){
                  $("#next").hide();
                  $("#last").hide();
               }
            }
            if(page <=20 && page >= 11){
               if(total<=20){
                  $("#next").hide();
                  $("#last").hide();
               }
            }
            if(page <=30 && page >= 21){
               if(total<=30){
                  $("#next").hide();
                  $("#last").hide();
               }
            }
            if(page <=40 && page >= 31){
               if(total<=40){
                  $("#next").hide();
                  $("#last").hide();
               }
            }
            if(page <=50 && page >= 41){
               if(total<=50){
                  $("#next").hide();
                  $("#last").hide();
               }
            }
            if(page <=60 && page >= 51){
               if(total<=60){
                  $("#next").hide();
                  $("#last").hide();
               }
            }
         }
         function jobDetail(data){
            location.href="/test/jobDetail.ssm?jobDicSeq="+data+"";
         }
         function hideshow(data,data2){
            $(".tab1").hide()
            $(".tab2").hide()
            $(".tab3").hide()
            if(data2 == 'a'){
               if($("#go").val() != ""){data  = "tab1";}
               if($("#go1").val() != ""){data = "tab2";}
               if($("#go2").val() != ""){data = "tab3";}
            }
            
            if(data == "tab2" || data == "tab3" || data2 == "b"){
               $("#go0").prop("checked",false);
               for(var i=1;i<=35;i++){
                  $("#JCCodee"+i).prop("checked",false);
               }
            }
            if(data == "tab1" || data == "tab3" || data2 == "b"){
                for(var i=1;i<=4;i++){
                   $("#all"+i).prop("checked",true);
                }
            }
            if(data == "tab1" || data == "tab2" || data2 == "b"){
               for(var i=1;i<=43;i++){
                  $("#ATCodee"+i).prop("checked",false);
               }
            }
            if(data == "tab1"){
               document.getElementById('tab1').className = "on";
               document.getElementById('tab2').className = "";
               document.getElementById('tab3').className = "";
               $(".tab1").show()
            }
            if(data == "tab2"){
               document.getElementById('tab1').className = "";
               document.getElementById('tab2').className = "on";
               document.getElementById('tab3').className = "";
               $(".tab2").show()
            }
            if(data == "tab3"){
               document.getElementById('tab1').className = "";
               document.getElementById('tab2').className = "";
               document.getElementById('tab3').className = "on";
               $(".tab3").show()
            }
         }
         function val(){
            if("<%=go%>" != 'null'){$("#go").val("<%=go%>");}
            if("<%=go1%>" != 'null'){$("#go1").val("<%=go1%>");}
            if("<%=go2%>" != 'null'){$("#go2").val("<%=go2%>");}
            if("<%=JCCodee1%>" != 'null'){$("#JCCodee1").prop("checked",true); }
            if("<%=JCCodee2%>" != 'null'){$("#JCCodee2").prop("checked",true); }
            if("<%=JCCodee3%>" != 'null'){$("#JCCodee3").prop("checked",true); }
            if("<%=JCCodee4%>" != 'null'){$("#JCCodee4").prop("checked",true); }
            if("<%=JCCodee5%>" != 'null'){$("#JCCodee5").prop("checked",true); }
            if("<%=JCCodee6%>" != 'null'){$("#JCCodee6").prop("checked",true); }
            if("<%=JCCodee7%>" != 'null'){$("#JCCodee7").prop("checked",true); }
            if("<%=JCCodee8%>" != 'null'){$("#JCCodee8").prop("checked",true); }
            if("<%=JCCodee9%>" != 'null'){$("#JCCodee9").prop("checked",true); }
            if("<%=JCCodee10%>" != 'null'){$("#JCCodee10").prop("checked",true); }
            if("<%=JCCodee11%>" != 'null'){$("#JCCodee11").prop("checked",true); }
            if("<%=JCCodee12%>" != 'null'){$("#JCCodee12").prop("checked",true); }
            if("<%=JCCodee13%>" != 'null'){$("#JCCodee13").prop("checked",true); }
            if("<%=JCCodee14%>" != 'null'){$("#JCCodee14").prop("checked",true); }
            if("<%=JCCodee15%>" != 'null'){$("#JCCodee15").prop("checked",true); }
            if("<%=JCCodee16%>" != 'null'){$("#JCCodee16").prop("checked",true); }
            if("<%=JCCodee17%>" != 'null'){$("#JCCodee17").prop("checked",true); }
            if("<%=JCCodee18%>" != 'null'){$("#JCCodee18").prop("checked",true); }
            if("<%=JCCodee19%>" != 'null'){$("#JCCodee19").prop("checked",true); }
            if("<%=JCCodee20%>" != 'null'){$("#JCCodee20").prop("checked",true); }
            if("<%=JCCodee21%>" != 'null'){$("#JCCodee21").prop("checked",true); }
            if("<%=JCCodee22%>" != 'null'){$("#JCCodee22").prop("checked",true); }
            if("<%=JCCodee23%>" != 'null'){$("#JCCodee23").prop("checked",true); }
            if("<%=JCCodee24%>" != 'null'){$("#JCCodee24").prop("checked",true); }
            if("<%=JCCodee25%>" != 'null'){$("#JCCodee25").prop("checked",true); }
            if("<%=JCCodee26%>" != 'null'){$("#JCCodee26").prop("checked",true); }
            if("<%=JCCodee27%>" != 'null'){$("#JCCodee27").prop("checked",true); }
            if("<%=JCCodee28%>" != 'null'){$("#JCCodee28").prop("checked",true); }
            if("<%=JCCodee29%>" != 'null'){$("#JCCodee29").prop("checked",true); }
            if("<%=JCCodee30%>" != 'null'){$("#JCCodee30").prop("checked",true); }
            if("<%=JCCodee31%>" != 'null'){$("#JCCodee31").prop("checked",true); }
            if("<%=JCCodee32%>" != 'null'){$("#JCCodee32").prop("checked",true); }
            if("<%=JCCodee33%>" != 'null'){$("#JCCodee33").prop("checked",true); }
            if("<%=JCCodee34%>" != 'null'){$("#JCCodee34").prop("checked",true); }
            if("<%=JCCodee35%>" != 'null'){$("#JCCodee35").prop("checked",true); }
            if("<%=ATCodee1%>" != 'null'){$("#ATCodee1").prop("checked",true); }
            if("<%=ATCodee2%>" != 'null'){$("#ATCodee2").prop("checked",true); }
            if("<%=ATCodee3%>" != 'null'){$("#ATCodee3").prop("checked",true); }
            if("<%=ATCodee4%>" != 'null'){$("#ATCodee4").prop("checked",true); }
            if("<%=ATCodee5%>" != 'null'){$("#ATCodee5").prop("checked",true); }
            if("<%=ATCodee6%>" != 'null'){$("#ATCodee6").prop("checked",true); }
            if("<%=ATCodee7%>" != 'null'){$("#ATCodee7").prop("checked",true); }
            if("<%=ATCodee8%>" != 'null'){$("#ATCodee8").prop("checked",true); }
            if("<%=ATCodee9%>" != 'null'){$("#ATCodee9").prop("checked",true); }
            if("<%=ATCodee10%>" != 'null'){$("#ATCodee10").prop("checked",true); }
            if("<%=ATCodee11%>" != 'null'){$("#ATCodee11").prop("checked",true); }
            if("<%=ATCodee12%>" != 'null'){$("#ATCodee12").prop("checked",true); }
            if("<%=ATCodee13%>" != 'null'){$("#ATCodee13").prop("checked",true); }
            if("<%=ATCodee14%>" != 'null'){$("#ATCodee14").prop("checked",true); }
            if("<%=ATCodee15%>" != 'null'){$("#ATCodee15").prop("checked",true); }
            if("<%=ATCodee16%>" != 'null'){$("#ATCodee16").prop("checked",true); }
            if("<%=ATCodee17%>" != 'null'){$("#ATCodee17").prop("checked",true); }
            if("<%=ATCodee18%>" != 'null'){$("#ATCodee18").prop("checked",true); }
            if("<%=ATCodee19%>" != 'null'){$("#ATCodee19").prop("checked",true); }
            if("<%=ATCodee20%>" != 'null'){$("#ATCodee20").prop("checked",true); }
            if("<%=ATCodee21%>" != 'null'){$("#ATCodee21").prop("checked",true); }
            if("<%=ATCodee22%>" != 'null'){$("#ATCodee22").prop("checked",true); }
            if("<%=ATCodee23%>" != 'null'){$("#ATCodee23").prop("checked",true); }
            if("<%=ATCodee24%>" != 'null'){$("#ATCodee24").prop("checked",true); }
            if("<%=ATCodee25%>" != 'null'){$("#ATCodee25").prop("checked",true); }
            if("<%=ATCodee26%>" != 'null'){$("#ATCodee26").prop("checked",true); }
            if("<%=ATCodee27%>" != 'null'){$("#ATCodee27").prop("checked",true); }
            if("<%=ATCodee28%>" != 'null'){$("#ATCodee28").prop("checked",true); }
            if("<%=ATCodee29%>" != 'null'){$("#ATCodee29").prop("checked",true); }
            if("<%=ATCodee30%>" != 'null'){$("#ATCodee30").prop("checked",true); }
            if("<%=ATCodee31%>" != 'null'){$("#ATCodee31").prop("checked",true); }
            if("<%=ATCodee32%>" != 'null'){$("#ATCodee32").prop("checked",true); }
            if("<%=ATCodee33%>" != 'null'){$("#ATCodee33").prop("checked",true); }
            if("<%=ATCodee34%>" != 'null'){$("#ATCodee34").prop("checked",true); }
            if("<%=ATCodee35%>" != 'null'){$("#ATCodee35").prop("checked",true); }
            if("<%=ATCodee36%>" != 'null'){$("#ATCodee36").prop("checked",true); }
            if("<%=ATCodee37%>" != 'null'){$("#ATCodee37").prop("checked",true); }
            if("<%=ATCodee38%>" != 'null'){$("#ATCodee38").prop("checked",true); }
            if("<%=ATCodee39%>" != 'null'){$("#ATCodee39").prop("checked",true); }
            if("<%=ATCodee40%>" != 'null'){$("#ATCodee40").prop("checked",true); }
            if("<%=ATCodee41%>" != 'null'){$("#ATCodee41").prop("checked",true); }
            if("<%=ATCodee42%>" != 'null'){$("#ATCodee42").prop("checked",true); }
            if("<%=ATCodee43%>" != 'null'){$("#ATCodee43").prop("checked",true); }
            if("<%=salaryy%>" != 'null'){
               for(var i=1;i<=4;i++){
                  if($("#salaryy"+i).val() == "<%=salaryy%>"){
                     $("#salaryy"+i).prop("checked",true);
                     break;
                  } 
               }
            }
            if("<%=prospectt%>" != 'null'){
               for(var i=1;i<=4;i++){
                  if($("#prospectt"+i).val() == "<%=prospectt%>"){
                     $("#prospectt"+i).prop("checked",true);
                     break;
                  } 
               }
            }
            if("<%=possibilityy%>" != 'null'){
               for(var i=1;i<=4;i++){
                  if($("#possibilityy"+i).val() == "<%=possibilityy%>"){
                     $("#possibilityy"+i).prop("checked",true);
                     break;
                  } 
               }
            }
            if("<%=equalemploymentt%>" != 'null'){
               for(var i=1;i<=4;i++){
                  if($("#equalemploymentt"+i).val() == "<%=equalemploymentt%>"){
                     $("#equalemploymentt"+i).prop("checked",true);
                     break;
                  } 
               }
            }
         }
         function os(){
            for(var i=1;i<=35;i++){
               if($("#JCCodee"+i).prop("checked")){var aa = $("#JCCodee"+i).val();$("#JCCode"+i).val(aa);
               }else{$("#JCCode"+i).val("");}
            }
            for(var i=1;i<=43;i++){
               if($("#ATCodee"+i).prop("checked")){var aa = $("#ATCodee"+i).val();$("#ATCode"+i).val(aa);
               }else{$("#ATCode"+i).val("");}
            }
            for(var i=1;i<=4;i++){
               if($("input[id='salaryy"+i+"']:checked").val() != null){
                  var a1 = $("input[id='salaryy"+i+"']:checked").val();
                  $("#ssalary").val(a1);
               }
               if($("input[id='prospectt"+i+"']:checked").val() != null){
                  var a2 = $("input[id='prospectt"+i+"']:checked").val();
                  $("#pprospect").val(a2);
               }
               if($("input[id='possibilityy"+i+"']:checked").val() != null){
                  var a3 = $("input[id='possibilityy"+i+"']:checked").val();
                  $("#ppossibility").val(a3);
               }
               if($("input[id='equalemploymentt"+i+"']:checked").val() != null){
                  var a4 = $("input[id='equalemploymentt"+i+"']:checked").val();
                  $("#eequalemployment").val(a4);
               }
               
            }
         }
      </script>
      <style type="text/css">
      table {
            width:1150px;
         }
         a {
            text-decoration: none;
         }
      </style>
   </head>
   <body>
      <div id="wrap">

      <%@include file="/common/ssmMain/header_.jsp"%>

      <div class="subWrap">
         <%if(sessionAU.equals("1")){ System.out.println("학생네비");%>
            <nav include-html="/common/ssmMain/ssmCategory/cdSsideNav.html"></nav>
         <%}else{ System.out.println("교사네비");%>
            <nav include-html="/common/ssmMain/ssmCategory/cdTsideNav.html"></nav>
         <% } %>
            
         
      <%--   <div id="tit">
            <h1>직업정보검색</h1>
            <p>
               <a href="#">홈</a> > <a href="co01.asp">진로설계</a> > <a
                  href="co03.asp" class="on">직업정보검색</a>
            </p>
         </div> --%>
         <section>
         <div id="tit">
               <h1>직업정보검색</h1>
               <p><a href="/chwc/index.asp">홈</a> > <a href="#메인주소">진로설계</a> > <a
                  href="#주소걸기" class="on">직업정보검색</a>
            </p>
         </div>
         <div class="container">
            <div class="content">
         
            <div class="contentbox">
            
      <form name="form" id="form" method="post">
         <input type="hidden" name="curPage" id="curPage">
         <input type="hidden" name="go" id="go">
         <input type="hidden" name="go1" id="go1">
         <input type="hidden" name="go2" id="go2">
         <input type="hidden" name="JCCode1" id="JCCode1" >
         <input type="hidden" name="JCCode2" id="JCCode2" >
         <input type="hidden" name="JCCode3" id="JCCode3" >
         <input type="hidden" name="JCCode4" id="JCCode4" >
         <input type="hidden" name="JCCode5" id="JCCode5" >
         <input type="hidden" name="JCCode6" id="JCCode6" >
         <input type="hidden" name="JCCode7" id="JCCode7" >
         <input type="hidden" name="JCCode8" id="JCCode8" >
         <input type="hidden" name="JCCode9" id="JCCode9" >
         <input type="hidden" name="JCCode10" id="JCCode10" >
         <input type="hidden" name="JCCode11" id="JCCode11" >
         <input type="hidden" name="JCCode12" id="JCCode12" >
         <input type="hidden" name="JCCode13" id="JCCode13" >
         <input type="hidden" name="JCCode14" id="JCCode14" >
         <input type="hidden" name="JCCode15" id="JCCode15" >
         <input type="hidden" name="JCCode16" id="JCCode16" >
         <input type="hidden" name="JCCode17" id="JCCode17" >
         <input type="hidden" name="JCCode18" id="JCCode18" >
         <input type="hidden" name="JCCode19" id="JCCode19" >
         <input type="hidden" name="JCCode20" id="JCCode20" >
         <input type="hidden" name="JCCode21" id="JCCode21" >
         <input type="hidden" name="JCCode22" id="JCCode22" >
         <input type="hidden" name="JCCode23" id="JCCode23" >
         <input type="hidden" name="JCCode24" id="JCCode24" >
         <input type="hidden" name="JCCode25" id="JCCode25" >
         <input type="hidden" name="JCCode26" id="JCCode26" >
         <input type="hidden" name="JCCode27" id="JCCode27" >
         <input type="hidden" name="JCCode28" id="JCCode28" >
         <input type="hidden" name="JCCode29" id="JCCode29" >
         <input type="hidden" name="JCCode30" id="JCCode30" >
         <input type="hidden" name="JCCode31" id="JCCode31" >
         <input type="hidden" name="JCCode32" id="JCCode32" >
         <input type="hidden" name="JCCode33" id="JCCode33" >
         <input type="hidden" name="JCCode34" id="JCCode34" >
         <input type="hidden" name="JCCode35" id="JCCode35" >
         
         <input type="hidden" name="ssalary" id="ssalary">
         <input type="hidden" name="pprospect" id="pprospect">
         <input type="hidden" name="ppossibility" id="ppossibility">
         <input type="hidden" name="eequalemployment" id="eequalemployment">

         <input type="hidden" name="ATCode1" id="ATCode1">
         <input type="hidden" name="ATCode2" id="ATCode2">
         <input type="hidden" name="ATCode3" id="ATCode3">
         <input type="hidden" name="ATCode4" id="ATCode4">
         <input type="hidden" name="ATCode5" id="ATCode5">
         <input type="hidden" name="ATCode6" id="ATCode6">
         <input type="hidden" name="ATCode7" id="ATCode7">
         <input type="hidden" name="ATCode8" id="ATCode8">
         <input type="hidden" name="ATCode9" id="ATCode9">
         <input type="hidden" name="ATCode10" id="ATCode10">
         <input type="hidden" name="ATCode11" id="ATCode11">
         <input type="hidden" name="ATCode12" id="ATCode12">
         <input type="hidden" name="ATCode13" id="ATCode13">
         <input type="hidden" name="ATCode14" id="ATCode14">
         <input type="hidden" name="ATCode15" id="ATCode15">
         <input type="hidden" name="ATCode16" id="ATCode16">
         <input type="hidden" name="ATCode17" id="ATCode17">
         <input type="hidden" name="ATCode18" id="ATCode18">
         <input type="hidden" name="ATCode19" id="ATCode19">
         <input type="hidden" name="ATCode20" id="ATCode20">
         <input type="hidden" name="ATCode21" id="ATCode21">
         <input type="hidden" name="ATCode22" id="ATCode22">
         <input type="hidden" name="ATCode23" id="ATCode23">
         <input type="hidden" name="ATCode24" id="ATCode24">
         <input type="hidden" name="ATCode25" id="ATCode25">
         <input type="hidden" name="ATCode26" id="ATCode26">
         <input type="hidden" name="ATCode27" id="ATCode27">
         <input type="hidden" name="ATCode28" id="ATCode28">
         <input type="hidden" name="ATCode29" id="ATCode29">
         <input type="hidden" name="ATCode30" id="ATCode30">
         <input type="hidden" name="ATCode31" id="ATCode31">
         <input type="hidden" name="ATCode32" id="ATCode32">
         <input type="hidden" name="ATCode33" id="ATCode33">
         <input type="hidden" name="ATCode34" id="ATCode34">
         <input type="hidden" name="ATCode35" id="ATCode35">
         <input type="hidden" name="ATCode36" id="ATCode36">
         <input type="hidden" name="ATCode37" id="ATCode37">
         <input type="hidden" name="ATCode38" id="ATCode38">
         <input type="hidden" name="ATCode39" id="ATCode39">
         <input type="hidden" name="ATCode40" id="ATCode40">
         <input type="hidden" name="ATCode41" id="ATCode41">
         <input type="hidden" name="ATCode42" id="ATCode42">
         <input type="hidden" name="ATCode43" id="ATCode43">


         <div class="checkbox mt_10"  >
            <table cellpadding="0" cellspacing="0" border="0" 
                        class="view_box2">
            <!-- 탭버튼 -->
               <div class="tab_list" style="width: 100%;">
                  <ul>
               
                     <li id="tab1" class="on" style="cursor: pointer;" onclick="hideshow('tab1','b')"><label>직업분류</label></li>
                     <li id="tab2" style="cursor: pointer;" onclick="hideshow('tab2','b')"><label>조건검색</label></li>
                     <li id="tab3" style="cursor: pointer;" onclick="hideshow('tab3','b')"><label>적성유형별 탐색</label></li>
                  </ul>
               </div>
         <!-- 탭버튼 -->   
            <tr class="tab1"><th colspan="4" align="center"><h3>직업분류</h3></th></tr>
            <tr class="tab1">
            <td style="text-align : left;" colspan="4" >
               <span ><input type="checkbox" name="go0" id="go0" value="전체"><label>전체</label></span> 
               <span ><input type="checkbox" name="JCCodee1" id="JCCodee1" value="100041"><label>관리직(임원·부서장)</label></span> 
               <span ><input type="checkbox" name="JCCodee2" id="JCCodee2" value="100042"><label>경영·행정·사무직</label></span> 
               <span><input type="checkbox" name="JCCodee3" id="JCCodee3" value="100043"><label>금융·보험직</label></span> 
            </td>
            </tr>
            <tr class="tab1">
            <td style="text-align : left;" colspan="4" >
               <span><input type="checkbox" name="JCCodee4" id="JCCodee4" value="105096"><label>인문·사회과학 연구직</label></span>
               <span><input type="checkbox" name="JCCodee5" id="JCCodee5" value="105097"><label>자연·생명과학 연구직</label></span>
               <span><input type="checkbox" name="JCCodee9" id="JCCodee9" value="105101"><label>교육직</label></span>
               <span><input type="checkbox" name="JCCodee10" id="JCCodee10" value="105102"><label>법률직</label></span>
               
            </td>
            </tr>
            <tr class="tab1">
               <td  colspan="4" >
               <span><input type="checkbox" name="JCCodee6" id="JCCodee6" value="105098"><label>정보통신 연구개발직 및 <br>&nbsp;&nbsp;공학기술직</label></span>
               <span><input type="checkbox" name="JCCodee7" id="JCCodee7" value="105099"><label>건설·채굴 연구개발직 및 <br>&nbsp;&nbsp;공학기술직</label></span>
               <span><input type="checkbox" name="JCCodee8" id="JCCodee8" value="105100"><label>제조 연구개발직 및 <br>&nbsp;&nbsp;공학기술직</label></span>
               <span><input type="checkbox" name="JCCodee11" id="JCCodee11" value="100047"><label>사회복지·종교직</label></span>
               </td>
            </tr>
            <tr class="tab1">
               <td  colspan="4" >
                  <span><input type="checkbox" name="JCCodee12" id="JCCodee12" value="105103"><label>경찰·소방·교도직</label></span>
                  <span><input type="checkbox" name="JCCodee13" id="JCCodee13" value="100064"><label>군인</label></span>
                  <span><input type="checkbox" name="JCCodee14" id="JCCodee14" value="100046"><label>보건·의료직</label></span>
                  <span><input type="checkbox" name="JCCodee15" id="JCCodee15" value="100048"><label>예술·디자인·방송직</label></span>
               </td>
            </tr>
            <tr class="tab1">
               <td  colspan="4" >
               <span><input type="checkbox" name="JCCodee16" id="JCCodee16" value="105104"><label>스포츠·레크리에이션직</label></span>
               <span><input type="checkbox" name="JCCodee17" id="JCCodee17" value="105105"><label>미용·예식 서비스직</label></span>
               <span><input type="checkbox" name="JCCodee18" id="JCCodee18" value="105106"><label>여행·숙박·오락 서비스직</label></span>
               <span><input type="checkbox" name="JCCodee19" id="JCCodee19" value="100053"><label>음식 서비스직</label></span>
               </td>
            </tr>
               <tr class="tab1">
               <td  colspan="4" >
               <span><input type="checkbox" name="JCCodee20" id="JCCodee20" value="105107"><label>경호·경비직</label></span>
               <span><input type="checkbox" name="JCCodee21" id="JCCodee21" value="105108"><label>돌봄 서비스직(간병·육아)</label></span>
               <span><input type="checkbox" name="JCCodee22" id="JCCodee22" value="105109"><label>청소 및 기타 개인서비스직</label></span>
               <span><input type="checkbox" name="JCCodee23" id="JCCodee23" value="100050"><label>영업·판매직</label></span>
            </td>
            </tr>
               <tr class="tab1">
               <td  colspan="4" >
               <span><input type="checkbox" name="JCCodee24" id="JCCodee24" value="100049"><label>운전·운송직</label></span>
               <span><input type="checkbox" name="JCCodee25" id="JCCodee25" value="105110"><label>건설·채굴직</label></span>
               <span><input type="checkbox" name="JCCodee26" id="JCCodee26" value="105111"><label>기계 설치·정비·생산직</label></span>
               <span><input type="checkbox" name="JCCodee27" id="JCCodee27" value="105112"><label>금속·재료 설치·정비·생산직</label></span>
            </td>
            </tr>
               <tr class="tab1">
               <td  colspan="4" >
               <span><input type="checkbox" name="JCCodee28" id="JCCodee28" value="105113"><label>전기·전자 설치·정비·생산직</label></span>
               <span><input type="checkbox" name="JCCodee29" id="JCCodee29" value="105114"><label>정보통신 설치·정비직</label></span>
               <span><input type="checkbox" name="JCCodee30" id="JCCodee30" value="105115"><label>화학·환경 설치·정비·생산직</label></span>
               <span><input type="checkbox" name="JCCodee31" id="JCCodee31" value="105116"><label>섬유·의복 생산직</label></span>
               </td>
            </tr>
               <tr class="tab1">
               <td  colspan="4" >
               <span><input type="checkbox" name="JCCodee32" id="JCCodee32" value="100061"><label>식품 가공·생산직</label></span>
               <span><input type="checkbox" name="JCCodee33" id="JCCodee33" value="105117"><label>인쇄·목재·공예 및 <br>&nbsp;&nbsp;기타 설치·정비·생산직</label></span>
               <span><input type="checkbox" name="JCCodee34" id="JCCodee34" value="105118"><label>제조 단순직</label></span>
               <span><input type="checkbox" name="JCCodee35" id="JCCodee35" value="100063"><label>농림어업직</label></span>
            </td>
            </tr>
            
            
            
            <tr class="tab2"><th colspan="4" align="center"><h3>조건검색</h3></th></tr>
            <tr class="tab2">
               <td  colspan="4" >
               <span><input type="radio" name="salaryy" id="all1" value=""/><label>전체</label></span>
               <span><input type="radio" name="prospectt" id="all2" value=""/><label>전체</label></span>
               <span><input type="radio" name="possibilityy" id="all3" value=""/><label>전체</label></span>
               <span><input type="radio" name="equalemploymentt" id="all4" value=""/><label>전체</label></span>
               </td>
            </tr>
            <tr class="tab2">
               <td  colspan="4" >
               <span><input type="radio" name="salaryy" id="salaryy1" value="4천만원 이상"/><label>4천만원 이상</label></span>
               <span><input type="radio" name="prospectt" id="prospectt1" value="매우좋음"/><label>매우 좋음</label></span>
               <span><input type="radio" name="possibilityy" id="possibilityy1" value="매우좋음"/><label>매우 좋음</label></span>
               <span><input type="radio" name="equalemploymentt" id="equalemploymentt1" value="매우좋음"/><label>매우 좋음</label></span>
               </td>
            </tr>
            <tr class="tab2">
               <td  colspan="4" >
               <span><input type="radio" name="salaryy" id="salaryy2" value="3천만원 이상"/><label>3천만원 이상</label></span>
               <span><input type="radio" name="prospectt" id="prospectt2" value="좋음"/><label>좋음</label></span>
               <span><input type="radio" name="possibilityy" id="possibilityy2" value="좋음"/><label>좋음</label></span>
               <span><input type="radio" name="equalemploymentt" id="equalemploymentt2" value="좋음"/><label>좋음</label></span>
               </td>
            </tr>
            <tr class="tab2">
               <td  colspan="4" >
               <span><input type="radio" name="salaryy" id="salaryy3" value="2천만원 이상"/><label>2천만원 이상</label></span>
               <span><input type="radio" name="prospectt" id="prospectt3" value="보통 이상"/><label>보통 이상</label></span>
               <span><input type="radio" name="possibilityy" id="possibilityy3" value="보통 이상"/><label>보통 이상</label></span>
               <span><input type="radio" name="equalemploymentt" id="equalemploymentt3" value="보통 이상"/><label>보통 이상</label></span>
               </td>
            </tr>
            <tr class="tab2">
               <td  colspan="4" >
               <span><input type="radio" name="salaryy" id="salaryy4" value="2천만원 미만"/><label>2천만원 미만</label></span>
               <span><input type="radio" name="prospectt" id="prospectt4" value="보통미만"/><label>보통 미만</label></span>
               <span><input type="radio" name="possibilityy" id="possibilityy4" value="보통미만"/><label>보통 미만</label></span>
               <span><input type="radio" name="equalemploymentt" id="equalemploymentt4" value="보통미만"/><label>보통 미만</label></span>
               </td>
            </tr>
      
            
            
            
            <tr class="tab3">
               <th colspan="4" align="center">
                  <h3>적성유형별 탐색</h3>
                  <p style="font-size:12px; font-weight: normal;"><label>각 적성유형별로 해당 능력을 필요로 하는 직업군을 알려 드립니다. 적성유형이나 직업군을 선택해 보세요.</label></p>
               </th>
            </tr>
            <tr class="tab3" style="margin-right:50px;">
               <td text-align="center" colspan="4">
               <span style="width:100%;">   
                  <input type="button" class="gubun" name="gubun1"  id="gubun1" style="margin:0 20px 0 30px; " value="신체.운동">
                  <input type="button" class="gubun" name="gubun2"  id="gubun2" style="margin-right:20px;" value="손재능">
                  <input type="button" class="gubun" name="gubun3"  id="gubun3" style="margin-right:20px;" value="공간지각">
                  <input type="button" class="gubun" name="gubun4"  id="gubun4" style="margin-right:20px;" value="음악">
                  <input type="button" class="gubun" name="gubun5"  id="gubun5" style="margin-right:20px;" value="창의">
                  <input type="button" class="gubun" name="gubun6"  id="gubun6" style="margin-right:20px;" value="언어">
                  <input type="button" class="gubun" name="gubun7"  id="gubun7" style="margin-right:20px;" value="수리.논리">
                  <input type="button" class="gubun" name="gubun8"  id="gubun8" style="margin-right:20px;" value="자기성찰">
                  <input type="button" class="gubun" name="gubun9"  id="gubun9" style="margin-right:20px;"  value="대인관계">
                  <input type="button" class="gubun" name="gubun10" id="gubun10" style="margin-right:20px;" value="자연친화">
                  <input type="button" class="gubun" name="gubun11" id="gubun11" style="margin-right:20px;" value="예술시각">
               </span>
               </td>
            </tr>
            <tr class="tab3">
               <td  colspan="4" >
               <span ><input type="checkbox" name="ATCodee1" id="ATCodee1" value="104718"><label>운동관련직</label></span>
               <span ><input type="checkbox" name="ATCodee2" id="ATCodee2" value="104719"><label>무용 관련직</label></span>
               <span ><input type="checkbox" name="ATCodee3" id="ATCodee3" value="104720"><label>안전 관련직</label></span>
               <span ><input type="checkbox" name="ATCodee4" id="ATCodee4" value="104721"><label>일반운전 관련직</label></span>
               </td>
            </tr>
            <tr class="tab3">
               <td  colspan="4" >
               <span><input type="checkbox" name="ATCodee5" id="ATCodee5" value="104722"><label>기능직</label></span>
               <span><input type="checkbox" name="ATCodee6" id="ATCodee6" value="104723"><label>의복제조 관련직</label></span>
               <span><input type="checkbox" name="ATCodee7" id="ATCodee7" value="104724"><label>조리 관련직</label></span>
               <span><input type="checkbox" name="ATCodee8" id="ATCodee8" value="104725"><label>미용 관련직</label></span>
            </td>
            </tr>
            <tr class="tab3">
               <td  colspan="4" >
               <span><input type="checkbox" name="ATCodee9"  id="ATCodee9"  value="104726"><label>기타 게임·오락·스포츠 관련직</label></span>
               <span><input type="checkbox" name="ATCodee10" id="ATCodee10" value="104727"><label>고급 운전 관련직</label></span>
               <span><input type="checkbox" name="ATCodee11" id="ATCodee11" value="104728"><label>공학 기술직</label></span>
               <span><input type="checkbox" name="ATCodee12" id="ATCodee12" value="104729"><label>공학 전문직</label></span>
            </td>
            </tr>
            <tr class="tab3">
               <td  colspan="4" >
               <span><input type="checkbox" name="ATCodee13" id="ATCodee13" value="104730"><label>음악 관련직</label></span>
               <span><input type="checkbox" name="ATCodee14" id="ATCodee14" value="104731"><label>악기 관련직</label></span>
               <span><input type="checkbox" name="ATCodee15" id="ATCodee15" value="104732"><label>연기 관련직</label></span>
               <span><input type="checkbox" name="ATCodee16" id="ATCodee16" value="104733"><label>웹·게임·애니메이션 관련직</label></span>
            </td>
            </tr>
            <tr class="tab3">
               <td  colspan="4" >
               <span><input type="checkbox" name="ATCodee17" id="ATCodee17" value="104734"><label>미술 및 공예 관련직</label></span>
               <span><input type="checkbox" name="ATCodee18" id="ATCodee18" value="104735"><label>기타 특수 예술직</label></span>
               <span><input type="checkbox" name="ATCodee19" id="ATCodee19" value="104736"><label>사회서비스직</label></span>
               <span><input type="checkbox" name="ATCodee20" id="ATCodee20" value="104737"><label>인문계 교육 관련직</label></span>
            </td>
            </tr>
            <tr class="tab3">
               <td  colspan="4" >
               <span><input type="checkbox" name="ATCodee21" id="ATCodee21" value="104738"><label>이공계 교육 관련직</label></span>
               <span><input type="checkbox" name="ATCodee22" id="ATCodee22" value="104739"><label>의료관련 전문직</label></span>
               <span><input type="checkbox" name="ATCodee23" id="ATCodee23" value="104740"><label>IT관련전문직</label></span>
               <span><input type="checkbox" name="ATCodee24" id="ATCodee24" value="104741"><label>금융 및 경영 관련직</label></span>
</td>
            </tr>
            <tr class="tab3">
               <td  colspan="4" >
               <span><input type="checkbox" name="ATCodee25" id="ATCodee25" value="104742"><label>인문 및 사회과학 관련직</label></span>
               <span><input type="checkbox" name="ATCodee26" id="ATCodee26" value="104743"><label>회계 관련직</label></span>
               <span><input type="checkbox" name="ATCodee27" id="ATCodee27" value="104744"><label>언어 관련 전문직</label></span>
               <span><input type="checkbox" name="ATCodee28" id="ATCodee28" value="104745"><label>작가 관련직</label></span>
            </td>
            </tr>
            <tr class="tab3">
               <td  colspan="4" >
               <span><input type="checkbox" name="ATCodee29" id="ATCodee29" value="104746"><label>교육관련 서비스직</label></span>
               <span><input type="checkbox" name="ATCodee30" id="ATCodee30" value="104747"><label>기획서비스직</label></span>
               <span><input type="checkbox" name="ATCodee31" id="ATCodee31" value="104748"><label>매니지먼트 관련직</label></span>
               <span><input type="checkbox" name="ATCodee32" id="ATCodee32" value="104749"><label>보건의료 관련 서비스직</label></span>
            </td>
            </tr>
            <tr class="tab3">
               <td  colspan="4" >
               <span><input type="checkbox" name="ATCodee33" id="ATCodee33" value="104750"><label>사무 관련직</label></span>
               <span><input type="checkbox" name="ATCodee34" id="ATCodee34" value="104751"><label>영업관련 서비스직</label></span>
               <span><input type="checkbox" name="ATCodee35" id="ATCodee35" value="104752"><label>일반 서비스직</label></span>
               <span><input type="checkbox" name="ATCodee36" id="ATCodee36" value="104753"><label>디자인 관련직</label></span>
            </td>
            </tr>
            <tr class="tab3">
               <td  colspan="4" >
               <span><input type="checkbox" name="ATCodee37" id="ATCodee37" value="104754"><label>영상 관련직</label></span>
               <span><input type="checkbox" name="ATCodee38" id="ATCodee38" value="104755"><label>예술기획 관련직</label></span>
               <span><input type="checkbox" name="ATCodee39" id="ATCodee39" value="104756"><label>자연친화 관련직</label></span>
               <span><input type="checkbox" name="ATCodee40" id="ATCodee40" value="104757"><label>농생명산업 관련직</label></span>
            </td>
            </tr>
            <tr class="tab3">
               <td  colspan="4" >
               <span><input type="checkbox" name="ATCodee41" id="ATCodee41" value="104758"><label>환경관련 전문직</label></span>
               <span><input type="checkbox" name="ATCodee42" id="ATCodee42" value="104759"><label>법률 및 사회활동 관련직</label></span>
               <span><input type="checkbox" name="ATCodee43" id="ATCodee43" value="104760"><label>이학 전문직</label></span>
            </tr>
            <tr>
               <td colspan="4" align="left" >
               선택검색결과 : 전체 <%=totalCount %>건이 검색 되었습니다.
                  <input type="button" name="result" id="result" value="선택결과보기" style="float:right; ">
               </td>
            </tr>
         </table>
         </div>
         
         <div class="search_box" style="float:right;">
            <div id="sHowmany">
               <select id="howmany" name="howmany">
                  <option value="10">10개</option>
                  <option value="20">20개</option>
                  <option value="30">30개</option>      
               </select>
               <span class="bt">
                  <span class="bt_search" id="reFresh" name="reFresh">&nbsp;&nbsp;정렬&nbsp;&nbsp;</span>
               </span>
            </div>   
         </div>
                  
                  
   
            <!-- <tr>
               <td align="left" colspan="5">
                  <div align="right">
                     <select name="listSize" id="listSize">
                        <option value=10>10줄</option>
                        <option value=20>20줄</option>
                        <option value=30>30줄</option>
                     </select>
                     <input type="button" name="apply" id="apply" value="적용">   
                  </div>
               </td>   
            </tr> -->
            <%
                  if(obj != null){
                     for(int i=0;i<list.size();i++){
                        Job_DataVO jdvo = (Job_DataVO)list.get(i);
                        jdNo            = jdvo.getJdNo();
                        profession      = jdvo.getProfession();
                        summary         = jdvo.getSummary();
                        similarJob      = jdvo.getSimilarJob();
                        salary          = jdvo.getSalary();
                        jobDicSeq       = jdvo.getJobDicSeq();
                        equalEmployment = jdvo.getEqualEmployment();
                        ATCode          = jdvo.getATCode();
                        prospect        = jdvo.getProspect();
                        JCCode          = jdvo.getJCCode();
                        JCode           = jdvo.getJCode();
                        job             = jdvo.getJob();
                        possibility      = jdvo.getPossibility();
                        rowNum          = jdvo.getRowNum();
                        String summary2[] = summary.split("-");
            %>
            <table class="view_box2 mt_10" >
            <colgroup>
               <col width="25%" />
               <col width="25%" />
               <col width="25%" />
               <col width="25%" />
            </colgroup>
            <tr>
               <th width="150" rowspan="2"><a href="javascript:jobDetail(<%=jobDicSeq%>)"><%=job%></a></th>
            
               <%
               if(!jdvo.getSimilarJob().equals("null")){
            %>
               <td width="700" colspan="3" style="text-align:left;" ><%=summary2[1] %></td>
               <tr ><th>유사직업 </th> <td  colspan="2" style="text-align:left;"><%=similarJob %></td></tr>
            <%      
               }else{
            %>
               <td width="700" colspan="3" style="text-align:left;" > <%=summary2[1] %></td>
               <tr><th>유사직업 </th> <td  colspan="2" style="text-align:left;">없음</td></tr>
            <%       
               }
            %>   
            </tr>   
            
            <tr>
               <th>연봉</th>
               <th>일자리전망 </th>
               <th>발전가능성 </th>
               <th>고용평등 </th>
            </tr>
            <tr>
               <td> <%=salary %>만원 이상</td>
               <td> <%=prospect %></td>
               <td> <%=possibility %></td>
               <td> <%=equalEmployment %></td>
            </tr>
            
            </table>
            <%         }   
                  }else{      
            %>
            <table>
            <tr>
               <td align="center" colspan="3"> 데이터가 없습니다. </td>
            </tr>   
            <%       
                  }
            %>
            
         </table>
         <table align="center">
            <tr >
               <td align="center">
                  <input type="button" name="first" id="first" value="<<맨앞">
                  <input type="button" name="prev" id="prev" value="<이전">
               
               <%
                  int sta = 0;
                  int end = 0;
                  if(curPage <=10){
                     sta=1;end=10;
                     if(cRes<10){
                        end = cRes;
                     }
                  }
                  if(curPage <=20 && curPage >= 11){
                     sta=11;end=20;
                     if(cRes<20){
                        end = cRes;
                     }
                  }
                  if(curPage <=30 && curPage >= 21){
                     sta=21;end=30;
                     if(cRes<30){
                        end = cRes;
                     }
                  }
                  if(curPage <=40 && curPage >= 31){
                     sta=31;end=40;
                     if(cRes<40){
                        end = cRes;
                     }
                  }
                  if(curPage <=50 && curPage >= 41){
                     sta=41;end=50;
                     if(cRes<40){
                        end = cRes;
                     }
                  }
                  if(curPage <=cRes && curPage >= 51){
                     sta=51;end=cRes;
                  }
                  for(int i=sta;i<=end;i++){
                     %>
                     
                        <input type="button" class="curPage" name="curPage<%=i%>" id="curPage<%=i%>" value="<%=i%>">
                     
                     <% 
                  }
               %>
               
                  <input type="button" name="next" id="next" value="다음>">
                  <input type="button" name="last" id="last" value="맨뒤>>">
               </td>
            </tr>
         </table>
      </form>
      </div>
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