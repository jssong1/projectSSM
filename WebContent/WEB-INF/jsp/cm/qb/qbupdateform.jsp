<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cm.vo.QnABoardVO" %> 

<%
	QnABoardVO qvo =(QnABoardVO)request.getAttribute("updateData");
%>
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
	    	 elPlaceHolder: "qbContents",
	    	 sSkinURI: "/navereditor/SmartEditor2Skin_ko_KR1.html",
	    	 fCreator: "createSEditor2"
	    	})
	    	
	    	// 셀렉박스 값 가져오기
	    	var QbType = "<%=qvo.getQbType()%>";
			$("#qbType").val(QbType);

	    	
	    	$("#submitbutton").click(function(){
	    		
	    		var qbType=$("#qbType").val();
	    		var qbTitle=$("#qbTitle").val();
	    		var qbContents=$("#qbContents").val();
	    		if(qbType == "게시판선택"){alert("게시판을 선택하세요");return}
	    		if(qbTitle == ""){alert("제목을 입력하세요");return}
	    		if(qbContents == ""){alert("글 내용을 입력하세요");return}
	    		
	    		
	    		oEditors.getById["qbContents"].exec("UPDATE_CONTENTS_FIELD", []);
	    		$("#qbupdateform").attr('action','/qnaboard/qbupdate.ssm').submit();
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
	<form id="qbupdateform" name="qbupdateform">
		<table border="1">
			<colgroup>
				<col width="100px"></col>
				<col width="800px"></col>
			</colgroup>
			<tr>
				<td colspan="2">Q&A게시판 글수정하기<td>
			</tr>
			<tr>
				<td> Q&A 유형 </td>
				<td style="width:856px; float:left;">>
					<select id="qbType" name="qbType">
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
				<td>글제목</td>
				<td><input type="text" class="A" id="qbTitle" name="qbTitle" value="<%=qvo.getQbTitle()%>">
					<div class="bytes-wrapper">
        				<span class="C">0</span>bytes
    				</div>
    			</td>
			</tr>
			<tr>
				<td>글내용</td>
			<td><textarea name="qbContents" id="qbContents" rows="10" cols="50" ><%=qvo.getQbContents()%></textarea></td>
			</tr>
			<tr>
				<td>비밀글 설정</td>
				<td>
					<input type="radio" id="qbSecretyn" name="qbSecretyn" value="N">공개글
					<input type="radio" id="qbSecretyn" name="qbSecretyn" value="Y" checked>비밀글
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id ="submitbutton" name="submitbutton" value="수정">
					<input type="hidden" id ="qbNo" name="qbNo" value="<%=qvo.getQbNo()%>">
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