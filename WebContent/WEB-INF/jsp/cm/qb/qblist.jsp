<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.QnABoardVO" %>    
<%@ page import="java.util.List" %>
<%@ page import="ssm.common.utils.UserSession" %>      
<%
	request.setCharacterEncoding("UTF-8");	
%>

<%  String SessionAU = UserSession.getSessionAU(request);%>

<%	
	//페이징에대한 설정
	QnABoardVO searchdata =(QnABoardVO)request.getAttribute("Searchdata");
	int pageCount =0;
	List<QnABoardVO> qblist =(List<QnABoardVO>)request.getAttribute("qblist");
	int listSize=qblist.size();
	if(listSize >0){
	QnABoardVO qvo_ = qblist.get(0);
	double totalCount = (double)Integer.parseInt(qvo_.getTotalCount()); 
	int pagelistSize = (int)request.getAttribute("listSize");
	double dval = (double)pagelistSize;
	pageCount = (int)Math.ceil(totalCount/dval); //pageCount 변수 사용
	}
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<!-- <link rel="stylesheet" href="/include/css/ssmTheme.css">
	<link rel="stylesheet" href="/include/css/ssmTheme.less.css">
	<link rel="stylesheet" href="/include/css/ssmTheme.min.css.css">
	<link rel="stylesheet" href="/include/css/ssmVariables.less.css"> -->
	
	<link rel="stylesheet" href="/common/ssmCss/default.css?ver=1">
	<link rel="stylesheet" href="/common/ssmCss/nbBoard.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	
	<link rel="stylesheet" href="/common/ssmCss/s_content.css">
    <link rel="stylesheet" href="/common/ssmCss/s_layout.css">
	
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js?ver=1"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		/*검색 대상이 변경될 때마다 처리 이벤트*/
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("전체 데이터 조회합니다.");
			}else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		/*검색 버튼 클릭 시 처리 이벤트*/
		$("#searchBut").click(function(){
			
			goPage();
		});
		
		//글쓰기버튼
		$("#insertbutton").click(function(){
			$(location).attr('href',"/qnaboard/qbwirteform.ssm");
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"/qnaboard/qblist.ssm"
			});
			$("#f_search").submit();
		}
		
		/*제목 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
		$(".qbDetail").click(function(){
			var qbNo = $(this).parents("tr").attr("data-num");
			
			if($(this).attr("id") == 'Y'){
				
				//세션으로 ttno 넣기
				var sessionAU = "<%=SessionAU%>";
				if(sessionAU != 1){
					//alert("학생이 아닙니다 비밀번호 확인페이지 없이 조회");
					$("#qbNo").val(qbNo);
					$("#qbdetailForm").attr('action',"/qnaboard/qbDetail.ssm")
					.submit();
				}else{
					//alert("학생이다 (비밀번호 입력페이지)");
					$("#qbNo").val(qbNo);
					$("#qbdetailForm").attr('action',"/qnaboard/qbPwcheckform.ssm")
					.submit();
				}
			}else{
				$("#qbNo").val(qbNo);
				$("#qbdetailForm").attr('action',"/qnaboard/qbDetail.ssm")
				.submit();
			}
		});
		
		//페이지버튼눌렀을때 이벤트
		$(".pageNo2").click(function(){
			var pageNo = $(this).attr("data-num");
			$("#pageNo").val(pageNo);
			$("#pageNoForm").attr('action',"/qnaboard/qblist.ssm")
			.submit();
		});
		
		//페이징 왼쪽 버튼
		$("#pageleftbutton").click(function(){
			var pageNo =$("#pageNo").val();
			if(pageNo == 1){
				alert("첫번째페이지입니다!");
			}else{
				pageNo  = pageNo-1;
				$("#pageNo").val(pageNo);
				$("#pageNoForm").attr('action','/qnaboard/qblist.ssm').submit();
			}
		});
		
		//페이징 오른쪽 버튼
		$("#pagerightbutton").click(function(){
			var pageNo =$("#pageNo").val();
			if(pageNo >= <%=pageCount%>){
				alert("마지막페이지입니다");
			}else{
				pageNo  = Number(pageNo)+1;
				$("#pageNo").val(pageNo);
				$("#pageNoForm").attr('action','/qnaboard/qblist.ssm').submit();
			}
		});
		
		//키워드검색시 검색한내용 유지하게하는 설정
		var keyword2 = "<%=searchdata.getKeyword()%>";
		var search2 = "<%=searchdata.getSearch()%>";
		if(keyword2 != "null" && keyword2 != ""){ // 키워드 데이터가 있을때 실행
			$("#keyword").val(keyword2);
			$("#search").val(search2);
		}
		
		// 학생유저일경우만 글쓰기버튼 숨겨라
		var sessionAU = "<%=SessionAU%>";
		if(sessionAU == 2){ 
			$("#insertbutton").hide();
		}

		
	});	
	</script>
	
</head>
<body>
<div id="wrap">
	<!-- 헤더 -->
	<%@include file="/common/ssmMain/header_.jsp"%>
	
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
	
		<!-- 제목 바 -->
<!-- 		<section include-html="/common/ssmMain/ssmCategory/section_sub_title_wrap.html"></section> -->
		<section>	
		<div id="tit">
            <h1>질문과 답변</h1>
            <p>
               <a href="#">홈</a> > <a href="co01.asp">공지사항</a> > <a
                  href="co03.asp" class="on">Q&A게시판</a>
            </p>
         </div>
		<div class="container">
		
		<!-- 컨테이너 -->
		<div id="boardContainer">	
		
		<!-- 이미지 바  -->
<!-- 		<div id="mainimage"><img alt="데이터없다" src="/image/nbmain.gif"></div> -->
		
		<!-- 게시판  -->
		<div id="boardlist">
		<!-- 검색부분 -->
		<div id="searchdiv">
			<form id="f_search" name="f_search" autocomplete="off">
				<table class="search_box_app mt_10" id="content01">
					<tr>
						<td>&nbsp;</td>
						<td>
							<select id="search" name="search">
								<option value="all">전체</option>
								<option value="qbTitle">제목</option>
								<option value="qbContents">내용</option>
								<option value="ssName">작성자</option>
							</select>
						</td>
						<td>
							<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" maxlength="50" class="input" autocomplete="off" />
							<span class="bt">
								<span class="bt_search" id="searchBut" name="searchBut">&nbsp;&nbsp;검색&nbsp;&nbsp;</span>
							</span>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<div id=board_contents style="margin-bottom:10px;">
			<table class="list">
				<colgroup>
					<col width="10%" />
					<col width="10%" />
					<col width="20%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th style="text-align:left">유형</th>
						<th style="text-align:left">글제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>답변상태</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(qblist.size()==0){
					%>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>작성된 글이 없습니다.</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<%
					}else{
						int count = qblist.size();
						for (int i=0; i<count; i++){
							QnABoardVO qvo = qblist.get(i);
							String no = qvo.getQbNo().substring(4);
							String Secretyn = qvo.getQbSecretyn();
					%>	
						<tr data-num=<%=qvo.getQbNo() %>>
							<td><%=no %></td>
							<td style="text-align:left"><%=qvo.getQbType() %></td>
							<% 
							if(Secretyn.equals("N") ){//(ssno가 있을때 || ttno가 있때 
							%>
							<td style="text-align:left" id="N"><span class="qbDetail" id="N"><%=qvo.getQbTitle() %></span></td>
							<% 
							}else{
							%>
							<td style="text-align:left"><span class="qbDetail" id="Y">비밀글입니다.</span></td>
							
							<%
							}
							%>	
							<td><%=qvo.getsMembervo().getSsName() %></td>
							<td><%=qvo.getQbViews() %></td>
							<td><%=qvo.getQbInsertdate() %></td>
							<td><%=qvo.getQaCount()%></td>
						</tr>
					</tbody>
					<% }%>
				</table>
				</div>
				<% 
				}
				%>
				<div id="pagediv" >
				<input type="button" style="background: #9dbbbd;
    color: #fff;
    padding: 5px 10px;
    border-radius: 6px;
    float: right;
    margin-bottom: 10px;" id="insertbutton" name="insertbutton" value="글쓰기">
				<span id="pageleftbutton" class="pageBtn" style="font-size: 20px;">◀</span>
				<%
				for(int i=1 ; i<=pageCount;i++){
				%>
				<span class="pageNo2" data-num="<%=i%>" ><%=i%></span>
				<%}%>				
				<span id="pagerightbutton" class="pageBtn" style="font-size: 20px;">▶</span>
				
				<!-- 상세 페이지 이동을 위한 form -->
				<form name=qbdetailForm" id="qbdetailForm">
				<input type="hidden" name="qbNo" id="qbNo">
				</form>
				
				<form id="pageNoForm">
				<input type="hidden" id="pageNo" name="pageNo" value="<%=searchdata.getPageNo()%>">
				<input type="hidden" id="listSize" name="listSize" value="10">
				<input type="hidden" name="search" value="<%=searchdata.getSearch()%>">
				<input type="hidden" name="keyword" value="<%=searchdata.getKeyword()%>">
				</form>
				
				
				</div>
		</div>
	</div> 
	<!-- 컨테이너 DIV 끝 -->
	</div>
	<!-- // .container -->
	</section>
	</div>
	<!-- // .subWrap -->
	    <footer include-html="/common/ssmMain/footer.html"></footer>
</div>
		<script>
			includeHTML();
		</script>	
</body>
</html>