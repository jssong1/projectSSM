<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.common.utils.UserSession" %>        
    
<%  String sessionNO = UserSession.getSessionNO(request);%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<link rel="stylesheet" href="/common/ssmCss/boardwirteform.css">
	
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	
	<script type="text/javascript" src="/navereditor/js/service/HuskyEZCreator.js" charset="UTF-8"></script> 
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
	    
	    $(document).ready(function(){
		    
	    	var oEditors = [];
	    	nhn.husky.EZCreator.createInIFrame({
	    	 oAppRef: oEditors,
	    	 elPlaceHolder: "qbContents",
	    	 sSkinURI: "/navereditor/SmartEditor2Skin_ko_KR1.html",
	    	 fCreator: "createSEditor2"
	    	});
	    	
	    	$("#submitbutton").click(function(){
	    		var qbType=$("#qbType").val();
	    		var qbTitle=$("#qbTitle").val();
	    		if(qbType == "게시판선택"){alert("게시판을 선택하세요");return}
	    		if(qbTitle == "제목 입력"){alert("제목을 입력하세요");return}
	    		
	    		oEditors.getById["qbContents"].exec("UPDATE_CONTENTS_FIELD", []);
	    		
	    		$("#qbwirteform").attr('action','/qnaboard/qbwirte.ssm').submit();
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
	<header include-html="/common/ssmMain/header_.jsp"></header>
	
	<!-- 네비게이션 -->
	<nav include-html="/common/ssmMain/ssmCategory/cmwrapSide.html"></nav>
	
	<!-- 컨테이너 -->
	<div class="boardwriteformcontainer">
				
	<!-- 제목바 -->		
	<section include-html="/common/ssmMain/ssmCategory/section_sub_title_wrap.html"></section>	
	
	<!-- 이미지 바  -->
	<div id="mainimage"><img alt="데이터없다" src="/image/nbmain.gif"></div>
	
	<!-- 글쓰기 폼 -->
	<div id="writeform">
		<form id="qbwirteform" name="qbwirteform">
			<input Type="hidden" id="ssNo" name="ssNo" value="<%=sessionNO%>">
			<table class="writeformtable">
				<tr>
					<td> Q&A 유형 </td>
					<td style="float: left;margin: 5px auto; ">
						<select style="height:21px;" id="qbType" name="qbType">
							<option value="게시판선택">게시판선택</option>
							<option value="진로설계">진로설계</option>
							<option value="상담">상담</option>
							<option value="비교과프로그램">비교과프로그램</option>
							<option value="포트폴리오">포트폴리오</option>
							<option value="공지사항">공지사항</option>
							<option value="학교일정">학교일정</option>
							<option value="가정통신문">가정통신문</option>
						</select>
					</td>
				</tr>
				<tr>
					<td> 제목  </td>
					<td><input type="text" id="qbTitle" name="qbTitle" class="A" value="제목 입력" style="width:856px; float:left;"></td>
				</tr>
				<tr>
					<td> 내용  </td>
					<td><textarea name="qbContents" id="qbContents" rows="10" cols="100">글 내용을 입력하세요.</textarea></td>
				</tr>
				<tr>
					<td> 비밀글 설정  </td>
					<td style="float: left;margin: 4px auto; width:100%">
						<input type="radio" name="qbSecretyn" value="Y" checked>비밀글 
						<input type="radio" name="qbSecretyn" value="N">공개글
						<input type="button" id ="submitbutton" name="submitbutton" value="입력" style="float: right;">
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
	<footer include-html="/common/ssmMain/footer.html"></footer>
	</div>
	<script>
		includeHTML();
	</script>	
</body>
</html>