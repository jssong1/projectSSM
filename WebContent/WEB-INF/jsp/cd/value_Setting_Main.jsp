<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ssm.cd.vo.Value_SettingVO,java.util.List" %>
<% request.setCharacterEncoding("UTF-8");
	String ssNo="";
	String vsFirst="";
	String vsSecond="";
	String vsThird="";
	String isud = "";
	Value_SettingVO vsvo = new Value_SettingVO();
	Object obj = request.getAttribute("list");
	String resultStr= (String)request.getAttribute("resultStr");
	if(obj!=null&&obj!=""){
	 List list = (List)request.getAttribute("list");
	 vsvo = (Value_SettingVO)list.get(0);
	 ssNo=vsvo.getSsNo();
	 vsFirst=vsvo.getVsFirst();
	 vsSecond=vsvo.getVsSecond();
	 vsThird=vsvo.getVsThird();
	isud = "U";
	}else{
		isud = "I";
	}
	

%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>valueSetting</title>
		 <link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
	      <link rel="stylesheet" href="/common/ssmCss/default.css">
	      <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	      <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
	      <script src="/common/ssmJs/goCategory.js"></script>
	      <script src="/common/ssmJs/index.js"></script>
	      <script src="/common/ssmJs/goBoard.js"></script>
	      <script src="/common/ssmJs/goLogin.js"></script>
	      <link rel="stylesheet" href="/common/ssmCss/s_base.css">
		<link rel="stylesheet" href="/common/ssmCss/s_content.css">
		<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
		<link rel="stylesheet" href="/common/ssmCss/cd.css">
<script type="text/javascript">
	$(function(){
		if("<%=resultStr%>" != 'null') alert("<%=resultStr%>");
		
		$("#ISUD").val("<%=isud%>");
		if("<%=vsFirst%>"=="HE") $("#select1").val("봉사");
		if("<%=vsFirst%>"=="CH") $("#select1").val("변화");
		if("<%=vsFirst%>"=="SU") $("#select1").val("성공");
		if("<%=vsFirst%>"=="LE") $("#select1").val("여가");
		if("<%=vsFirst%>"=="MN") $("#select1").val("돈");
		if("<%=vsFirst%>"=="CO") $("#select1").val("공익");
		if("<%=vsFirst%>"=="CR") $("#select1").val("창조");
		if("<%=vsFirst%>"=="KN") $("#select1").val("지식");
		
		if("<%=vsSecond%>"=="HE") $("#select2").val("봉사");
		if("<%=vsSecond%>"=="CH") $("#select2").val("변화");
		if("<%=vsSecond%>"=="SU") $("#select2").val("성공");
		if("<%=vsSecond%>"=="LE") $("#select2").val("여가");
		if("<%=vsSecond%>"=="MN") $("#select2").val("돈");
		if("<%=vsSecond%>"=="CO") $("#select2").val("공익");
		if("<%=vsSecond%>"=="CR") $("#select2").val("창조");
		if("<%=vsSecond%>"=="KN") $("#select2").val("지식");
		
		if("<%=vsThird%>"=="HE") $("#select3").val("봉사");
		if("<%=vsThird%>"=="CH") $("#select3").val("변화");
		if("<%=vsThird%>"=="SU") $("#select3").val("성공");
		if("<%=vsThird%>"=="LE") $("#select3").val("여가");
		if("<%=vsThird%>"=="MN") $("#select3").val("돈");
		if("<%=vsThird%>"=="CO") $("#select3").val("공익");
		if("<%=vsThird%>"=="CR") $("#select3").val("창조");
		if("<%=vsThird%>"=="KN") $("#select3").val("지식");
		
		$("#saveValueSetting").click(function(){
			var valueK = $("#select1").val();
			if(valueK=="봉사") var valueE = "HE";
			if(valueK=="변화") var valueE = "CH";
			if(valueK=="성공") var valueE = "SU";
			if(valueK=="여가") var valueE = "LE";
			if(valueK=="돈") var valueE = "MN";			
			if(valueK=="공익") var valueE = "CO";
			if(valueK=="창조") var valueE = "CR";
			if(valueK=="지식") var valueE = "KN";
			$("#select1").val(valueE);

			var valueK2 = $("#select2").val();
			if(valueK2=="봉사") var valueE2 = "HE";
			if(valueK2=="변화") var valueE2 = "CH";
			if(valueK2=="성공") var valueE2 = "SU";
			if(valueK2=="여가") var valueE2 = "LE";
			if(valueK2=="돈") var valueE2= "MN";			
			if(valueK2=="공익") var valueE2 = "CO";
			if(valueK2=="창조") var valueE2 = "CR";
			if(valueK2=="지식") var valueE2 = "KN";
			$("#select2").val(valueE2);
			
			var valueK3 = $("#select3").val();
			if(valueK3=="봉사") var valueE3 = "HE";
			if(valueK3=="변화") var valueE3 = "CH";
			if(valueK3=="성공") var valueE3 = "SU";
			if(valueK3=="여가") var valueE3 = "LE";
			if(valueK3=="돈") var valueE3= "MN";			
			if(valueK3=="공익") var valueE3 = "CO";
			if(valueK3=="창조") var valueE3 = "CR";
			if(valueK3=="지식") var valueE3 = "KN";
			$("#select3").val(valueE3);
			

			$("#select_Info").attr("action","/value_Setting/saveValueSetting.ssm").submit();
		});
		
		
		$(".HE").click(function(){
			//alert("봉사클릭");
			select("봉사");
		});
		$(".CH").click(function(){
			//alert("변화클릭");
			select("변화");
		});
		
		$(".SU").click(function(){
			//alert("성공클릭");
			select("성공");
		});
		
		$(".LE").click(function(){
			//alert("여가클릭");
			select("여가");
		});
		
		$(".MN").click(function(){
			//alert("돈클릭");
			select("돈");
		});
		
		$(".CO").click(function(){
			//alert("공익클릭");
			select("공익");
		});
		
		$(".CR").click(function(){
			//alert("창조클릭");
			select("창조");
		});
		
		$(".KN").click(function(){
			//alert("지식클릭");
			select("지식");
		});
		
	});
	
	function select(vs){ 
		for(var i =1 ; i<4;i++){
			if($("#select"+i).val()== vs){
				$("#select"+i).val("");
				//alert("이미 있는거임 지울게여");
				return;
			}
		}
		//alert("select함수 시작");
		if($("#select1").val()==""){
			//alert("select1널임!!");
			$("#select1").val(vs);
			//alert($('#select1').val());
			return;
		}

		if($("#select2").val()==""){
			//alert("select2널임!!");
	
			$("#select2").val(vs);
			//alert($('#select2').val());
			return;
		}
		
		if($("#select3").val()==""){
			//alert("select3널임!!");
			$("#select3").val(vs);
			//alert($('#select3').val());
			return;
		}
		
		
		
		alert("3가지이상 선택할수 없습니다");
		return;
		
		
		
					
	}
