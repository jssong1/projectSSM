<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ssm.cd.vo.*" %>
<%@ page import="java.lang.Math" %>
<%	request.setCharacterEncoding("UTF-8");
	
	Object obj = null;
	Object obj2 = null;
	Object obj3 = null;
	List list = null;
	List lClist = null;
	String mdNo       = "";
	String lClass     = "";
	String facilName  = "";
	String majorSeq   = "";
	String mClass     = "";
	String totalCount = "";
	String listSize   = "";
	int curPage       = 0;
	String resCount   = "";
	String rowNum     = "";
	double dTC = 0.0;
	double dLS = 0.0;
	double dRes = 0.0;
	int cRes = 0;
	int iLS = 0;
	String lClass1 = "";
	String lClass2 = "";
	String lClass3 = "";
	String lClass4 = "";
	String lClass5 = "";
	String lClass6 = "";
	String lClass7 = "";
	String lClass8 = "";
	String lClasss1 = "";
	String lClasss2 = "";
	String lClasss3 = "";
	String lClasss4 = "";
	String lClasss5 = "";
	String lClasss6 = "";
	String lClasss7 = "";
	String lClasss8 = "";
	
	obj = request.getAttribute("list");
	obj2 = request.getAttribute("saveData");
	obj3 = request.getAttribute("saveData2");
	
	
	if(obj != null){
		list = (List)obj; 
		Major_DataVO mdvo = (Major_DataVO)list.get(0);
		totalCount = mdvo.getResCount();
		curPage = Integer.parseInt(mdvo.getCurPage());
		
		//--saveData : Major_DataVO --////////////////////////////////////////////////////////////////////////
		Major_DataVO mdvo2 = (Major_DataVO)obj2;
		listSize = mdvo2.getListSize();
		dTC = Double.valueOf(totalCount);
		dLS = Double.valueOf(listSize);
		dRes = Math.ceil(dTC/dLS);
		cRes =  (int)dRes;
		iLS  =  (int)dLS; 
		lClass1 = mdvo2.getlClass1();
		lClass2 = mdvo2.getlClass2();
		lClass3 = mdvo2.getlClass3();
		lClass4 = mdvo2.getlClass4();
		lClass5 = mdvo2.getlClass5();
		lClass6 = mdvo2.getlClass6();
		lClass7 = mdvo2.getlClass7();
		lClass8 = mdvo2.getlClass8();
		
		//--saveData : M_DataVO --////////////////////////////////////////////////////////////////////////
		M_DataVO mdvo3 = (M_DataVO)obj3;
		lClasss1 = mdvo3.getlClasss1();
		lClasss2 = mdvo3.getlClasss2();
		lClasss3 = mdvo3.getlClasss3();
		lClasss4 = mdvo3.getlClasss4();
		lClasss5 = mdvo3.getlClasss5();
		lClasss6 = mdvo3.getlClasss6();
		lClasss7 = mdvo3.getlClasss7();
		lClasss8 = mdvo3.getlClasss8();
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>majorList.jsp</title>
		 <link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
	      <link rel="stylesheet" href="/common/ssmCss/default.css">
	      <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	      <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
	      <script src="/common/ssmJs/goCategory.js"></script>
	      <script src="/common/ssmJs/index.js"></script>
	      <script src="/common/ssmJs/goBoard.js"></script>
	      <script src="/common/ssmJs/goLogin.js"></script>
	      <link rel="stylesheet" href="/common/ssmCss/s_base.css">
		<link rel="stylesheet" href="/common/ssmCss/s_content.css">
		<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
		<link rel="stylesheet" href="/common/ssmCss/cd.css">
		<script type="text/javascript">
			$(function(){
				// 초기화작업
				val();
				$("#go").val("");
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
					$("#form").attr("action","/test/majorList.ssm").submit();
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
					$("#form").attr("action","/test/majorList.ssm").submit();
				});
				$("#last").click(function(){
					abc();
					$("#listSize").val(<%=listSize%>);
					$("#curPage").val(<%=cRes%>);
					$("#form").attr("action","/test/majorList.ssm").submit();
				});
				$("#prev").click(function(){
					abc();
					$("#listSize").val(<%=listSize%>);
					var page = $("#curPage").val();
					if(page <= 20){$("#curPage").val(Number(1));}
					else if(page <= 30){$("#curPage").val(Number(11));}
					else if(page <= 40){$("#curPage").val(Number(21));}
					else if(page <= 50){$("#curPage").val(Number(31));}
					$("#form").attr("action","/test/majorList.ssm").submit();
				});
				$("#first").click(function(){
					abc();
					$("#listSize").val(<%=listSize%>);
					$("#curPage").val(Number(1));
					$("#form").attr("action","/test/majorList.ssm").submit();
				});
				$("#apply").click(function(){
					abc();
					$("#curPage").val(Number(1));
					$("#form").attr("action","/test/majorList.ssm").submit();
				});
				$("#lClasss1").click(function(){
					if($("#lClasss1").prop("checked")){
						for(var i=1;i<=18;i++){
							$("#lClasss"+i).prop("checked",true);
						}
					}else{
						for(var i=1;i<=18;i++){
							$("#lClasss"+i).prop("checked",false);
						}
					}
				});
				$("#search").click(function(){
					os();
					abc();
					$("#curPage").val(Number(1));
					$("#form").attr("action","/test/majorList.ssm").submit();
				});
			});
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
			function abc(){
				for(var a=1;a<=8;a++){
					if($("#lClass"+a+"").val()){
						$("#go").val("go");
						break;
					}
				}
			}
			function mClass(data){
				location.href="/test/majorDetail.ssm?majorSeq="+data+"";
			}
			function val(){
				if('<%=lClass1%>' != 'null'){$("#lClass1").val("<%=lClass1%>");}
				if('<%=lClass2%>' != 'null'){$("#lClass2").val("<%=lClass2%>");}
				if('<%=lClass3%>' != 'null'){$("#lClass3").val("<%=lClass3%>");}
				if('<%=lClass4%>' != 'null'){$("#lClass4").val("<%=lClass4%>");}
				if('<%=lClass5%>' != 'null'){$("#lClass5").val("<%=lClass5%>");}
				if('<%=lClass6%>' != 'null'){$("#lClass6").val("<%=lClass6%>");}
				if('<%=lClass7%>' != 'null'){$("#lClass7").val("<%=lClass7%>");}
				if('<%=lClass8%>' != 'null'){$("#lClass8").val("<%=lClass8%>");}
				if("<%=lClasss1%>" != 'null'){$("#lClasss1").prop("checked",true); }
				if("<%=lClasss2%>" != 'null'){$("#lClasss2").prop("checked",true); }
				if("<%=lClasss3%>" != 'null'){$("#lClasss3").prop("checked",true); }
				if("<%=lClasss4%>" != 'null'){$("#lClasss4").prop("checked",true); }
				if("<%=lClasss5%>" != 'null'){$("#lClasss5").prop("checked",true); }
				if("<%=lClasss6%>" != 'null'){$("#lClasss6").prop("checked",true); }
				if("<%=lClasss7%>" != 'null'){$("#lClasss7").prop("checked",true); }
				if("<%=lClasss8%>" != 'null'){$("#lClasss8").prop("checked",true); }
			}
			function os(){
				if($("#lClasss1").prop("checked")){
					var aa = $("#lClasss1").val();
					$("#lClass1").val(aa);
				}else{$("#lClass1").val("");}
				if($("#lClasss2").prop("checked")){
					var aa = $("#lClasss2").val();
					$("#lClass2").val(aa);}else{$("#lClass2").val("");}
				
				if($("#lClasss3").prop("checked")){var aa = $("#lClasss3").val();$("#lClass3").val(aa);}else{$("#lClass3").val("");}
				
				if($("#lClasss4").prop("checked")){var aa = $("#lClasss4").val();$("#lClass4").val(aa);}else{$("#lClass4").val("");}
				
				if($("#lClasss5").prop("checked")){var aa = $("#lClasss5").val();$("#lClass5").val(aa);}else{$("#lClass5").val("");}
				
				if($("#lClasss6").prop("checked")){var aa = $("#lClasss6").val();$("#lClass6").val(aa);}else{$("#lClass6").val("");}
				
				if($("#lClasss7").prop("checked")){var aa = $("#lClasss7").val();$("#lClass7").val(aa);}else{$("#lClass7").val("");}
				
				if($("#lClasss8").prop("checked")){var aa = $("#lClasss8").val();$("#lClass8").val(aa);}else{$("#lClass8").val("");}
				
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
			<section>
			<div id="tit">
				<h1>학과정보 탐색</h1>
				<p>
					<a href="#">홈</a> > <a href="co01.asp">진로설계</a> > <a
						href="co03.asp" class="on">학과정보 탐색</a>
				</p>
			</div>
			<div class="container">
				<div class="content">
				<div class="contentbox">
		<form name="form" id="form" method="post">
			<input type="hidden" name="curPage" id="curPage">
			<input type="hidden" name="majorSeq" id="majorSeq">
			<input type="hidden" name="go" id="go">
			<input type="hidden" name="lClass1" id="lClass1" >
			<input type="hidden" name="lClass2" id="lClass2" >
			<input type="hidden" name="lClass3" id="lClass3" >
			<input type="hidden" name="lClass4" id="lClass4" >
			<input type="hidden" name="lClass5" id="lClass5" >
			<input type="hidden" name="lClass6" id="lClass6" >
			<input type="hidden" name="lClass7" id="lClass7" >
			<input type="hidden" name="lClass8" id="lClass8" >
			
			
			<div class="checkbox mt_10"  >
			<table cellpadding="0" cellspacing="0" border="0" 
				class="view_box2">
				<colgroup>
					<col width="30%" />
					<col width="70%" />
				</colgroup>
				<tr>
					<th><span>
						<label>전공계열</label>
					</span></th>
					<td style="text-align : left;">
						<span><input type="checkbox" name="lClasss1" id="lClasss1" value="전체">
						<label>전체</label></span>
		<span>
						<input type="checkbox" name="lClasss2" id="lClasss2" value="인문계열">
						<label>인문계열</label>
				</span>
				<span>
						<input type="checkbox" name="lClasss3" id="lClasss3" value="사회계열">
						<label>사회계열</label>
					</span>
				<span>
						<input type="checkbox" name="lClasss4" id="lClasss4" value="교육계열">
						<label>교육계열</label>
					</span>
				<span>
						<input type="checkbox" name="lClasss5" id="lClasss5" value="공학계열">
						<label>공학계열</label>
					</span>
				<span>
						<input type="checkbox" name="lClasss6" id="lClasss6" value="자연계열">
						<label>자연계열</label>
					</span>
				<span>
				</span>
				<span>
						<input type="checkbox" name="lClasss7" id="lClasss7" value="의약계열">
						<label>의약계열</label>
					</span>
				<span>
						<input type="checkbox" name="lClasss8" id="lClasss8" value="예체능계열">
						<label>예체능계열</label>
					</span>
					</td>
				<tr>
					<td colspan="2"  style=" line-height:20px; text-align:left;">
					선택검색결과 : 전체 <%=totalCount %>건이 검색 되었습니다.
						<input style="float:right; "  type="button" name="search" id="search" value="조건검색">
					</td>
				</tr>
			</table>
		</div>
			
			<div class="search_box" style="float:left;">
				<select class="select" id="listSize" name="listSize" style="width:150px;">
							<option value=10>10줄</option>
							<option value=20>20줄</option>
							<option value=30>30줄</option>
				</select> 
				<input class="q_btn" type="button" name="apply" id="apply" value="적용">
			</div>
			
			
			<table cellpadding="0" cellspacing="0" border="0" 
							class="list_box mt_5" 	style="	text-align : left;">
			<!-- 	<tr>
					<td align="left" colspan="4">
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
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="75%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>학과명</th>
						<th>학과계열</th>
						<th>관련학과</th>
					</tr>
				</thead>
				
			<!-- 	<tr>
					<td width="40" align="center">번호</td>
					<td width="100" align="center">학과명</td>
					<td width="100" align="center">학과계열</td>
					<td align="center">관련학과</td>
				</tr> -->
					<%
						if(obj != null){
							for(int i=0;i<list.size();i++){
								Major_DataVO mdvo = (Major_DataVO)list.get(i);
								mdNo = mdvo.getMdNo();
								lClass = mdvo.getlClass();
								facilName = mdvo.getFacilName();
								majorSeq = mdvo.getMajorSeq();
								mClass = mdvo.getmClass();
								listSize = mdvo.getListSize();
								rowNum  = mdvo.getRowNum();		
							// end of for()
					%>	
					<tr>
						<td align="center"><%=rowNum %></td>
						<td><a href="javascript:mClass(<%=majorSeq%>)"><%=mClass %></a></td>
						<td><%=lClass %></td>
						<td style="text-align:left;"  ><%=facilName %></td>
					</tr>		
					<% 		
							}
					%>
					
					<% 		
							
							
						}else{
					%>		
						<tr >
							<td align="center" colspan="4">데이터가 없습니다.</td>
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