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
	<link rel="stylesheet" href="/common/ssmCss/boardwirteform.css?ver=1">
	
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	
	<script type="text/javascript" src="/navereditor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
	    
	    $(document).ready(function(){
	   	alert("zz");
	    	var oEditors = [];
	    	nhn.husky.EZCreator.createInIFrame({
	    	 oAppRef: oEditors,
	    	 elPlaceHolder: "flContents",
	    	 sSkinURI: "/navereditor/SmartEditor2Skin_ko_KR1.html",
	    	 fCreator: "createSEditor2"
	    	});
	    	
	    	$("#submitbutton").click(function(){
	    		
	    		var flTitle=$("#flTitle").val();
	    		if(flTitle == "제목 입력"){alert("제목을 입력하세요");return}
	    		
	    		oEditors.getById["flContents"].exec("UPDATE_CONTENTS_FIELD", []);
	    		
	    		$("#flwirteform").attr('action','/familyletter/flwirte.ssm').submit();
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
	
	<!-- 이미지바 -->
	<div id="mainimage"><img alt="데이터없다" src="/image/nbmain.gif"></div>
	
	
	<!-- 글쓰기 폼 -->
	
	<div id="writeform">
		<form id="flwirteform" name="flwirteform" enctype="multipart/form-data" method="post">
			<input Type="hidden" id="ttNo" name="ttNo" value="<%=sessionNO %>">
			<table class="writeformtable">
				<tr>
					<td> 제목  </td>
					<td><input type="text" id="flTitle" name="flTitle" class="A" value="제목 입력" style="width:856px; float:left;"></td>
				</tr>
				<tr>
					<td> 내용  </td>
					<td><textarea name="flContents" id="flContents" rows="10" cols="100">글 내용을 입력하세요.</textarea></td>
				</tr>
				<tr>
					<td> 첨부 파일  </td>
					<td><input type="file" id="flFile" name="flFile" style="width:300px; float: left;">
				<input type="button" id ="submitbutton" name="submitbutton" value="입력" style="float: right;">
				</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
	</section>
	<footer include-html="/common/ssmMain/footer.html"></footer>
	</div>
		<script>
			includeHTML();
		</script>	
</body>
</html>