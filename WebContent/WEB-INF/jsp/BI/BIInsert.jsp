<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ssm.mi.vo.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	Object obj = null;
	Object objNO = null;
	Object objPn = null;
	String ssPn         = "";
	String isud         = "";
	String biNo         = ""; // 글번호
	String ssNo         = ""; // 글 작성자의 학번
	String biInterest   = ""; // 취미
	String biAddress    = ""; // 거주지 주소
	String biPn         = ""; // 휴대폰번호
	String biRType      = ""; // 거주형태
	String biCType      = ""; // 통학편
	String biCTime      = ""; // 통학시간
	String biIncome     = ""; // 학비/생활비출처
	String biPJob       = ""; // 경제활동정도
	String biCA         = ""; // (동아리)가입여부
	String biSense      = ""; // 입학 후 느낀점
	String biWJ         = ""; // 졸업 후 하고 싶은 일(희망)
	String biWF    	    = ""; // 희망하는 직무
	String biWI         = ""; // 희망하는 산업
	String biReason     = ""; // 희망하는 이유
	String biComment    = ""; // 선생님에게 하고 싶은 말
	String biDeleteYN   = ""; // 삭제여부
	String biInsertdate = ""; // 작성일
	String biUpdatedate = ""; // 수정일
	String postNo = "";
	String addr   = "";
	String addr2  = "";
	obj = request.getAttribute("list");
	if(obj != null){
		isud = "U";
		List list = (List)obj;
		BasicInformationVO bvo = (BasicInformationVO)list.get(0);
		biNo         = bvo.getBiNo();
		ssNo         = bvo.getSsNo();
		if(bvo.getBiInterest()   != null){biInterest   = bvo.getBiInterest();}
		if(bvo.getBiAddress()    != null){biAddress    = bvo.getBiAddress();}
		if(bvo.getBiPn()         != null){biPn         = bvo.getBiPn();}
		if(bvo.getBiRType()      != null){biRType      = bvo.getBiRType();}
		if(bvo.getBiCType()      != null){biCType      = bvo.getBiCType();}
		if(bvo.getBiCTime()      != null){biCTime      = bvo.getBiCTime();}
		if(bvo.getBiIncome()     != null){biIncome     = bvo.getBiIncome();}
		if(bvo.getBiPJob()       != null){biPJob       = bvo.getBiPJob();}
		if(bvo.getBiCA()         != null){biCA         = bvo.getBiCA();}
		if(bvo.getBiSense()      != null){biSense      = bvo.getBiSense();}
		if(bvo.getBiWJ()         != null){biWJ         = bvo.getBiWJ();}
		if(bvo.getBiWF()         != null){biWF    	   = bvo.getBiWF();}
		if(bvo.getBiWI()         != null){biWI         = bvo.getBiWI();}
		if(bvo.getBiReason()     != null){biReason     = bvo.getBiReason();}
		if(bvo.getBiComment()    != null){biComment    = bvo.getBiComment();}
		if(bvo.getBiDeleteYN()   != null){biDeleteYN   = bvo.getBiDeleteYN();}
		if(bvo.getBiInsertdate() != null){biInsertdate = bvo.getBiInsertdate();}
		if(bvo.getBiUpdatedate() != null){biUpdatedate = bvo.getBiUpdatedate();}
		if(bvo.getBiAddress()    != null){if(biAddress.split("_")[0] != null){postNo = biAddress.split("_")[0];}}
		if(bvo.getBiAddress()    != null){if(biAddress.split("_")[1] != null){addr   = biAddress.split("_")[1];}}
		if(bvo.getBiAddress()    != null){if(biAddress.split("_")[2] != null){addr2  = biAddress.split("_")[2];}}
		System.out.println("asdad"+bvo.getBiPn()+bvo.getBiAddress());
		System.out.println("asdad"+bvo.getBiCA());
	}else{
		isud = "I";
		objNO = request.getAttribute("ssNo");
		ssNo  = (String)objNO;
		objPn = request.getAttribute("svo");
		SMemberVO svo  = (SMemberVO)objPn;
		ssPn = svo.getSsPn();
		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BIInsert.jsp</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						console.log(data);
		                // 도로명 주소의 노출 규칙에 따라 주 소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
						var addr = "";
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		                if(fullRoadAddr !== ''){
		                    fullRoadAddr += extraRoadAddr;
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postNo').value = data.zonecode; //5자리 새우편번호 사용
		                
// 		                if(fullRoadAddr != null){
// 		                	document.getElementById('jAddr').value = fullRoadAddr;
// 		                }else{
// 		                	document.getElementById('jAddr').value = data.jibunAddress;
// 		                }
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		                document.getElementById('addr').value = addr;
		            }
		        }).open();
		    }
		</script>
		<script type="text/javascript">
			$(function(){
				val();	
				$("#save").click(function(){
					alert("gkg"+$("#biCA").val());
					var a1 = $("#postNo").val();
					var a2 = $("#addr").val();
					var a3 = $("#addr2").val();
					if(a1 == ""){a1 =' ';}
					if(a2 == ""){a2 =' ';}
					if(a3 == ""){a3 =' ';}
					$("#biAddress").val(a1+"_"+a2+"_"+a3);
					$("#form").attr("action","/smember/BIInsert.ssm").submit();
				});
			});
			function val(){
				$("#ISUD_TYPE").val("<%=isud%>");
				$("#ssNo").val("<%=ssNo%>");
				
				if($("#ISUD_TYPE").val() == "I"){
					$("#biPn").val("<%=ssPn%>");
					
					
				}else if($("#ISUD_TYPE").val() == "U"){
					$("#biNo").val("<%=biNo%>");
					$("#biPn").val("<%=biPn%>");
					$("#postNo").val("<%=postNo%>");
					$("#addr").val("<%=addr%>");
					$("#addr2").val("<%=addr2%>");
<%-- 					$("#biRType").val("<%=biRType%>"); --%>
<%-- 					$("#biCType").val("<%=biCType%>"); --%>
<%-- 					$("#biCTime").val("<%=biCTime%>"); --%>
<%-- 					$("#biIncome").val("<%=biIncome%>"); --%>
<%-- 					$("#biPJob").val("<%=biPJob%>"); --%>
<%-- 					$("#biCA").val("<%=biCA%>"); --%>
					for(var i=1;i<=5;i++){
						if($("#biRType"+i).val() == "<%=biRType%>"){
							$("#biRType"+i).attr("checked",true);
							break;
						}
					}
					for(var i=1;i<=4;i++){
						if($("#biCType"+i).val() == "<%=biCType%>"){
							$("#biCType"+i).attr("checked",true);
							break;
						}
					}
					for(var i=1;i<=4;i++){
						if($("#biCTime"+i).val() == "<%=biCTime%>"){
							$("#biCTime"+i).attr("checked",true);
							break;
						}
					}
					for(var i=1;i<=3;i++){
						if($("#biIncome"+i).val() == "<%=biIncome%>"){
							$("#biIncome"+i).attr("checked",true);
							break;
						}
					}
					for(var i=1;i<=6;i++){
						if($("#biPJob"+i).val() == "<%=biPJob%>"){
							$("#biPJob"+i).attr("checked",true);
							break;
						}
					}
					for(var i=1;i<=2;i++){
						if($("#biCA"+i).val() == "<%=biCA%>"){
							$("#biCA"+i).attr("checked",true);
							break;
						}
					}
					
					$("#biInterest").val("<%=biInterest%>");
					$("#biSense").val("<%=biSense%>");
					$("#biWJ").val("<%=biWJ%>");
					$("#biWF").val("<%=biWF%>");
					$("#biWI").val("<%=biWI%>");
					$("#biReason").val("<%=biReason%>");
					$("#biComment").val("<%=biComment%>");
				}
			}
		</script>
	</head>
	<body>
		<form name="form" id="form">
			<input type="hidden" name="ISUD_TYPE" id="ISUD_TYPE">
			<input type="hidden" name="biNo" id="biNo">
			<input type="hidden" name="biAddress" id="biAddress">
			<table align="center">
				<tr>
					<td><h3>기초조사 정보</h3></td>
				</tr>
				<tr>
					<td>학번</td>
					<td><input type="text" name="ssNo" id="ssNo" readonly></td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td><input type="text" name="biPn" id="biPn" readonly></td>
				</tr>
				<tr>
					<td>거주지 주소</td>
					<td>
						<input type="text" name="postNo" id="postNo" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="addr"  id="addr" placeholder="지번 or 도로명주소">
						<input type="text" name="addr2" id="addr2" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<td>거주형태</td>
					<td>
						<input type="radio" class="biRType" name="biRType" id="biRType1" value="집에서 통학">집에서 통학
						<input type="radio" class="biRType" name="biRType" id="biRType2" value="기숙사">기숙사
						<input type="radio" class="biRType" name="biRType" id="biRType3" value="자취">자취
						<input type="radio" class="biRType" name="biRType" id="biRType4" value="하숙">하숙
						<input type="radio" class="biRType" name="biRType" id="biRType5" value="기타">기타
					</td>
				</tr>
				<tr>
					<td>통학편</td>
					<td>
						<input type="radio" class="biCType" name="biCType" id="biCType1" value="도보">도보
						<input type="radio" class="biCType" name="biCType" id="biCType2" value="자전거(원동기장치 포함)">자전거(원동기장치 포함)
						<input type="radio" class="biCType" name="biCType" id="biCType3" value="지하철  or 버스">지하철  or 버스
						<input type="radio" class="biCType" name="biCType" id="biCType4" value="자가용(50cc초과)">자가용(50cc초과)
					</td>
				</tr>
				<tr>
					<td>통학시간</td>
					<td>
						<input type="radio" class="biCTime" name="biCTime" id="biCTime1" value="10분 이내">10분 이내
						<input type="radio" class="biCTime" name="biCTime" id="biCTime2" value="30분 이내">30분 이내
						<input type="radio" class="biCTime" name="biCTime" id="biCTime3" value="1시간 이내">1시간 이내
						<input type="radio" class="biCTime" name="biCTime" id="biCTime4" value="1시간 이상">1시간 이상
					</td>
				</tr>
				<tr>
					<td>학비/생활비출처</td>
					<td>
						<input type="radio" class="biIncome" name="biIncome" id="biIncome1" value="부모님">부모님
						<input type="radio" class="biIncome" name="biIncome" id="biIncome2" value="아르바이트">아르바이트
						<input type="radio" class="biIncome" name="biIncome" id="biIncome3" value="정부지원금">정부지원금
					</td>
				</tr>
				<tr>
					<td>경제활동정도(기준:1주)</td>
					<td>
						<input type="radio" class="biPJob" name="biPJob" id="biPJob1" value="하지않음">하지않음
						<input type="radio" class="biPJob" name="biPJob" id="biPJob2" value="비정기적">비정기적
						<input type="radio" class="biPJob" name="biPJob" id="biPJob3" value="5시간이상">5시간이상
						<input type="radio" class="biPJob" name="biPJob" id="biPJob4" value="10시간이상">10시간이상
						<input type="radio" class="biPJob" name="biPJob" id="biPJob5" value="20시간이상">20시간이상
						<input type="radio" class="biPJob" name="biPJob" id="biPJob6" value="30시간이상">30시간이상
					</td>
				</tr>
				<tr>
					<td>(동아리)가입여부</td>
					<td>
						<input type="radio" name="biCA" id="biCA1" value="예">예
						<input type="radio" name="biCA" id="biCA2" value="아니오">아니오
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td><input type="text" name="biInterest" id="biInterest"></td>
				</tr>
				<tr>
					<td>입학 후 느낀점</td>
					<td><textarea rows="10" cols="50" name="biSense" id="biSense"></textarea></td>
				</tr>
				<tr>
					<td>졸업 후 하고 싶은 일,공부(희망)</td>
					<td><input type="text" name="biWJ" id="biWJ"></td>
				</tr>
				<tr>
					<td>희망하는 직무,학과</td>
					<td><input type="text" name="biWF" id="biWF"></td>
				</tr>
				<tr>
					<td>희망하는 산업</td>
					<td><input type="text" name="biWI" id="biWI"></td>
				</tr>
				<tr>
					<td>희망하는 이유</td>
					<td><textarea rows="10" cols="50" name="biReason" id="biReason"></textarea></td>
				</tr>
				<tr>
					<td>선생님에게 하고 싶은 말</td>
					<td><textarea rows="10" cols="50" name="biComment" id="biComment"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" name="save" id="save" value="저장하기">
						<input type="reset" value="리셋">
						<input type="button" name="cancel" id="cancel" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>