<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ssm.cd.vo.*" %> 
<%
	request.setCharacterEncoding("UTF-8");
	Object obj = null;
	Job_DataVO jdvo = null;
	List list = null;
	String salary          = "";
	String jobDicSeq       = "";
	String equalEmployment = "";
	String prospect        = "";
	String job             = "";
	String possibility     = "";
	obj = request.getAttribute("list");
	if(obj != null){
		list = (List)obj;
		if(list.size() > 0){
			jdvo = (Job_DataVO)list.get(0);
			salary          = jdvo.getSalary();
			jobDicSeq       = jdvo.getJobDicSeq();
			equalEmployment = jdvo.getEqualEmployment();
			prospect        = jdvo.getProspect();
			job             = jdvo.getJob();
			possibility     = jdvo.getPossibility();
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
		<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
    <link rel="stylesheet" href="/common/ssmCss/default.css">
     <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
     <link rel="stylesheet" href="/common/ssmCss/npMainBoard.css">
	<script src="/common/ssmJs/goCategory.js?ver=2"></script>
	<script src="/common/ssmJs/index.js"></script>
		<script type="text/javascript">
			$(function(){
				hs();
				$.ajax({
					type:"GET",
					url: "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=961f47ce54cb960e4f6929a39c6b83dc&svcType=api&svcCode=JOB_VIEW&contentType=json&gubun=job_dic_list&perPage=50&jobdicSeq="+<%=jobDicSeq%>+"",
					success : function(data){
						console.log(data);
						var ddc = data.dataSearch.content[0];
						var cjd = ddc.division[0].cnet_job_dvs;
						var s1 = "<td colspan=\"4\" ><lavel>커리어넷 직업분류 > "+cjd+"</lavel></td>";
						$("#lavel").append(s1);
						
						if(ddc.ability != null){
							var newtr = $("<tr class='tab1'>");
							var newtd = $("<td colspan='5'>");
							newtr.append(newtd.append("<h3>핵심능력</h3>"+"- "+ddc.ability));
							$("#tb2").append(newtr);	
						}
						if(ddc.similarJob != null){
							var newtr = $("<tr class='tab1'>");
							var newtd = $("<td colspan='5'>");
							newtr.append(newtd.append("<h3>유사직업명</h3>"+"- "+ddc.similarJob));
							$("#tb2").append(newtr);
						}
						if(ddc.capacity_major[0].capacity != null){
							var newtr = $("<tr class='tab1'>");
							var newtd = $("<td colspan='5'>");
							newtd.append("<h3>관련학과/관련자격</h3>");
							if(ddc.capacity_major[0].capacity != null){
								var major = ddc.capacity_major[1].major;
								newtd.append("- 관련학과 : ");
								for(var i=0;i<major.length;i++){
									var aTag = "";
									var MN   = "";
									var mSeq = "";
									MN   = major[i].MAJOR_NM;
									mSeq = major[i].MAJOR_SEQ;
									aTag = "<a href=\"javascript:mClass('"+mSeq+"')\">"+MN+"</a>"
									if((i+1)==major.length){
										newtd.append(aTag+"<br>");
									}else if(i==9 || i==20){
										newtd.append(aTag+"<br>&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;");
									}else{
										newtd.append(aTag+",");
									}
								}
							}
								var capacity = ddc.capacity_major[0].capacity;
								newtd.append(" - 관련자격 : "+capacity);
							
							$("#tb2").append(newtr.append(newtd));
						}
						if(ddc.summary != null){
							var newtr = $("<tr class='tab1'>");
							var newtd = $("<td colspan='5'>");
							newtd.append("<h3>하는일</h3>");
							var sum = ddc.summary;
							var sumArray = [];
							sumArray = sum.split("-");
							for(var i=1;i<sumArray.length;i++){
								var ss = "- "+sumArray[i]+"<br>";
								newtd.append(ss);
							}
							$("#tb2").append(newtr.append(newtd));
						}
						if(ddc.aptitude != null){
							var newtr = $("<tr class='tab1'>");
							var newtd = $("<td colspan='5'>");
							newtd.append("<h3>적성 및 흥미</h3>");
							var apt = ddc.aptitude;
							var aptArray = [];
							aptArray = apt.split("-");
							for(var i=1;i<aptArray.length;i++){
								var ss = "- "+aptArray[i]+"<br>";
								newtd.append(ss);
							}
							$("#tb2").append(newtr.append(newtd));
						}
						if(ddc.division[0].cnet_job_dvs != null){
							var newtr = $("<tr class='tab1'>");
							var newtd = $("<td colspan='5'>");
							newtd.append("<h3>분류</h3>");
							if(ddc.division[0].cnet_job_dvs != null){
								var n1 = ddc.division[0].cnet_job_dvs;
								newtd.append("커리어넷직업분류 > "+n1.replace(/[0-9]/g, "")+"<br>");
							}
							if(ddc.division[0].std_code_nm != null){
								var n2 = ddc.division[0].std_code_nm;
								newtd.append("표준직업분류 > "+n2.replace(/[0-9]/g, "")+"<br>");
							}
							if(ddc.division[0].emplym_code_nm != null){
								var n3 = ddc.division[0].emplym_code_nm;
								newtd.append("고용직업분류 > "+n3.replace(/[0-9]/g, "")+"<br>");
							}
							$("#tb2").append(newtr.append(newtd));
						}
						if(ddc.stateofemp != null){
							var newtr = $("<tr class='tab2'>");
							var newtd = $("<td colspan='5'>");
							if(ddc.stateofemp[0].empway != null){
								newtd.append("<h3>취업현황</h3>");	
								newtd.append("<h5>입직 및 취업방법</h5>");
								var empway = ddc.stateofemp[0].empway;
								var empArray = [];
								empArray = empway.split("-");
								for(var i=1;i<empArray.length;i++){
									newtd.append("- "+empArray[i]+"<br>");
									if(i == empArray.length){
										newtd.append("- "+empArray);
									}
								}
							}
							if(ddc.stateofemp[1].employment != null){
								newtd.append("<h5>고용현황</h5>");
								newtd.append("- "+ddc.stateofemp[1].employment);
							}
							if(ddc.stateofemp[2].salery != null){
								newtd.append("<h5>임금수준</h5>");
								newtd.append("- "+ddc.stateofemp[2].salery);	
							}	
							$("#tb2").append(newtr.append(newtd));
						}
						if(ddc.prepareway[0] != null){
							var newtr = $("<tr class='tab2'>");
							var newtd = $("<td colspan='5'>");
							if(ddc.prepareway[0].preparation != null){
								newtd.append("<h3>준비방법</h3>");
								newtd.append("<h5>정규 교육과정</h5>");
								var pre = ddc.prepareway[0].preparation;
								var preArray = [];
								preArray = pre.split("-");
								for(var i=1;i<preArray.length;i++){
									if(i == preArray.length){
										newtd.append("- "+preArray[i]);
									}else{
										newtd.append("- "+preArray[i]+"<br>");
									}
								}
							}
							if(ddc.prepareway[1].training != null){
								newtd.append("<h5>직업 훈련</h5>");
								var tra = ddc.prepareway[1].training;
								var traArray = [];
								traArray = tra.split("-");
								for(var i=1;i<traArray.length;i++){
									if(i == traArray.length){
										newtd.append("- "+traArray[i]);
									}else{
										newtd.append("- "+traArray[i]+"<br>");
									}
								}								
							}
							if(ddc.prepareway[2].certification != null){
								newtd.append("<h5>관련 자격증</h5>");
								var cer = ddc.prepareway[2].certification;
								var cerArray = [];
								cerArray = cer.split("-");
								for(var i=1;i<cerArray.length;i++){
									if(i == cerArray.length){
										newtd.append("- "+cerArray[i]);
									}else{
										newtd.append("- "+cerArray[i]+"<br>");
									}
								}
							}
							$("#tb2").append(newtr.append(newtd));
						}
						if(ddc.contact[0] != null){
							var newtr = $("<tr class='tab2'>");
							var newtd = $("<td colspan='5'>");
							newtd.append("<h3>문의기관</h3>");
							for(var i=0;i<ddc.contact.length;i++){
								var nm = "";
								var url = "";
								nm = ddc.contact[i].MAPNG_NM;
								JSON.stringify(url = ddc.contact[i].MAPNG_URL);
								newtd.append(nm+" : <a href=\"javascript:contact('"+url+"')\">"+url+"</a><br>");
							}
							$("#tb2").append(newtr.append(newtd));
						}
						
						if(ddc.job_possibility[0] != null){
							var list = ddc.job_possibility[0].chart_item_list;
							var cValue = "";
							for(var i=0;i<list.length;i++){
								
								if((i+1)==list.length){
									cValue += list[i].CHART_VALUE;
								}else{
									cValue += list[i].CHART_VALUE+",";
								}
							}
							
							var pos = ddc.job_possibility[0].possibility;
							var posArray = [];
							posArray = pos.split("-");
							for(var i=1;i<posArray.length;i++){
								if(i == posArray.length){
									$("#possibility").append("- "+posArray[i]);
								}else{
									$("#possibility").append("- "+posArray[i]+"<br>");
								}
							}
							fn_chart(cValue);
						}
						
						if(ddc.GenCD != null){
							var newtr2 = $("<tr class='tab4'>");
							var newtd2 = $("<td colspan='5'>");
							newtd2.append("<h3>"+ddc.job+"을/를 관심직업으로 추가하거나 검색해 본 회원들을 토대로 선호 회원의 특성을 분석하여 제시합니다.</h3>");
							$("#tb2").append(newtr2.append(newtd2));
							
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='5'>");
							newtd.append("<h4>"+ddc.job+"을/를 선호하는 회원들의 성별 비율은?</h4>");
							
							newtd.append("<h5>1. "+ddc.job+"을/를 많이 본 회원들의 성별 비율</h5>");
							var gen = ddc.GenCD[0].popular[0].GEN_NM;
							var pcnt = ddc.GenCD[0].popular[0].PCNT;
							newtd.append("&emsp;"+gen+" : "+pcnt+"% ");
							var gen2 = ddc.GenCD[0].popular[1].GEN_NM;
							var pcnt2 = ddc.GenCD[0].popular[1].PCNT;
							newtd.append(gen2+" : "+pcnt2+"% ");
							
							newtd.append("<h5>2. "+ddc.job+"을/를 관심직업에 등록한 회원들의 성별 비율</h5>");
							var gen3 = ddc.GenCD[1].bookmark[0].GEN_NM;
							var pcnt3 = ddc.GenCD[1].bookmark[0].PCNT;
							newtd.append("&emsp;"+gen3+" : "+pcnt3+"% ");
							var gen4 = ddc.GenCD[1].bookmark[1].GEN_NM;
							var pcnt4 = ddc.GenCD[1].bookmark[1].PCNT;
							newtd.append(gen4+" : "+pcnt4+"% ");
							$("#tb2").append(newtr.append(newtd));
						}
 						
						if(ddc.SchClass != null){
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='5'>");
							newtd.append("<h4>"+ddc.job+"을/를 선호하는 회원들의 학교급별 비율은?</h4>");
							
							newtd.append("<h5>1. "+ddc.job+"을/를 많이 본 회원들의 학교급별 비율</h5>");
							var scn = ddc.SchClass[0].popular[0].SCH_CLASS_NM;
							var pcnt = ddc.SchClass[0].popular[0].PCNT;
							newtd.append("&emsp;"+scn+" : "+pcnt+"% ");
							var scn2 = ddc.SchClass[0].popular[1].SCH_CLASS_NM;
							var pcnt2 = ddc.SchClass[0].popular[1].PCNT;
							newtd.append(scn2+" : "+pcnt2+"% ");
							
							newtd.append("<h5>2. "+ddc.job+"을/를 관심 직업으로 등록한 회원들의 학교급별 비율</h5>");
							var scn3 = ddc.SchClass[1].bookmark[0].SCH_CLASS_NM;
							var pcnt3 = ddc.SchClass[1].bookmark[0].PCNT;
							newtd.append("&emsp;"+scn3+" : "+pcnt3+"% ");
							var scn4 = ddc.SchClass[1].bookmark[1].SCH_CLASS_NM;
							var pcnt4 = ddc.SchClass[1].bookmark[1].PCNT;
							newtd.append(scn4+" : "+pcnt4+"% ");
							$("#tb2").append(newtr.append(newtd));
						}
						
						if(ddc.lstMiddleAptd != null){
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='5'>");
							newtd.append("<h4>"+ddc.job+"을/를 선호하는 중학생 회원들의 적성유형은?</h4>");
							
// 							을/를 많이 본 회원들의 적성유형
							newtd.append("<h5>1. "+ddc.job+"을/를 많이 본 회원들의 적성유형</h5>");
							var a0 = ddc.lstMiddleAptd[0].popular[0].CD_NM;
							var a1 = ddc.lstMiddleAptd[0].popular[1].CD_NM;
							var a2 = ddc.lstMiddleAptd[0].popular[2].CD_NM;
							newtd.append("&emsp;"+a0+"&ensp;"+a1+"&ensp;"+a2+"&ensp;");
							
// 							을/를 관심 직업으로 등록한 회원들의 적성유형
							newtd.append("<h5>2. "+ddc.job+"을/를 관심 직업으로 등록한 회원들의 적성유형</h5>");
							var b0 = ddc.lstMiddleAptd[1].bookmark[0].CD_NM;
							var b1 = ddc.lstMiddleAptd[1].bookmark[1].CD_NM;
							var b2 = ddc.lstMiddleAptd[1].bookmark[2].CD_NM;
							newtd.append("&emsp;"+b0+"&ensp;"+b1+"&ensp;"+b2+"&ensp;");
							$("#tb2").append(newtr.append(newtd));
						}
						
						if(ddc.lstHighAptd != null){
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='5'>");
							newtd.append("<h4>"+ddc.job+"을/를 선호하는 고등학생 회원들의 적성유형은?</h4>");
							
// 							을/를 많이 본 회원들의 적성유형
							newtd.append("<h5>1. "+ddc.job+"을/를 많이 본 회원들의 적성유형</h5>");
							var a0 = ddc.lstHighAptd[0].popular[0].CD_NM;
							var a1 = ddc.lstHighAptd[0].popular[1].CD_NM;
							var a2 = ddc.lstHighAptd[0].popular[2].CD_NM;
							newtd.append("&emsp;"+a0+"&ensp;"+a1+"&ensp;"+a2+"&ensp;");
							
// 							을/를 관심 직업으로 등록한 회원들의 적성유형
							newtd.append("<h5>2. "+ddc.job+"을/를 관심 직업으로 등록한 회원들의 적성유형</h5>");
							var b0 = ddc.lstHighAptd[1].bookmark[0].CD_NM;
							var b1 = ddc.lstHighAptd[1].bookmark[1].CD_NM;
							var b2 = ddc.lstHighAptd[1].bookmark[2].CD_NM;
							newtd.append("&emsp;"+b0+"&ensp;"+b1+"&ensp;"+b2+"&ensp;");
							$("#tb2").append(newtr.append(newtd));
						}
						if(ddc.lstVals != null){
// 							을/를 선호하는 회원들이 중요하게 생각하는 직업가치는?
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='5'>");
							newtd.append("<h4>"+ddc.job+"을/를 선호하는 회원들이 중요하게 생각하는 직업가치는?</h4>");
							
// 							을/를 많이 본 회원들의 직업가치
							newtd.append("<h5>1. "+ddc.job+"을/를 많이 본 회원들의 직업가치</h5>");
							var a0 = ddc.lstVals[0].popular[0].CD_NM;
							var a1 = ddc.lstVals[0].popular[1].CD_NM;
							var a2 = ddc.lstVals[0].popular[2].CD_NM;
							newtd.append("&emsp;"+a0+"&ensp;"+a1+"&ensp;"+a2+"&ensp;");
// 							을/를 관심 직업으로 등록한 회원들의 직업가치
							newtd.append("<h5>2. "+ddc.job+"을/를 관심 직업으로 등록한 회원들의 직업가치</h5>");
							var b0 = ddc.lstVals[1].bookmark[0].CD_NM;
							var b1 = ddc.lstVals[1].bookmark[1].CD_NM;
							var b2 = ddc.lstVals[1].bookmark[2].CD_NM;
							newtd.append("&emsp;"+b0+"&ensp;"+b1+"&ensp;"+b2+"&ensp;");
							$("#tb2").append(newtr.append(newtd));
						}
						hs();
					},
					error : function(){
						console.log("error");
					}
				});
				$(document).on("click","#goList",function(){
					location.href="/test/jobList.ssm";
				});
			});
			function hideAndShow(data){
				$(".tab1").hide();
				$(".tab2").hide();
				$(".tab3").hide();
				$(".tab4").hide();
				$("."+data).show();
				
				if(data == "tab3" || data == "tab4"){
					$("#tb2").attr("style","border-width:0px;");
					$("#lll1 #lll2 #lll3 #lll4").attr("style","border-width:1px;");
// 					$("#tb3").attr("style","border-width:0px; padding-top: 50px;");
				}else{
// 					$("#lll1 #lll2 #lll3 #lll4").attr("style","border-width:1px;");
					$("#tb2").attr("style","border:display;");
// 					$("#tb2").attr("style","border-width:1px; padding-bottom: 0px;");
// 					$("#tb3").attr("style","border-width:1px; padding-top: 0px;");
				}
			}
			function hs(){
				$(".tab1").show();
				$(".tab2").hide();
				$(".tab3").hide();
				$(".tab4").hide();
				$(".tab5").hide();
			}
			function mClass(data){
				var url = "/test/majorDetail.ssm?majorSeq="+data+"";
				window.open(url,"fullscreen=yes");
			}
			function contact(data){
				var url = data;
				window.open(url,"fullscreen=yes");
			}
			function fn_chart(data){
				
				var infoStr = "";
				var ticksS1 = [[]];

				ticksS1[0] = "보상,일자리전망,고용안정,발전가능성,근무여건,직업전문성,고용평등".split(',');
				ticksS1[1] = data.split(',');
				
				
				var densityData = {
					data: ticksS1[1],
					backgroundColor: ['#5cc5bd', 
					                  '#ff6384', 
					                  '#9a65fd', 
					                  '#ce80e8', 
					                  '#3498db', 
					                  '#f8ce56', 
					                  '#ff8100'],
					hoverBorderWidth: 0
				};

// 				console.log(ticksS1[0] + ' ' + ticksS1[1]);
				var chartOptions = {
					scales: {
						yAxes: [{barPercentage: 0.6}]
					},
					elements: {
						rectangle: { borderSkipped: 'left' }
					}
				};

				var ctx = document.getElementById('jobviewChart').getContext('2d');
				
				
				window.myHorizontalBar = new Chart(ctx, {
					type: 'horizontalBar',
					data: {
						labels: ticksS1[0],
						datasets: [densityData]
					},
					options: {
						lineAtIndex: 50,
						legend: {
							display: true,
							position: 'bottom',
							labels: {
									generateLabels: function(chart) {
										var data = chart.data;
										if (data.labels.length && data.datasets.length) {
											return data.labels.map(function(label, i) {
												var meta = chart.getDatasetMeta(0);
												var ds = data.datasets[0];
												var arc = meta.data[i];
												var custom = arc && arc.custom || {};
												var getValueAtIndexOrDefault = Chart.helpers.getValueAtIndexOrDefault;
												var arcOpts = chart.options.elements.arc;
												var fill = custom.backgroundColor ? custom.backgroundColor : getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts.backgroundColor);
												var stroke = custom.borderColor ? custom.borderColor : getValueAtIndexOrDefault(ds.borderColor, i, arcOpts.borderColor);
												var bw = custom.borderWidth ? custom.borderWidth : getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts.borderWidth);

												// We get the value of the current label
												var value = chart.config.data.datasets[arc._datasetIndex].data[arc._index];

												return {
													// Instead of `text: label,`
													// We add the value to the string
													text: label + " : " + value ,
													fillStyle: fill,
													strokeStyle: stroke,
													lineWidth: bw,
													hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
													index: i
												};

											});
										} else {
											return [];
										}
									},
									boxWidth : 20,
									usePointStyle : true,
									padding:10
								}
								
						},
						scales: {
							xAxes: [{ticks: {min:0,max:100}}],
							yAxes: [{barPercentage: 0.6,}]
						},
						elements: {
							rectangle: { borderSkipped: 'left' }
						}
					}
				});
					
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
	<header include-html="/common/ssmMain/header_.jsp"></header>
	<nav include-html="/common/ssmMain/ssmCategory/brSideStudents.html"></nav>
		<form name="form" id="form" method="post">
			<table id="tb" align="center" border="1">
				<tr>
					<td align="left" colspan="4"><h2>직업정보</h2></td>
				</tr>
				<tr>
					<td colspan="4"><h3 id="h3">직업명 : <%=job%></h3></td>
				</tr>
				<tr id="lavel">	
				</tr>
				<tr>
					<td><label id="ll1">평균연봉 > <%=salary%></label></td>
					<td><label id="ll2">일자리전망 > <%=prospect%></label></td>
					<td><label id="ll3">발전가능성 > <%=possibility%></label></td>
					<td><label id="ll4">고용평등 > <%=equalEmployment%></label></td>
				</tr>
			</table>
			<table id="tb2" align="center" border="1">
				<tr>
					<td align="center" id="lll1"><a href="javascript:hideAndShow('tab1')"><label>직업개요</label></a></td>
					<td align="center" id="lll2"><a href="javascript:hideAndShow('tab2')"><label>취업현황/문의기관</label></a></td>
					<td align="center" id="lll3"><a href="javascript:hideAndShow('tab3')"><label>직업전망</label></a></td>
					<td align="center" id="lll4"><a href="javascript:hideAndShow('tab4')"><label>이 직업을 보는 회원특성</label></a></td>
				</tr>
				<tr class="tab3">
					<td style="border: none;"><h3>직업전망</h3></td>
				</tr>
<!-- 				<tr class="tab3" style="height: 372px; width: 868px; padding-left: 350px" id="ss"> -->
<!-- 					<td><canvas id="jobviewChart" width="1085" height="465" title="직업전망 그래프" class="chartjs-render-monitor" style="display: block; height: 372px; width: 868px;"></canvas></td> -->
<!-- 				</tr> -->
			</table>
			<div class="tab3" style="height: 372px; width: 868px; padding-left: 350px" >
    			<canvas id="jobviewChart" width="1085" height="465" title="직업전망 그래프" class="chartjs-render-monitor" style="display: block; height: 372px; width: 868px;"></canvas>
			</div>
			<div class="tab4" style="width:850px; height: 200px">
				<div style="display: block; width:450px; height:120px" >
					<canvas id="ss1"></canvas>
				</div>
				<div  style="display: block">
					<canvas id="ss2"></canvas>
				</div>
			</div>
			<br>
			<table align="center" id="tb3">
				<tr class="tab3">
					<td id="possibility" style="border-width:1px;">
					</td>
				</tr>
				<tr>
					<td colspan='5' align="center">
						<input type="button" name="goList" id="goList" value="목록보기"/>
					</td>
				</tr>
			</table>
		</form>
	<script type="text/javascript">
	includeHTML();
	</script>
	</body>
</html>