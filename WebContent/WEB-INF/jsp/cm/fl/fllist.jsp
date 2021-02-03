<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.FamilyLetterVO" %>    
<%@ page import="java.util.List" %>
<%@ page import="ssm.common.utils.UserSession" %>     
   
<%  String SessionAU = UserSession.getSessionAU(request);%>   
   
<%
	FamilyLetterVO searchdata =(FamilyLetterVO)request.getAttribute("Searchdata");
	int pageCount = 0;
	List<FamilyLetterVO> fllist =(List<FamilyLetterVO>)request.getAttribute("fllist");
	int listSize= fllist.size();
	if(listSize >0){
		FamilyLetterVO fvo_ = fllist.get(0);
		double totalCount = (double)Integer.parseInt(fvo_.getTotalCount()); 
		int pagelistSize = (int)request.getAttribute("listSize");
		double dval = (double)pagelistSize;
		pageCount = (int)Math.ceil(totalCount/dval); //pageCount 변수 사용
		System.out.println("pageCount>>>:"+ pageCount); //1
		System.out.println("totalCount>>>:"+ totalCount); //10
		System.out.println("pagelistSize>>>:"+ pagelistSize);
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>가정통신문</title>
	
	
	
	<link rel="stylesheet" href="/common/ssmCss/default.css?ver=1">
	<link rel="stylesheet" href="/common/ssmCss/nbBoard.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	
	<link rel="stylesheet" href="/common/ssmCss/s_content.css">	
	
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
			
			goPage(1);
		});
		
		$("#insertbutton").click(function(){
			$(location).attr('href',"/familyletter/flwirteform.ssm");
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			alert($("#search").val());
			$("#f_search").attr({
				"method":"get",
				"action":"/familyletter/fllist.ssm"
			});
			$("#f_search").submit();
		}
		
		/*제목 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
		$(".flDetail").click(function(){
			var flNo = $(this).parents("tr").attr("data-num");
			$("#flNo").val(flNo);
			$("#fldetailForm").attr('action',"/familyletter/flDetail.ssm")
			.submit();
		});
		
		//페이지버튼눌렀을때 이벤트
		$(".pageNo2").click(function(){
			var pageNo = $(this).attr("data-num");
			$("#pageNo").val(pageNo);
			$("#pageNoForm").attr('action',"/familyletter/fllist.ssm")
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
				$("#pageNoForm").attr('action','/familyletter/fllist.ssm').submit();
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
				$("#pageNoForm").attr('action','/familyletter/fllist.ssm').submit();
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
		if(sessionAU == 1){ 
			$("#insertbutton").hide();
		}
		
	});
	</script>
	
	
</head>
<body>

<div id="wrap">
	<!-- 헤더 -->
	<header  style="margin-bottom: 0px;"include-html="/common/ssmMain/header_.jsp"></header>
	<div class="subWrap">
	<!-- 네비게이션 -->
			<%
			if(SessionAU.equals("1")){
			%><nav include-html="/common/ssmMain/ssmCategory/cmSSideNav.html"></nav><%
			}
			if(SessionAU.equals("2")){
			%><nav include-html="/common/ssmMain/ssmCategory/cmTSideNav.html"></nav><%
			}
			%>
	
	
	<section>
	<div id="tit">
       <h1>가정통신문</h1>
       <p>
          <a href="#">홈</a> > <a href="co01.asp">공지사항</a> > <a
             href="co03.asp" class="on">가정통신문</a>
       </p>
    </div>	
	<div class="container">
	<!-- 컨테이너 -->		
	<div id="boardContainer">
		
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
												<option value="flTitle">제목</option>
												<option value="flContents">내용</option>
												<option value="ttName">작성자</option>
											</select>
										</td>
										<td>
											<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" maxlength="50" class="input"  />
											<span class="bt">
												<span class="bt_search" id="searchBut" name="searchBut">&nbsp;&nbsp;검색&nbsp;&nbsp;</span>
											</span>
										</td>
									</tr>
								</table>
							
							</form>
						</div>
		
		
		
		<div id="board_contents" style="margin-bottom: 10px;">
			<table class="list">
				<colgroup>
					<col width="15%" />
					<col width="25%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<thead style="text-align: center;">
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>첨부파일</th>
					</tr>
				</thead>
				<tbody>
				<%!public String textLengthOverCut(String txt){
								    if (txt.length() > 20) {
								        txt = txt.substring(0, 20) + "....";
								    }
								    return txt;
								} %>
					<%
					if(fllist.size()==0){
					%>
					<tr>
						<td>0</td>
						<td colspan="5">작성된 글이 없습니다.</td>
					</tr>
					<%
					}else{
						int count = fllist.size();
						for (int i=0; i<count; i++){
							FamilyLetterVO fvo = fllist.get(i);
							String no = fvo.getFlNo().substring(4);
							
							String FlFile=fvo.getFlFile();
							FlFile = FlFile.substring(10);
					%>	
						<tr data-num=<%=fvo.getFlNo() %>>
							<td><%=no%> </td>
							<td style="text-align:left"><span class="flDetail">
							<%=textLengthOverCut(fvo.getFlTitle())%></span></td>
							<td><%=fvo.gettMembervo().getTtName() %></td>
							<td><%=fvo.getFlViews() %></td>
							<td><%=fvo.getFlInsertdate() %></td>
							<td style=" padding: 8px 0;" >
								<%
								if(FlFile.equals("null")){
								%>
							</td>
								<%
								}else{
								%>
								<a href="/familyletter/flDownload.ssm?file=<%=FlFile%>"><img src="/image/downloadimg.jpg" width="20" height="20"></a></td>
								<%	
								} // if(FlFile.equals("null"))
								%>
							</tr>
						</tbody>	
						<%
							} // for
						} // if(fllist.size()==0){
						%>
					</table>
					</div>
					<div id="pagediv" >
					<input type="button" style="background: #9dbbbd;
						    color: #fff;
						    padding: 5px 10px;
						    border-radius: 6px;
						    float: right;
						    margin-bottom: 10px;" id="insertbutton" name="insertbutton" value="글쓰기">
					<span id="pageleftbutton" class="pageBtn" style="font-size: 20px;">◀</span>
					<%
						for (int i = 1; i <= pageCount; i++) {
					%>
						<span class="pageNo2" data-num="<%=i%>"><%=i%></span>
					<%
						}
					%>
					<span id="pagerightbutton" class="pageBtn" style="font-size: 20px;">▶</span>
					
					
					<!-- 상세 페이지 이동을 위한 form -->
					<form name="fldetailForm" id="fldetailForm">
					<input type="hidden" name="flNo" id="flNo">
					</form>
					
					<form id="pageNoForm">
					<input type="hidden" id="pageNo" name="pageNo" value="<%=searchdata.getPageNo()%>">
					<input type="hidden" id="listSize" name="listSize" value="10">
					<input type="hidden" name="search" value="<%=searchdata.getSearch()%>">
					<input type="hidden" name="keyword" value="<%=searchdata.getKeyword()%>">
					</form>
					</div>
		</div>
	</div> <!-- 컨테이너 DIV 끝 -->
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