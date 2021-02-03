<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.common.utils.UserSession" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userAuthoriry = UserSession.getSessionAU(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>비교과 프로그램 게시판</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
    <link rel="stylesheet" href="/common/ssmCss/default.css">
     <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<script src="/common/ssmJs/goCategory.js?ver=2"></script>
	<script src="/common/ssmJs/index.js"></script>
		<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
		<script>
		$(function() {
			var npo = "";
			$("#insert").click(function(){
				if(1==1){
					alert("들어온닥");
					
				}
				if($("#npObject1").is(":checked")){
					if($("#npObject2").is(":checked")){
						if($("#npObject3").is(":checked")){
							npo="FM,JR,SR";
						}else{
							npo="FM,JR";
						}
					}else{
						if($("#npObject3").is(":checked")){
							npo="FM,SR";
						}else{
							npo="FM";
						}
					}	
				}else{
					if($("#npObject2").is(":checked")){
						if($("#npObject3").is(":checked")){
							npo="JR,SR";		
						}else{
							npo="JR";
						}
					}else{
						npo="SR"
					}
				}

				$("#npObject").val(npo);
				alert($("#npObject").val());
				
				
				
				$("#npInfo").attr("action","/nonprogram/np_InsertData.ssm").submit();
			});
			$("#npRsdate").datepicker({
				  dateFormat: 'yy-mm-dd',
				  prevText: '이전 달',
				  nextText: '다음 달',
				  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				  dayNames: ['일','월','화','수','목','금','토'],
				  dayNamesShort: ['일','월','화','수','목','금','토'],
				  dayNamesMin: ['일','월','화','수','목','금','토'],
				  showMonthAfterYear: true,
				  changeMonth: true,
				  changeYear: true,
				  yearSuffix: '년'
			});
			
			
		});
		
			
		
		
		</script>
	</head>
	<body>
	

	<%@include file="/common/ssmMain/header_.jsp"%>
	<%
	if(userAuthoriry.equals("1")){%>
		<nav include-html="/common/ssmMain/ssmCategory/brSideStudents.html"></nav>
		<%}else if(userAuthoriry.equals("2") || userAuthoriry.equals("3")){%>
			<nav include-html="/common/ssmMain/ssmCategory/brSideTeachers.html"></nav>
			<%
		}
	%>
	<div id="tit">
				<h1>비교과 프로그램</h1>
				<p><a href="/chwc/index.asp">홈</a> > <a href="#메인주소">비교과 프로그램</a> > <a
					href="#주소걸기" class="on">프로그램 글쓰기</a>
				</p>
			</div>
		<form id="npInfo" name="npInfo"  encType="multipart/form-data" method="POST">
			<table border='3'>
				<tr>
					<td>프로그램 제목</td>
					<td><input type="text" id="npTitle" name="npTitle"></td>
				</tr>
					<tr>
					<td>프로그램 내용</td>
					<td><input type="text" id="npContents" name="npContents"></td>
				</tr>
					<tr>
					<td>운영기관</td>
					<td><input type="text" id="npCenter" name="npCenter"></td>
				</tr>
					<tr>
					<td>포스터 첨부</td>
					<td><input type="file" id="npImage" name="npImage"><td>
				</tr>
					<tr>
					<td>접수기한</td>
					<td><input type="text" id="npRsdate" name="npRsdate">~
						<input type="text" id="npRedate" name="npRedate"></td>
				</tr>
					<tr>
					<td>프로그램 진행일</td>
					<td><input type="text" id="npPsdate" name="npPsdate">~
						<input type="text" id="npPedate" name="npPedate"></td>
				</tr>
					<tr>
					<td>신청대상</td>
					<td>
						<input type="checkbox" class="2" id="npObject1" name="npObject1" value="FM">1학년
						<input type="checkbox" class="2" id="npObject2" name="npObject2" value="JR">2학년
						<input type="checkbox" class="2" id="npObject3" name="npObject3" value="SR">3학년
						<input type="hidden" id="npObject" />
					</td>
				</tr>
					<tr>
					<td>인원제한</td>
					<td><input type="text" id="npPersonnel" name="npPersonnel"></td>
				</tr>
					<tr>
					<td>작성자</td>
					<td></td>
				</tr>
					<tr>
					<td>시행 장소</td>
					<td><select id="npIo" name="npIo">
						<option value="I">교내</option>
						<option value="O">교외</option>
						</select>
					</td>
				</tr>
					<tr>
					<td>활동 종류</td>
					<td><select id="Acode" name="Acode">
						<option value="SA">자율</option>
						<option value="CA">동아리</option>
						<option value="VA">봉사</option>
						<option value="DA">진로</option>
						</select></td>
				</tr>
				<tr>
				<td>신청서 양식</td>
				<td><input type="file" id="npFile" name="npFile" ></td>
				</tr>
				<tr>
				<td colspan='2' align='right'>
				<input type="button" id="insert" name="insert" value="게시하기" >
				</td>		
				</tr>
			</table>
		</form>
		
			<script type="text/javascript">
	includeHTML();
	</script>
		
	</body>
</html>