<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = "ssm.mi.member.vo.TMemberVO"%>
<% 
	Object obj = request.getAttribute("data");
	System.out.println(">>>>" + obj);
	TMemberVO tvo = (TMemberVO)obj;

	String ttName = tvo.getTtName();
	String ttBirth = tvo.getTtBirth();
	String ttGender = tvo.getTtGender();
	String ttTransferyear = tvo.getTtTransferyear();
	String ttPn = tvo.getTtPn();	
	
	String yy = ttBirth.substring(0, 4);
	String mm = ttBirth.substring(4,6);
	String dd = ttBirth.substring(6);
	System.out.println("String ttGender = tvo.getTtGender()"+ttGender);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	
		<title>교사 가입폼</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src= "/include/js/common.js"></script>
		<script type = "text/javascript">	
			$(document).ready(function(){
				var idc =0; //아이디 중복 체크여부를 확인하는 변수
				var pwc =0; //비밀번호 체크여부를 확인하는 변수
				var ttGender=<%=ttGender%>;
				if(ttGender="7"){$('input:radio[name="ttGender"][value="7"]').prop('checked', true);}
								else{$('input:radio[name="ttGender"][value="8"]').prop('checked', true);}
				
				 
				$("#ttPwCheck").click(function(){
					var ttPwVal = $("#ttPw").val();
					var ttPwCVal = $("#ttPwC").val();
					
					//비번 입력검사
					if (! ttPwVal){
						console.log("(log)pw없음 >>> : " + ! ttPwVal);
						alert("비밀번호를 입력하세요");
						$("#ttPw").focus();
						return false;					
					}//ttPwVal if 끝
					if(!ttPwCVal){
						console.log("(log)pwC없음 >>> "+ !ttPwCVal);
						alert("비밀번호 확인란을 입력하세요");
						$("#ttPwC").focus();
						return false; 
					}//if ttPwCVal끝
					
					if(ttPwVal ==ttPwCVal){
						alert("비밀번호가 확인되었습니다");
						$("#ttPw").attr("readonly",true);
						$("#ttPwC").attr("readonly",true);
						pwc=1;
					}else{
						alert("비밀번호 불일치 : 다시 확인하세요");
						$("#ttPw").val('');
						$("#ttPwC").val('');
						$("#ttPw").focus();
						return false;
					}
				});//ttPwCheck clickfunction끝
				//이메일 입력방식 선택
			 	$('#selectEmail').change(function(){ 
			 		$("#selectEmail option:selected").each(function () { 
				 		if($(this).val()== 'etc'){//직접입력일 경우
						 	$("#ttEmail02").val(''); //값 초기화 
						 	$("#ttEmail02").attr("disabled",false); //활성화
				 		}else{ //직접입력이 아닐경우 
						 	$("#ttEmail02").val($(this).text()); //선택값 입력 
						 	$("#ttEmail02").attr("disabled",true); //비활성화
						} 
			 		}); 
				});
				//가입버튼
				$("#insertData").click(function(){
					console.log("insertData_click >>> ");
					//입력값체크
					var ttEmail = $("#ttEmail01").val()+"@"+$("#ttEmail02").val();
					$("#ttEmail").val(ttEmail);
					
					if (!chkSubmit($('#ttId'),"아이디를")) return;
					else if (!chkSubmit($('#ttPw'),"패스워드를")) return;
					else if (!chkSubmit($('#ttPwC'),"패스워드 확인을")) return;
					else if (pwc==0) return alert("패스워드 확인을 체크하시오");					
					else if (!chkSubmit($('#sjtCode'),"담당과목을")) return;
					else if (!chkSubmit($('#gradeId'),"학년을")) return;
					else if (!chkSubmit($('#classId'),"반을")) return;					
					else if (!chkSubmit($('#ttEmail01'),"이메일을")) return;
					else if (!chkSubmit($('#ttEmail02'),"이메일을")) return;
					else if (!chkSubmit($('#ttImage'),"사진을")) return;
					else{
						if(confirm('등록을 진행할까요?')){
							$("#joinForm").attr({
								"method":"POST",
								"action":"/tMember/joinTMember.ssm"});
							$("#joinForm").submit();
						};//confirm
					}//else
				});//insertData_click	
			});//document ready
		</script>
		<script type="text/javascript">
		////////반번호선택
		
		var g_selbox = new Array('1', '2', '3' );
		var c_selbox = new Array();	
			for (var i =0 ; i<3 ;i++){ c_selbox[i] = new Array('1', '2', '3', '4', '5');}
		
		function init(f){
			console.log(f);
			console.log("init");
			var g_sel = f.gradeId;
			var c_sel = f.classId;
		
		
			g_sel.options[0] = new Option("학년 선택", "");
			c_sel.options[0] = new Option("반 선택", "");

		
			for(var i =0; i<g_selbox.length; i++){
				g_sel.options[i+1] = new Option(g_selbox[i], g_selbox[i]);
			}
			
		}//init(f) onload

		function classIdChange(f){
			var g_sel = f.gradeId;
			var c_sel = f.classId;
			
			var sel = g_sel.selectedIndex;
			for(var i=c_sel.length; i>=0; i--){
				c_sel.options[i] = null;
			}

			c_sel.options[0] = new Option("반 선택", "");

			if(sel != 0){
				for(var i=0; i<c_selbox[sel-1].length; i++){
					c_sel.options[i+1] = new Option(c_selbox[sel-1][i], c_selbox[sel-1][i]);
				}
			}
		}//
		
		function moveFocus(num,here,next){
			 var str = here.value.length;
			 if(str == num)
			    next.focus();
			 }
		</script>
	</head>
	<body onload = "init(this.joinForm);">
		<div align="center">
			<h3>교사 회원정보 입력 화면</h3>
			<form name="joinForm" id="joinForm"	method="POST"	enctype="multipart/form-data">
			<input type="hidden" name="ttPn" id="ttPn" value="<%=ttPn%>">
			<input type="hidden" name="ttGender" id="ttGender" value="<%=ttGender%>">
			
				<table border="1" align="center">
					<tr>
						<th scope="row" colspan="2" align="center">
							교직원 정보
						</th>			
					</tr>
					<tr>
						<th> 이름 </th>
						<td><input type = text name="ttName" id="ttName" value="<%=ttName%>" readonly></td>
					</tr>
					<tr>
						<th scope="row"> 생년월일</th>
						<td>
							<input type="text" id="yy"  style="width:80px;" maxlength="4" value ="<%=yy%>" readonly> 년
							<input id="mm" name="mm"  style="width:80px;" value="<%=mm%>" readonly> 월						
							<input type="text" id="dd" name ="dd" style="width:80px;" value="<%=dd%>" maxlength="2">일	
						</td>
					</tr>
										<tr>
						<th scope="row"> 성별 </th>
						<td>
							<input type = "radio" name="ttGender" id="ttGenderF" value="7" disabled> 여성
							<input type = "radio" name="ttGender" id="ttGenderM" value="8" disabled> 남성
						</td>
					</tr>
					<tr>
						<th scope="row"> 담당과목 </th>
						<td>
							<select id="sjtCode" name="sjtCode">
								<option value="">과목 선택</option>
				  	 			<option value="SJT01">진로진학상담(진로와직업/Wee Class 상담)</option>
				  	 			<option value="SJT02">국어</option>
				  	 			<option value="SJT03">영어</option>
                                <option value="SJT04">수학</option>
                                <option value="SJT05">사회탐구(역사,도덕포함)</option>
                                <option value="SJT06">과학탐구</option>
                                <option value="SJT07">체육·예술(음악,미술)</option>
                                <option value="SJT08">생활·교양(기술가정,한문)</option>
                                <option value="SJT09">제2외국어</option>
                                <option value="SJT10">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row"> 아이디</th>
						<td>
							<input type = text name= "ttId" id="ttId"/>
							<input type="button" id="ttIdCheck" value="아이디중복체크"/>
							<div id="ajaxResData">아이디 중복체크하시오</div>								
						</td>
					</tr>
					<tr>
						<th scope="row"> 패스워드 </th>
						<td> <input type="password"	name="ttPw" id="ttPw" size="21"></td>
					</tr>
					<tr>
						<th scope="row"> 패스워드 확인</th>
						<td>
						<input type="password"	name="ttPwC" id="ttPwC" size="21"/>&nbsp;&nbsp;&nbsp;
						<input type="button"	name="ttPwCheck" id="ttPwCheck" value="비밀번호확인"/>
						</td>
					</tr>

					<tr>
						<th scope="row">현 근무지 전입년도 </th>
						<td><input type = text name="ttTransferyear" id="ttTransferyear" value="<%=ttTransferyear%>" readonly></td>
					</tr>
					<tr id="gradeClass" class="gradeClass">
						<th scope="row"><label>학년/반</label></th>
						<td>
							<select id="gradeId" name="gradeId" style="width:80px;" onchange="classIdChange(this.form);"  ></select>
							<label for="gradeId">학년</label>
							<select id="classId" name="classId" style="width:80px;"></select>
							<label for="classId">반</label>
						</td>
					</tr>
					<tr>
						<th scope="row"> 이메일 </th>
						<td><input type = hidden name="ttEmail" id="ttEmail">
							<input type="text" name="ttEmail01" id="ttEmail01" style="width:100px"> 
						@ 	<input type="text" name="ttEmail02" id="ttEmail02" style="width:100px;" disabled placeholder="선택해주세요"> 
							<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> 
								<option value="선택해주세요" selected>선택해주세요</option>								
								<option value="naver.com">naver.com</option>  
								<option value="hanmail.net">hanmail.net</option> 
								<option value="gmail.com">gmail.com</option> 
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option> 
								<option value="freechal.com">freechal.com</option> 
								<option value="hanmir.com">hanmir.com</option> 
								<option value="korea.com">korea.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option> 					
								<option value="paran.com">paran.com</option> 
								<option value="etc">직접입력</option> 
							</select> 
						

					</td>
					</tr>
					<tr>
						<th scope="row">프로필 사진</th>
						<td><input type="file" id= "ttImage" name="ttImage"></td><br>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type = "button" id="insertData" value="가입" />
							<input type ="reset" value="다시"/>							
						</td>
					</tr>			
				</table>		
			</form>
		</div>
	</body>
</html>