<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.br.vo.Non_ProgramVO,java.util.List" %>
<%	
	String npNo="";
	Object obj = null;
	Non_ProgramVO npvo = new Non_ProgramVO();
	if((obj=request.getAttribute("npNo"))!=null){
		npNo = (String)request.getAttribute("npNo");
	}
	request.setCharacterEncoding("UTF-8");
	String resultStr = (String)request.getAttribute("resultStr");
	
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>결과 화면</title>
			<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				if("<%=resultStr%>" != ""){
					if("${resultStr}".indexOf("성공")>-1){
						alert("성공");
						if("${resultStr}".indexOf("글작성")>-1) location.href="/nonprogram/np_Main.ssm";
						if("${resultStr}".indexOf("업데이트")>-1) location.href="/nonprogram/np_detailData.ssm?npNo=<%=npNo%>";
						if("${resultStr}".indexOf("np삭제 성공")>-1) location.href="/nonprogram/np_Main.ssm";
						if("${resultStr}".indexOf("신청서작성")>-1) location.href="/nonprogram/np_Main.ssm";
						if("${resultStr}".indexOf("디테일")>-1) location.href="/non_Application/non_ApplicationList.ssm";
						if("${resultStr}".indexOf("신청서수정")>-1) location.href="/non_Application/non_ApplicationList.ssm";
						if("${resultStr}".indexOf("동영상 게시")>-1) location.href="/Non_Video/VideoMain.ssm";
						if("${resultStr}".indexOf("동영상 수정")>-1) location.href="/Non_Video/VideoMain.ssm";
						if("${resultStr}".indexOf("동영상 삭제")>-1) location.href="/Non_Video/VideoMain.ssm";
					}else{
						alert("신청되었습니다");
						history.go(-1);
						
						
					}
					
					
				}
				
				
			});

		</script>
	</head>
	<body>
		<form name="def" id="def" method='POST'>

		</form>
	</body>
</html>