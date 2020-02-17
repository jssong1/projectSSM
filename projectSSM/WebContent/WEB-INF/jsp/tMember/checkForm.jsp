<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); 
	
	Object obj = request.getAttribute("mode");
	String mode = "";
	if(obj != null){
		mode = (String)obj;
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>checkForm.jsp</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript" src= "/include/js/common.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				/***정보불일치 checkForm 반환 메시지 ****/
				var mode = "<%=mode%>";
				console.log("mode>>> : "+mode);
				if (mode=="failed"){
					alert("일치하는 인적 정보가 없습니다");
				};
						
				/***check 확인버튼클릭시 ****/
				$("#check").click(function(){
					
					//휴대폰 번호 데이터 붙이기
					var ttPn = $("#hp1").val() + $("#hp2").val() + $("#hp3").val();
					$("#ttPn").val(ttPn);
					console.log($("#ttPn").val());
					
					if(!chkSubmit($('#ttName'),"이름을")) return;
					else if (!chkSubmit($('#yy'),"생년월일을")) return;
					else if (!chkSubmit($('#mm'),"생년월일을")) return;
					else if (!chkSubmit($('#dd'),"생년월일을")) return;
					
					var yy = $("#yy").val();
					var mm = $("#mm option:selected").val();
					var dd = $("#dd").val();
					
					if (yy.length !==4 || yy == ""){
						alert("태어난 년도 4자리를 정확하게 입력하세요.");
						return false;
					}
					if (mm.length == 1) {
					    mm = "0" + mm;
					}
					if (dd.length == 1) {
					    dd = "0" + dd;
					}
					if (!$("input:radio[name='ttGender']").is(":checked")) return alert("성별을 선택하시오");
					else if (!chkSubmit($('#ttTransferyear'),"현 근무지 전입년도를")) return;
					else if ($("#ttPn").val() == "" || $("#ttPn").val().length != 11 || isNaN($("#ttPn").val())) return  alert("휴대폰번호를 정확히 입력해 주세요");

					//생년월일 데이터 붙이기
					var ttBirth = yy + mm+ dd;
					$("#ttBirth").val(ttBirth);
					console.log($("#ttBirth").val());
					//버튼이벤트 수행
					$("#chk_form")
					.attr("action","/tMember/joinTMemCheck.ssm")
					.submit();
				});
			});//document ready
			
			/***focus 이동****/
			function moveFocus(num,here,next){
				var str = here.value.length;
				if(str == num)
					next.focus();
			}
		</script>
	</head>
	<body>
		<form name="chk_form" id="chk_form" method="post">
			<table border="1" align="center">
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="ttName" id="ttName" >
					</td>
				</tr>
				<tr>	
					<th>생년월일</th>
					<td><input type = hidden name="ttBirth" id="ttBirth">
						<input type="text" id="yy" name="yy"  placeholder="년(4자)" class="int"  style="width:80px;" maxlength="4" onkeyup="moveFocus(4,this,this.form.mm);">
						<select id="mm" name="mm" class="sel" style="width:80px;" onchange="form.dd.focus()" >
							<option value="">월</option>
			  	 			<option value="01">01</option>
			  	 			<option value="02">02</option>
			  	 			<option value="03">03</option>
			  	 			<option value="04">04</option>
			  	 			<option value="05">05</option>
			  	 			<option value="06">06</option>
			  	 			<option value="07">07</option>
			  	 			<option value="08">08</option>
			  	 			<option value="09">09</option>
			  	 			<option value="10">10</option>
			  	 			<option value="11">11</option>
			  	 			<option value="12">12</option>
						</select>
						<input type="text" id="dd" name ="dd" style="width:80px;" placeholder="일" class="int" maxlength="2">
					</td>
				</tr>
				<tr>
					<th scope="row"> 성별 </th>
					<td>
						<input type = "radio" name="ttGender" id="ttGenderF" value="7"> F 
						<input type = "radio" name="ttGender" id="ttGenderM" value="8"> M
					</td>
				</tr>
				<tr>
						<th scope="row">현 근무지 전입년도 </th>
						<td><input type = text name="ttTransferyear" id="ttTransferyear" placeholder="년(4자)"></td>
				</tr>
				<tr>
					<th scope="row"> 휴대폰번호 </th>
					<td><input type = hidden name="ttPn" id="ttPn">
						<select id="hp1" name="hp1" onchange="form.hp2.focus()" style="width:80px;" >
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							<option value="0139">0139</option>
						</select>
						<span class="hypen">-</span>
						<input type="text"  id="hp2" name="hp2" title="앞번호4자리" onkeyup="moveFocus(4,this,this.form.hp3);" maxlength="4" style="width:80px;">
						<span class="hypen">-</span>
						<input type="text"  id="hp3" name="hp3" title="뒷번호4자리" maxlength="4" style="width:80px;">
					</td>
				</tr>
				<tr align="center" >
					<td colspan="4">
						<input type="button" name="check" id="check" value="정보확인">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>