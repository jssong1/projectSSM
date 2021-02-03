<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ssm.cd.vo.*" %>    
<%
	request.setCharacterEncoding("UTF-8");
	Object obj = null;
	List list = null;
	Major_DataVO mdvo = null;
	String lClass     = "";
	String facilName  = "";
	String majorSeq   = "";
	String mClass     = "";
	String totalCount = "";
	obj = request.getAttribute("list");
	if(obj != null){
		list = (List)obj;
		if(list != null && list.size() > 0){
			mdvo = (Major_DataVO)list.get(0);
			lClass     = mdvo.getlClass();
			facilName  = mdvo.getFacilName();
			majorSeq   = mdvo.getMajorSeq();
			mClass     = mdvo.getmClass();
			totalCount = mdvo.getTotalCount();
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
    <link rel="stylesheet" href="/common/ssmCss/default.css">
     <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
     <link rel="stylesheet" href="/common/ssmCss/npMainBoard.css">
     <link rel="stylesheet" href="/common/ssmCss/s_base.css">
	<link rel="stylesheet" href="/common/ssmCss/s_content.css">
	<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
	<script src="/common/ssmJs/goCategory.js?ver=2"></script>
	<script src="/common/ssmJs/index.js"></script>
		<script type="text/javascript">
			$(function(){
				
				$.ajax({
					type:"GET",
					url: "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=961f47ce54cb960e4f6929a39c6b83dc&svcType=api&svcCode=MAJOR_VIEW&contentType=json&gubun=univ_list&majorSeq="+<%=majorSeq%>+"",
					success : function(data){
						console.log(data);
						var ddc = data.dataSearch.content[0];
						var tr1 = $("<tr>");
						var td1 = $("<td colspan='4'>");
						tr1.append(td1.append(ddc.major));
						$("#table").append(tr1);
						
						var massage = "학과계열 > "+"<%=lClass%>";
						var tr2 = $("<tr>");
						var td2 = $("<td align='left' colspan='4'>");
						tr2.append(td2.append(massage));
						$("#table").append(tr2);
						
						var tr3 = $("<tr>");
						var td3 = $("<td align='left' colspan='2'>");
						var td4 = $("<td align='left' colspan='2'>");
						tr3.append(td3.append("취업율 > "+ddc.employment));
						tr3.append(td4.append("졸업 후 첫 직장 임금 > "+ddc.salary));
						$("#table").append(tr3);
						
						var tr4 = $("<tr>");
						var td5 = $("<td align='center'>");
						var a1 = "<a href=javascript:sh('tab1')>학과개요<a/>"
						var td6 = $("<td align='center'>");
						var a2 = "<a href=javascript:sh('tab2')>개설대학<a/>"
						var td7 = $("<td align='center'>");
						var a3 = "<a href=javascript:sh('tab3')>학과전망<a/>"
						var td8 = $("<td align='center'>");
						var a4 = "<a href=javascript:sh('tab4')>이 학과를 보는 커리어넷 회원특성<a/>"
						tr4.append(td5.append(a1));
						tr4.append(td6.append(a2));
						tr4.append(td7.append(a3));
						tr4.append(td8.append(a4));
						$("#table").append(tr4);
						
						if(ddc.department != null){
							var tr5 = $("<tr class='tab1'>");
							var td9 = $("<td colspan='4'>");
							var h1 = "<h4>- 세부관련학과 -</h4>";
							var tr6 = $("<tr class='tab1'>");
							tr5.append(td9.append(h1).append(ddc.department));
							
							$("#table").append(tr5);
						}
						if(ddc.summary != null){
							var tr6 = $("<tr class='tab1'>");
							var td10 = $("<td colspan='4'>");
							var h2 = "<h4>- 학과개요 -</h4>";
							tr6.append(td10.append(h2).append(ddc.summary));
							
							$("#table").append(tr6);
						}
						if(ddc.job != null){
							var tr7 = $("<tr class='tab1'>");
							var td11 = $("<td colspan='4'>");
							var h3 = "<h4>- 관련직업 -</h4>";
							tr7.append(td11.append(h3).append(ddc.job));
							
							$("#table").append(tr7);
						}
						if(ddc.qualifications != null){
							var tr8 = $("<tr class='tab1'>");
							var td12 = $("<td colspan='4'>");
							var h4 = "<h4>- 관련자격 -</h4>";
							tr8.append(td12.append(h4).append(ddc.qualifications));
							
							$("#table").append(tr8);
						}
						if(ddc.interest != null){
							var tr9 = $("<tr class='tab1'>");
							var td13 = $("<td colspan='4'>");
							var h5 = "<h4>- 흥미와 적성 -</h4>";
							tr9.append(td13.append(h5).append(ddc.interest));
							
							$("#table").append(tr9);
						}
						if(ddc.property != null){
							var tr10 = $("<tr class='tab1'>");
							var td14 = $("<td colspan='4'>");
							var h6 = "<h4>- 학과특성 -</h4>";
							tr10.append(td14.append(h6).append(ddc.property));
							
							$("#table").append(tr10);
						}
						if(ddc.enter_field[0] != null){
							var tr11 = $("<tr class='tab1'>");
							var td15 = $("<td colspan='4'>");
							var h7 = "<h4>- 졸업 후 진출분야 -</h4>";
							td15.append(h7);
							
							for(var i=0;i<ddc.enter_field.length;i++){
								var ss = "";
								var efg = "";
								var efd = "";
								ss = ddc.enter_field[i];
								if(ss.gradeuate != null){
									efg = ss.gradeuate;
									efg = "<h5> - "+efg+"</h5>";
									efd = ss.description;
									td15.append(efg).append(efd);
								}
							}
							tr11.append(td15);
							$("#table").append(tr11);
						}
						if(ddc.main_subject[0] != null){
							var tr12 = $("<tr class='tab1'>");
							var td16 = $("<td colspan='4'>");
							var h8 = "<h4>- 공부하는 주요 교과목 -</h4>";
							td16.append(h8);
							
							for(var i=0;i<ddc.main_subject.length;i++){
								var ss = "";
								var msn = "";
								var mss = "";
								ss = ddc.main_subject[i];
								if(ss.SBJECT_NM != null){
									msn = ss.SBJECT_NM;
									msn = "<h5> - "+msn+"</h5>";
									mss = ss.SBJECT_SUMRY;
									td16.append(msn).append(mss);
								}
							}
							tr12.append(td16);
							$("#table").append(tr12);
						}
						var tr13 = $("<tr class='tab2'>");
						var td17 = $("<td colspan='4' align='left'>");
						td17.append("개설대학");
						tr13.append(td17);
						$("#table").append(tr13);
						var tr14 = $("<tr class='tab2'>");
						var td18 = $("<td align='center'>");
						td18.append("지역");
						var td19 = $("<td align='center'>");
						td19.append("대학명");
						var td20 = $("<td align='center'>");
						td20.append("학과명");
						var td21 = $("<td align='center'>");
						td21.append("캠퍼스");
						
						tr14.append(td18).append(td19).append(td20).append(td21);
						$("#table").append(tr14);
						
						if(ddc.university[0] != null){
							for(var i=0;i<ddc.university.length;i++){
								var unArea = "";
								var unName = "";
								var unURL = "";
								var unMajor = "";
								var unCampus = "";
								var ss = "";
								var new_a = "";
								var new_tr = "";
								var new_td1 = "";
								var new_td2 = "";
								var new_td3 = "";
								var new_td4 = "";
								var urlArray = "";
								var a = "";
								ss = ddc.university[i];
								unArea = ss.area;
								unName = ss.schoolName+" : ";
								unURL = ss.schoolURL;
// 								urlArray = ss.schoolURL.split("/");
// 								if(urlArray[2] != null){
// 									unURL = urlArray[2];
// 									a = String(unURL);
// 								}else{
// 									unURL = ss.schoolURL;
// 									a = String(unURL);
// 								}
								unMajor = ss.majorName;
								unCampus = ss.campus_nm;
								new_a = "<a href=javascript:unPage("+JSON.stringify(unURL)+")>추가정보</a>";
								new_tr = $("<tr class='tab2'>");
								new_td1 = $("<td align='left'>");
								new_td1.append(unArea);
								new_td2 = $("<td align='left'>");
								new_td2.append(unName).append(new_a);
								new_td3 = $("<td align='left'>");
								new_td3.append(unMajor);
								new_td4 = $("<td align='left'>");
								new_td4.append(unCampus);
								new_tr.append(new_td1).append(new_td2).append(new_td3).append(new_td4);
								$("#table").append(new_tr);
							}
						}else{
							var tr15 = $("<tr class='tab2'>");
							var td22 = $("<td align='center' colspan='4'>");
							td22.append("데이터가 없습니다.");
							$("#table").append(tr15);
						}
						
// 						var last_tr = $("<tr>");
// 						var last_td = $("<td colspan='4' align='center'>");
// 						var goList = $("<input>");
// 						goList.attr({"type":"button","name":"goList","id":"goList","value":"목록보기"});
// 						last_td.append(goList);
// 						last_tr.append(last_td);
// 						$("#table").append(last_tr);
						if(ddc.GenCD != null){
							var newtr2 = $("<tr class='tab4'>");
							var newtd2 = $("<td colspan='4'>");
							newtd2.append("<h3>"+ddc.major+"을/를 관심학과로 추가하거나 검색해 본 회원들을 토대로 선호 회원의 특성을 분석하여 제시합니다.</h3>");
							$("#table").append(newtr2.append(newtd2));
							
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='4'>");
							newtd.append("<h4>"+ddc.major+"을/를 선호하는 회원들의 성별 비율은?</h4>");
							
							newtd.append("<h5>1. "+ddc.major+"을/를 많이 본 회원들의 성별 비율</h5>");
							var gen = ddc.GenCD[0].popular[0].GEN_NM;
							var pcnt = ddc.GenCD[0].popular[0].PCNT;
							newtd.append("&emsp;"+gen+" : "+pcnt+"% ");
							var gen2 = ddc.GenCD[0].popular[1].GEN_NM;
							var pcnt2 = ddc.GenCD[0].popular[1].PCNT;
							newtd.append(gen2+" : "+pcnt2+"% ");
							
							newtd.append("<h5>2. "+ddc.major+"을/를 관심학과에 등록한 회원들의 성별 비율</h5>");
							var gen3 = ddc.GenCD[1].bookmark[0].GEN_NM;
							var pcnt3 = ddc.GenCD[1].bookmark[0].PCNT;
							newtd.append("&emsp;"+gen3+" : "+pcnt3+"% ");
							var gen4 = ddc.GenCD[1].bookmark[1].GEN_NM;
							var pcnt4 = ddc.GenCD[1].bookmark[1].PCNT;
							newtd.append(gen4+" : "+pcnt4+"% ");
							$("#table").append(newtr.append(newtd));
						}
 						
						if(ddc.SchClass != null){
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='4'>");
							newtd.append("<h4>"+ddc.major+"을/를 선호하는 회원들의 학교급별 비율은?</h4>");
							
							newtd.append("<h5>1. "+ddc.major+"을/를 많이 본 회원들의 학교급별 비율</h5>");
							var scn = ddc.SchClass[0].popular[0].SCH_CLASS_NM;
							var pcnt = ddc.SchClass[0].popular[0].PCNT;
							newtd.append("&emsp;"+scn+" : "+pcnt+"% ");
							var scn2 = ddc.SchClass[0].popular[1].SCH_CLASS_NM;
							var pcnt2 = ddc.SchClass[0].popular[1].PCNT;
							newtd.append(scn2+" : "+pcnt2+"% ");
							
							newtd.append("<h5>2. "+ddc.major+"을/를 관심학과로 등록한 회원들의 학교급별 비율</h5>");
							var scn3 = ddc.SchClass[1].bookmark[0].SCH_CLASS_NM;
							var pcnt3 = ddc.SchClass[1].bookmark[0].PCNT;
							newtd.append("&emsp;"+scn3+" : "+pcnt3+"% ");
							var scn4 = ddc.SchClass[1].bookmark[1].SCH_CLASS_NM;
							var pcnt4 = ddc.SchClass[1].bookmark[1].PCNT;
							newtd.append(scn4+" : "+pcnt4+"% ");
							$("#table").append(newtr.append(newtd));
						}
						
						if(ddc.lstMiddleAptd != null){
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='4'>");
							newtd.append("<h4>"+ddc.major+"을/를 선호하는 중학생 회원들의 적성유형은?</h4>");
							
// 							을/를 많이 본 회원들의 적성유형
							newtd.append("<h5>1. "+ddc.major+"을/를 많이 본 회원들의 적성유형</h5>");
							var a0 = ddc.lstMiddleAptd[0].popular[0].CD_NM;
							var a1 = ddc.lstMiddleAptd[0].popular[1].CD_NM;
							var a2 = ddc.lstMiddleAptd[0].popular[2].CD_NM;
							newtd.append("&emsp;"+a0+"&ensp;"+a1+"&ensp;"+a2+"&ensp;");
							
// 							을/를 관심 직업으로 등록한 회원들의 적성유형
							newtd.append("<h5>2. "+ddc.major+"을/를 관심학과로 등록한 회원들의 적성유형</h5>");
							var b0 = ddc.lstMiddleAptd[1].bookmark[0].CD_NM;
							var b1 = ddc.lstMiddleAptd[1].bookmark[1].CD_NM;
							var b2 = ddc.lstMiddleAptd[1].bookmark[2].CD_NM;
							newtd.append("&emsp;"+b0+"&ensp;"+b1+"&ensp;"+b2+"&ensp;");
							$("#table").append(newtr.append(newtd));
						}
						
						if(ddc.lstHighAptd != null){
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='4'>");
							newtd.append("<h4>"+ddc.major+"을/를 선호하는 고등학생 회원들의 적성유형은?</h4>");
							
// 							을/를 많이 본 회원들의 적성유형
							newtd.append("<h5>1. "+ddc.major+"을/를 많이 본 회원들의 적성유형</h5>");
							var a0 = ddc.lstHighAptd[0].popular[0].CD_NM;
							var a1 = ddc.lstHighAptd[0].popular[1].CD_NM;
							var a2 = ddc.lstHighAptd[0].popular[2].CD_NM;
							newtd.append("&emsp;"+a0+"&ensp;"+a1+"&ensp;"+a2+"&ensp;");
							
// 							을/를 관심 직업으로 등록한 회원들의 적성유형
							newtd.append("<h5>2. "+ddc.major+"을/를 관심학과로 등록한 회원들의 적성유형</h5>");
							var b0 = ddc.lstHighAptd[1].bookmark[0].CD_NM;
							var b1 = ddc.lstHighAptd[1].bookmark[1].CD_NM;
							var b2 = ddc.lstHighAptd[1].bookmark[2].CD_NM;
							newtd.append("&emsp;"+b0+"&ensp;"+b1+"&ensp;"+b2+"&ensp;");
							$("#table").append(newtr.append(newtd));
						}
						if(ddc.lstVals != null){
// 							을/를 선호하는 회원들이 중요하게 생각하는 직업가치는?
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='4'>");
							newtd.append("<h4>"+ddc.major+"을/를 선호하는 회원들이 중요하게 생각하는 직업가치는?</h4>");
							
// 							을/를 많이 본 회원들의 직업가치
							newtd.append("<h5>1. "+ddc.major+"을/를 많이 본 회원들의 직업가치</h5>");
							var a0 = ddc.lstVals[0].popular[0].CD_NM;
							var a1 = ddc.lstVals[0].popular[1].CD_NM;
							var a2 = ddc.lstVals[0].popular[2].CD_NM;
							newtd.append("&emsp;"+a0+"&ensp;"+a1+"&ensp;"+a2+"&ensp;");
// 							을/를 관심 직업으로 등록한 회원들의 직업가치
							newtd.append("<h5>2. "+ddc.major+"을/를 관심 학과으로 등록한 회원들의 직업가치</h5>");
							var b0 = ddc.lstVals[1].bookmark[0].CD_NM;
							var b1 = ddc.lstVals[1].bookmark[1].CD_NM;
							var b2 = ddc.lstVals[1].bookmark[2].CD_NM;
							newtd.append("&emsp;"+b0+"&ensp;"+b1+"&ensp;"+b2+"&ensp;");
							$("#table").append(newtr.append(newtd));
						}
						hs();
					},
					error : function(){
						console.log("error");
					}
				});
				$("#goList").click(function(){
					location.href="/test/majorList.ssm";
				});
			});
			
			function sh(data){
				$(".tab1").hide();
				$(".tab2").hide();
				$(".tab3").hide();
				$(".tab4").hide();
				$("."+data).show();
			}
			function hs(){
				$(".tab1").show();
				$(".tab2").hide();
				$(".tab3").hide();
				$(".tab4").hide();
			}
			function unPage(data){
				var url = data;
				window.open(url,"fullscreen=yes");
// 				$("#form").attr("action",url).attr("target","new")
			}
		</script>
		<style type="text/css">
		table {
				width:1150px;
			}
			a {
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<div id="wrap">

		<%@include file="/common/ssmMain/header_.jsp"%>

		<div class="subWrap">
	<%if(sessionAU.equals("1")){ System.out.println("학생네비");%>
				<nav include-html="/common/ssmMain/ssmCategory/cdSideNav.html"></nav>
			<%}else{ System.out.println("교사네비");%>
				<nav include-html="/common/ssmMain/ssmCategory/cdSideNav2.html"></nav>
			<% } %>
			<div id="tit">
				<h1>학과정보 탐색</h1>
				<p>
					<a href="#">홈</a> > <a href="co01.asp">진로설계</a> > <a
						href="co03.asp" class="on">학과정보 탐색</a>
				</p>
			</div>

			<section>
			<div class="container">
			
				<div class="contentbox">


	
	
		<form name="form" id="form" method="get">
			<table id="table" border="1" align="center">
			</table>
			<div class="tab3">
				<canvas id="chart1" width="550" height="316" title="입학상황그래프" class="chartjs-render-monitor" style="display: block; height: 253px; width: 440px;"></canvas>
				<canvas id="chart2" width="550" height="316" title="입학상황(성별)그래프" class="chartjs-render-monitor" style="display: block; height: 253px; width: 440px;"></canvas>
			</div>
			<div class="tab3">
				<canvas id="chart3" width="550" height="316" title="취업률그래프" class="chartjs-render-monitor" style="display: block; height: 253px; width: 440px;"></canvas>
				<canvas id="chart7" width="550" height="316" title="졸업 후 상황그래프" class="chartjs-render-monitor" style="display: block; height: 253px; width: 440px;"></canvas>
			</div>
			<div class="tab3">
				<canvas id="chart4" width="1155" height="346" title="졸업 후 첫 직업 분야 그래프" class="chartjs-render-monitor" style="display: block; height: 277px; width: 924px;"></canvas>
			</div>
			<div class="tab3">
				<canvas id="chart5" width="550" height="343" title="졸업 후 첫 직장 월평균 임금그래프" class="chartjs-render-monitor" style="display: block; height: 275px; width: 440px;"></canvas>
				<canvas id="chart6" width="550" height="343" title="첫 직장 만족도그래프" class="chartjs-render-monitor" style="display: block; height: 275px; width: 440px;"></canvas>
			</div>
			
			
			<table align="center">
				<tr>
					<td align="center">
						<input type="button" id="goList" name="goList" value="목록보기">
					</td> 
				</tr>
			</table>
		</form>
	
				</div>
			</div>
			</section>
		</div>
		<footer include-html="/common/ssmMain/footer.html"></footer>
		<script type="text/javascript">
			includeHTML();
		</script>
	</div>

</html>