</script>

</head>
<body>
<div id="wrap">
		<%@include file="/common/ssmMain/header_.jsp"%>

		<div class="subWrap">
			<nav include-html="/common/ssmMain/ssmCategory/cdSsideNav.html"></nav>
			<section>
			<div id="tit">
				<h1>가치관 설정</h1>
				<p>
					<a href="#">홈</a> > <a href="co01.asp">진로설계</a> > <a
						href="co03.asp" class="on">가치관설정</a>
				</p>
			</div>
			<div class="container">
				<div id="content">
					<div class="contentbox" align="center">
						<form id="select_Info" name="select_Info">
							<table class="view_box mt_5"  cellspacing="0" cellpadding="0" style="color:black; margin:auto;" >
								<colgroup>
									<col width="33%">
									<col width="33%">
									<col width="33%">
								</colgroup>
								<tr>
									<th align='center'>1순위</th>
									<th align='center'>2순위</th>
									<th align='center'>3순위</th>
								</tr>
								<tr>
									<td>
										<input type="text" id="select1" name="vsFirst" readonly >
									</td>
									<td>
										<input type="text" id="select2" name="vsSecond" readonly >
									</td>		
									<td>
										<input type="text" id="select3" name="vsThird" readonly >
									</td>
								</tr>
							</table>
							<input type="hidden" id="ISUD" name="ISUD">
						</form>
						<div class="compbox">
							<table style="margin:auto;">
								<tr>
									<td>
										<div class="comp HE" id="HE" name="HE" value="봉사" 
											 style="padding-top: 5px;width: 110px;" >
											<img src="/images/HE.png">
										</div>
									</td>
									<td>
										<div class="comp CH" id="CH" name="CH" value="변화"
											 style="padding-top: 5px;width: 110px;" >
											<img src="/images/CH.png">
										</div>
									</td>
									<td>
										<div class="comp SU" id="SU" name="SU" value="성공"
											 style="padding-top: 5px;width: 110px;" >
											<img src="/images/SU.png">
										</div>
									</td>
									<td>
										<div class="comp LE" id="LE" name="LE" value="여가"
											 style="padding-top: 5px;width: 110px;" >
											<img src="/images/LE.png">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="comp MN" id="MN" name="MN" value="돈"
						   					 style="padding-top: 5px;width: 110px;" >
											<img src="/images/MN.png">
										</div>
									</td>
									<td>
										<div class="comp CO" id="CO" name="CO" value="공익"
						   					 style="padding-top: 5px;width: 110px;" >
											<img src="/images/CO.png">
										</div>
									</td>
									<td>
										<div class="comp CR" id="CR" name="CR" value="창조"
						   					 style="padding-top: 5px;width: 110px;" >
											<img src="/images/CR.png">
										</div>
									</td>
									<td>
										<div class="comp KN" id="KN" name="KN" value="지식"
							   				 style="padding-top: 5px;width: 110px;" >
											<img src="/images/KN.png">
										</div>
									</td>
								</tr>
							</table>
						</div>
						<!-- // .compbox -->
						<div class=" board_btn float_right">
							<a href="" id="saveValueSetting" name="saveValueSetting"><span>저장하기</span></a>
						</div>
						<!-- // .board_btn -->
					</div>
					<!-- //.contentbox -->
				</div>
				<!-- // .content -->
			</div>
			<!-- // .container -->
		</section>
	</div>
	<!-- // .subWrap -->
	<footer include-html="/common/ssmMain/footer.html"></footer>
	<script type="text/javascript">
		includeHTML();
	</script>
</div>
</body>
</html>