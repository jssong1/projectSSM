<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.NoticeBoardVO" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
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
	    	
	    	$("#submitbutton").click(function(){
	    		
	    		oEditors.getById["nbContents"].exec("UPDATE_CONTENTS_FIELD", []);
	    		$("#nbupdateform").attr('action','/noticeboard/nbupdate.ssm').submit();
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
	        }
	        $(obj).val(text);
	        $('.C').text(getTextLength(text));
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
    
    <style>
		html, body {
			  margin: 0;
			  padding: 0;
			  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
			  font-size: 4px;
			}
			
			table  {
				width : 500px;
				text-align : center;
				margin : auto;
			}
			
			.list
			{
				width : 500px;
				text-align : left;
				margin : auto;
			}	
	</style>
    
</head>
<body>
<div id="wrap">
			<header include-html="/common/ssmMain/header_.jsp"></header>
			<nav include-html="/common/ssmMain/ssmCategory/cmwrapSide.html"></nav>
			<section>
				<div class="container">
	<%
	NoticeBoardVO nvo =(NoticeBoardVO)request.getAttribute("updateData");
	%>
	<form id="nbupdateform" name="nbupdateform" enctype="multipart/form-data" method="post">
		<table border="1">
			<colgroup>
				<col width="100px"></col>
				<col width="800px"></col>
			</colgroup>
			<tr>
				<td colspan="2">공지사항게시판 글수정하기<td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" id="nbTitle" name="nbTitle" size="110"value="<%=nvo.getNbTitle()%>" class="A">
					<div class="bytes-wrapper">
        				<span class="C">0</span>bytes
    				</div>
				</td>
			</tr>
			<tr>
				<td>글내용</td>
			<td><textarea name="nbContents" id="nbContents" rows="10" cols="100" ><%=nvo.getNbContents()%></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" id="nbFile" name="nbFile"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id ="submitbutton" name="submitbutton" value="수정">
					<input type="hidden" id ="nbNo" name="nbNo" value="<%=nvo.getNbNo()%>">
				</td>
			</tr>
		</table>
	</form>
	</div>
			</section>
			<footer include-html="/common/ssmMain/footer.html"></footer>
		</div>
		<script>
			includeHTML();
		</script>	
</body>
</html>