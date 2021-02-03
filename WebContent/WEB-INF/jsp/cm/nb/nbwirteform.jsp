<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.common.utils.UserSession" %>        
    
<%  String SessionNO = UserSession.getSessionNO(request);
	String SessionAU = UserSession.getSessionAU(request); %> 
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 글입력 폼</title>
	
	<link rel="stylesheet" href="/common/ssmCss/default.css?ver=2">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	
	<link rel="stylesheet" href="/common/ssmCss/s_content.css?ver=2">
	
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	
	<script type="text/javascript" src="/navereditor/js/service/HuskyEZCreator.js" charset="UTF-8"></script> 
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
	    
	    $(document).ready(function(){
	    
	    	
	    	var oEditors = [];
	    	nhn.husky.EZCreator.createInIFrame({
	    	 oAppRef: oEditors,
	    	 elPlaceHolder: "nbContents",
	    	 sSkinURI: "/navereditor/SmartEditor2Skin_ko_KR1.html",
	    	 fCreator: "createSEditor2"
	    	});
	    	
	    	$(".insertbutton").click(function(){
	    		
	    		var nbTitle=$("#nbTitle").val();
	    		if(nbTitle == "제목 입력"){alert("제목을 입력하세요");return}
	    		
	    		oEditors.getById["nbContents"].exec("UPDATE_CONTENTS_FIELD", []);
	    		
	    		$("#nbwirteform").attr('action','/noticeboard/nbwirte.ssm').submit();
	    	});
	    	
	    	
	    	$('.A').keydown(function(){
	            cut_28(this);
	        });
	    	
	    });
	  
	    function cut_28(obj){
	        var text = $(obj).val();
	        var leng = text.length;
	        while(getTextLength(text) > 28){
	            leng--;
	            text = text.substring(0, leng);
	            alert("30바이트를 넘을수 없습니다.");
	        }
	        $(obj).val(text);
	    }
	    
	    function getTextLength(str) {
	        var len = 0;
	        for (var i = 0; i < str.length; i++) {
	            if (escape(str.charAt(i)).length == 6) {
	                len++;
	            }
	            len++;
	        }
	        return len;
	    }
	    
    </script>
    
</head>
<body>
<div id="wrap">
	<!-- 헤더 -->
	<%@include file="/common/ssmMain/header_.jsp"%>
	
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
           	 <h1>공지사항</h1>
            <p>
               <a href="../main_1.jsp">홈</a> > <a href="/noticeboard/nblist.ssm">커뮤니티</a> > <a class="on">공지사항</a>
            </p>
         </div>
         <div class="container" style="height: 530px;">
				<!-- 컨테이너 -->
				<div id="boardContainer">
				<br><br><br>
	<!-- 글쓰기 폼 -->
	<div id="writeform">
		<form id="nbwirteform" name="nbwirteform" enctype="multipart/form-data" method="post">
			<input Type="hidden" id="ttNo" name="ttNo" value="<%=sessionNO %>">
			<table cellpadding="0" cellspacing="0" border="0" style="margin:auto;" class="view_box mt_5" >
         	<colgroup>
	            <col width="18%">
	            <col width="35%">
	            <col width="18%">
	            <col width="35%">
        	</colgroup>
        	<tbody>
        	<tr>
        		<th>작성자</th>
        		<td><%=SessionName %></td>
        		<th>첨부파일</th>
        		<td><input type="file" name="nbFile"></td>
        	</tr>
        	<tr>
        		<th>제목</th>
        		<td colspan="3"><input type="text" style=" width:98%;padding: 5px; "id="nbTitle" name="nbTitle" class="A" value="제목 입력" ></td>
        	</tr>
        	<tr>
        		<th>내용</th>
        		<td colspan="3" style="width:100%"><textarea name="nbContents" id="nbContents" style="width:100%;"rows="10" cols="100">글 내용을 입력하세요.</textarea></td>
        	</tr>
        	</table>
			<div class="board_btn">
                  <span class="insertbutton">입력</span>
                  <a href="/noticeboard/nblist.ssm"><span class="back">목록</span></a>
            </div>	
		</form>
						</div>
						<!-- // #pagediv -->
					</div>
					<!-- // #boardList -->
				</div>
				<!-- board컨테이너 DIV 끝 -->
			</div>
			<!-- // .container -->
			</section>
		</div>
		<!-- // .subWrap -->
		<footer include-html="/common/ssmMain/footer.html"></footer>
	</div>
	<!-- // #wrap -->
	<script>
		includeHTML();
	</script>	
</body>
</html>