<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); 
	Object obj = request.getAttribute("alert");
	String alertt = "";
	if(obj != null){
		alertt = (String)obj;
	}
	Object obj1 = request.getAttribute("mode");
	String mode = "";
	if(obj1 != null){
		mode = (String)obj1;
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>joinCheckForm</title>
		<link rel="stylesheet" href="/common/ssmCss/default.css">
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript" src= "/include/js/common.js"></script>
		<script src="/common/ssmJs/index.js"></script>
		<script src="/common/ssmJs/goCategory.js?ver=1"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#sChk").click(function(){
					$("#sChkForm").show();
					$("#tChkForm").hide();
				});
				$("#tChk").click(function(){
					$("#tChkForm").show();
					$("#sChkForm").hide();
				});
				
				/***정보불일치 checkForm 반환 메시지 ****/
				var mode = "<%=mode%>";
				console.log("mode>>> : "+mode);
				if (mode=="failed"){
					alert("일치하는 인적 정보가 없습니다");
				}
				if("<%=alertt%>".length > 0){
					alert("<%=alertt%>");
				}
				
				
				$("#sJoinCheck").click(function(){
					//휴대폰 번호 데이터 붙이기
					var ssPn = $("#shp1").val() + $("#shp2").val() + $("#shp3").val();
					$("#ssPn").val(ssPn);
					console.log($("#ssPn").val());
					
					var syy = $("#syy").val();
					var smm = $("#smm option:selected").val();
					var sdd = $("#sdd").val();
					
					if (syy.length !==4 || syy == ""){
						alert("태어난 년도 4자리를 정확하게 입력하세요.");
						return false;
					}
					if (smm.length == 1) {
					    smm = "0" + smm;
					}
					if (sdd.length == 1) {
					    sdd = "0" + sdd;
					}
					
					//생년월일 데이터 붙이기
					var ssBirth = syy + smm+ sdd;
					$("#ssBirth").val(ssBirth);
					console.log($("#ssBirth").val());
					//폼보내기
					$("#chk_form")
					.attr("action","/smember/checkInfo.ssm")
					.submit();
				});
				$("#tJoinCheck").click(function(){
					//휴대폰 번호 데이터 붙이기
					var ttPn = $("#tthp1").val() + $("#tthp2").val() + $("#tthp3").val();
					$("#ttPn").val(ttPn);
					alert($("#ttPn").val());
					
					if(!chkSubmit($('#ttName'),"이름을")) return;
					else if (!chkSubmit($('#tyy'),"생년월일을")) return;
					else if (!chkSubmit($('#tmm'),"생년월일을")) return;
					else if (!chkSubmit($('#tdd'),"생년월일을")) return;
					
					var tyy = $("#tyy").val();
					var tmm = $("#tmm option:selected").val();
					var tdd = $("#tdd").val();
					
					if (tyy.length !==4 || tyy == ""){
						alert("태어난 년도 4자리를 정확하게 입력하세요.");
						return false;
					}
					if (tmm.length == 1) {
					    tmm = "0" + tmm;
					}
					if (tdd.length == 1) {
					    tdd = "0" + tdd;
					}
					if (!$("input:radio[name='ttGender']").is(":checked")) return alert("성별을 선택하시오");
					else if (!chkSubmit($('#ttTransferyear'),"현 근무지 전입년도를")) return;
	
					//생년월일 데이터 붙이기
					var ttBirth = tyy + tmm+ tdd;
					$("#ttBirth").val(ttBirth);
					console.log($("#ttBirth").val());
					//버튼이벤트 수행
					$("#chk_form")
					.attr("action","/tMember/joinTMemCheck.ssm")
					.submit();
				});//tJoinCheck
			});//ready
			function moveFocus(num,here,next){
				 var str = here.value.length;
				 if(str == num)
				    next.focus();
			 }  
			
		</script>
	</head>
	<body>
		<header include-html="/common/ssmMain/header_.jsp"></header>
		<form name="chk_form" id="chk_form" method="post">
			<div>
				<span><h3>회원가입 가능 여부 체크</h3></span>
				<input type="button" id="sChk" value="학생">
				<input type="button" id="tChk" value="교사">	
			</div>
			<div style="display: none;"  id="sChkForm">
				<table class="table table-bordered">
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="ssName" id="ssName" >
						</td>
					</tr>
					<tr>	
						<th>생년월일</th>
						<td><input type = hidden name="ssBirth" id="ssBirth">
							<input type="text" id="syy" name="syy"  placeholder="년(4자)" class="int"  style="width:80px;" maxlength="4" 
							onkeyup="moveFocus(4,this,this.form.smm);">
							<select id="smm" name="smm" class="sel" style="width:80px;" onchange="form.dd.focus()" >
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
							<input type="text" id="sdd" name ="sdd" style="width:80px;" placeholder="일" class="int" maxlength="2">
						</td>
					</tr>
					<tr>
						<th scope="row"> 휴대폰번호 </th>
						<td><input type = hidden name="ssPn" id="ssPn">
							<select id="shp1" name="shp1" onchange="form.shp2.focus()" style="width:80px;" >
								<option value="010" selected="selected">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
								<option value="0139">0139</option>
							</select>
							<span class="hypen">-</span>
							<input type="text"  id="shp2" name="shp2" title="앞번호4자리" onkeyup="moveFocus(4,this,this.form.shp3);" maxlength="4" style="width:80px;">
							<span class="hypen">-</span>
							<input type="text"  id="shp3" name="shp3" title="뒷번호4자리" maxlength="4" style="width:80px;">
						</td>
					</tr>
					<tr align="center" >
						<td colspan="4">
							<input type="button" name="sJoinCheck" id="sJoinCheck" value="정보확인">
						</td>
					</tr>
				</table>
			</div>
			<div style="display: none;" id="tChkForm">
				<table class="table table-bordered">
					<tr>
						<th>이름</th>
						<td>
							<input class="input" type="text" name="ttName" id="ttName" >
						</td>
					</tr>
					<tr>	
						<th>생년월일</th>
						<td><input type = hidden name="ttBirth" id="ttBirth">
							<input type="text" id="tyy" name="tyy"  placeholder="년(4자)" class="int"  style="width:80px;" maxlength="4" 
							onkeyup="moveFocus(4,this,this.form.tmm);">
							<select id="tmm" name="mm" class="sel" style="width:80px;" onchange="form.dd.focus()" >
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
							<input type="text" id="tdd" name ="tdd" style="width:80px;" placeholder="일" class="int" maxlength="2">
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
							<select id="tthp1" name="thp1" onchange="form.tthp2.focus()" style="width:80px;" >
								<option value="010" selected="selected">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
								<option value="0139">0139</option>
							</select>
							<span class="hypen">-</span>
							<input type="text"  id="tthp2" name="tthp2" title="앞번호4자리" onkeyup="moveFocus(4,this,this.form.hp3);" maxlength="4" style="width:80px;">
							<span class="hypen">-</span>
							<input type="text"  id="tthp3" name="tthp3" title="뒷번호4자리" maxlength="4" style="width:80px;">
						</td>
					</tr>
					<tr align="center" >
						<td colspan="4">
							<input type="button" name="tJoinCheck" id="tJoinCheck" value="정보확인">
						</td>
					</tr>
				</table>
			</div>			
		</form>
		<footer include-html="/common/ssmMain/footer.html"></footer>
		<script>
			includeHTML();
		</script>
	</body>
</html>