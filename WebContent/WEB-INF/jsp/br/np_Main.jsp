<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.br.vo.Non_ProgramVO,ssm.common.utils.UserSession" %>
<%@ page import="java.util.List"  %>
<%  request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	Object obj = request.getAttribute("list");
	String resultStr = (String)request.getAttribute("resultStr");
	String userAuthoriry = UserSession.getSessionAU(request);
	
	
	double totalCountJsp =0.0;
	int listSizeJsp2 = 0;
	double listSizeJsp = 0.0;
	int pageCount = 0;
	Non_ProgramVO npvo = new Non_ProgramVO();
	Non_ProgramVO npvo2 = new Non_ProgramVO();
	String npTitle ="";
	String npContents="";
	String ob = "";
	String ob2 = "";
	Object npTitle1= request.getAttribute("npTitle");
	Object npContents1= request.getAttribute("npContents");
	
	if(npTitle1!=null) npTitle = (String)npTitle1;
	if(npContents1!=null) npContents = (String)npTitle1;

	List list = null;
	if(obj != null){
		 list = (List)request.getAttribute("list");	
		 int listSize=0;
			
			listSizeJsp2 = Integer.parseInt((String)request.getAttribute("listSize"));
			if(obj != null){
				list = (List)request.getAttribute("list");
				if(list.size()>0){
					listSize=list.size();
					npvo = (Non_ProgramVO)list.get(0);
					totalCountJsp = (double)Integer.parseInt(npvo.getTotalCount());
					listSizeJsp = (double)listSizeJsp2;
					pageCount = (int)Math.ceil(totalCountJsp/listSizeJsp);
					
					
				}
			}
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>npMain</title>
	<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
    <link rel="stylesheet" href="/common/ssmCss/default.css">
    <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
    <link rel="stylesheet" href="/common/ssmCss/npMainBoard.css">
    <link rel="stylesheet" href="/common/ssmCss/s_content.css">
    <link rel="stylesheet" href="/common/ssmCss/s_layout.css">
	<script src="/common/ssmJs/goCategory.js?ver=2"></script>
	<script src="/common/ssmJs/index.js"></script>
	<script type="text/javascript">
		$(function(){
			//권한 띄우기
<%-- 			alert("<%=userAuthoriry%>"); --%>
			
			//페이징
			$("#howmany").val("<%=listSizeJsp2 %>");
			if("<%=resultStr%>"!=null && <%=resultStr%>!=""){
			}
			if("<%=npTitle%>"!=null) $("#text").val("<%=npTitle%>");
			if("<%=npContents%>"!=null) $("#text").val("<%=npContents%>");
			$("#insert").click(function(){
				location.href="/nonprogram/np_InsertForm.ssm";
			});
			
			
			$(".pageNo").click(function(){
				
				var ss = $(this).val();
				$("#pageNo").val(ss);
				$("#howmany").val("<%=listSizeJsp2 %>");
				$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();
				
			});
			
			//정렬 클릭시
			$("#reFresh").click(function(){
				$("#pageNo").val("1");
				$("#listSize").val($("#howmany").val());//howmany=listSize이지만 정렬버튼이아닌 다른버튼클릭시 데려가지않기위해 구분함 
				$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();
			});
			
			$("#text").keydown(function(key){
				if(key.keyCode==13){
					$("#pageNo").val("1");
					$("#listSize").val($("#howmany").val())
					if($("#where").val()==1) $("#npTitle").val($("#text").val());
					if($("#where").val()==2) $("#npContents").val($("#text").val());
					$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();	
				}
			});
			$("#search").click(function(){
				$("#pageNo").val("1");
				$("#listSize").val($("#howmany").val())
				if($("#where").val()==1) $("#npTitle").val($("#text").val());
				if($("#where").val()==2) $("#npContents").val($("#text").val());
				$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();			
			});	
		});
		
		function goDetail(npNo){
			location.href="/nonprogram/np_detailData.ssm?npNo="+npNo;

		}
	</script>
	
</head>
<body>
	<div id="wrap">
		<%@include file= "/common/ssmMain/header_.jsp" %>
		<div class="subWrap">
		<%
		if(userAuthoriry.equals("1")){%>
			<nav include-html="/common/ssmMain/ssmCategory/brSsideNav.html"></nav>
			
		<%
			}else if(userAuthoriry.equals("2") || userAuthoriry.equals("3")){%>
				<nav include-html="/common/ssmMain/ssmCategory/brTsideNav.html"></nav>
		<%
			}
		%>
		<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@주석  -->
			<section>
				<div id="tit">
					<h1>비교과 프로그램</h1>
					<p><a href="/chwc/index.asp">홈</a> > <a href="#메인주소">비교과 프로그램</a> > <a
						href="#주소걸기" class="on">프로그램 목록</a>
					</p>
				</div>
				<div class="container">
					
					<form id="nonProgramList">
						<div class="searchGuide">
							<table class="search_box_app mt_20" id="content01">
							<tr>
								<td>&nbsp;</td>
								<td>
									<select id="where" name="where">
										<option value="1">제목</option>
										<option value="2">내용</option>	
									</select>
								</td>
								<td>
									<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" maxlength="50" class="input"  />
									<span class="bt">
										<span class="bt_search" id="search" name="search">&nbsp;&nbsp;검색&nbsp;&nbsp;</span>
									</span>
								</td>
							</tr>
						</table>
						<div id="sHowmany">
							<select id="howmany" name="howmany">
								<option value="10">10개</option>
								<option value="20">20개</option>
								<option value="30">30개</option>		
							</select>
							<span class="bt">
								<span class="bt_search" id=reFresh name="reFresh">&nbsp;&nbsp;정렬&nbsp;&nbsp;</span>
							</span>
						</div>
							</div>
							<div class="allBox">
							<%if(obj!=null){
								for(int i =0 ; i<list.size();i++){
									npvo=(Non_ProgramVO)list.get(i);
									if((i%2) == 0){ %>
								<div class='box' onclick="goDetail('<%=npvo.getNpNo()%>')">
									<div class="imgPart" >
											<img src="/file/<%=npvo.getNpImage()%>"/>
									</div>
									<div class="notePart">
										<div class="subject"><%=npvo.getNpTitle()%><br></div>
										주         관 :<%=npvo.getNpCenter()%><br>
										<%
										if(npvo.getNpObject().equals("FM")) ob="1학년";
										if(npvo.getNpObject().equals("JR")) ob="2학년";
										if(npvo.getNpObject().equals("SR")) ob="3학년";
										if(npvo.getNpObject().equals("FM,JR")) ob="1학년,2학년";
										if(npvo.getNpObject().equals("FM,SR")) ob="1학년,3학년";
										if(npvo.getNpObject().equals("JR,SR")) ob="2학년,3학년";
										if(npvo.getNpObject().equals("FM,JR,SR")) ob="1학년,2학년,3학년";
										
										
										%>
										대 상 학 년 : <%=ob %><br>
										
										인 원 제 한 : <%=npvo.getNpPersonnel()%>명
									</div>
									<input type="hidden" class="npNo" id="npNo" name="npNo" value="<%=npvo.getNpNo()%>">
								</div>
								
								<!-- 2번째줄 밑으로쫘르륵 -->
								<%} 
										if(i==list.size()-1){
											break;
											
										}else{
											i++;
										}
					
										npvo2=(Non_ProgramVO)list.get(i);%>
									<%if((i%2) == 1){ %>
								<div class="box" onclick="goDetail('<%=npvo2.getNpNo()%>')">
								
									<div class="imgPart">
										<img src="/file/<%=npvo2.getNpImage()%>"/>
									</div>
									
									<div class="notePart">
										<div class="subject"><%=npvo2.getNpTitle()%></div>
										주         관 : <%=npvo2.getNpCenter()%><br>
										<%
										if(npvo.getNpObject().equals("FM")) ob2="1학년";
										if(npvo.getNpObject().equals("JR")) ob2="2학년";
										if(npvo.getNpObject().equals("SR")) ob2="3학년";
										if(npvo.getNpObject().equals("FM,JR")) ob2="1학년,2학년";
										if(npvo.getNpObject().equals("FM,SR")) ob2="1학년,3학년";
										if(npvo.getNpObject().equals("JR,SR")) ob2="2학년,3학년";
										if(npvo.getNpObject().equals("FM,JR,SR")) ob2="1학년,2학년,3학년";
										%>
										대 상 학 년 : <%=ob2 %><br>
										인 원 제 한: <%=npvo2.getNpPersonnel()%>명
									</div>
								<input type="hidden" class="npNo" id="npNo" name="npNo" value="<%=npvo2.getNpNo()%>">
								</div>
								
								
									<%} 
									
								}
								
							}else{%>
							<div>정보없음</div>
								<%
							}
							%>
							</div>
					 	<%for(int i=1 ; i<=pageCount;i++){%>
							<input type="button" class="pageNo" id="pageNo2" name="pageNo2" value="<%=i%>">
						<%
							}
						%>
						<input type="hidden" id="npTitle" name="npTitle">
						<input type="hidden" id="npContents" name="npContents">
						<input type="hidden" id="listSize" name="listSize" value="<%=listSizeJsp2 %>">
					    <input type="hidden" id="pageNo" name="pageNo" value='1'>
						</form>
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