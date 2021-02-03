<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<%request.setCharacterEncoding("UTF-8"); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

		<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		 
	
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		
		<script src="/include/js/moment.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
		<script src="/include/fullcalendar/main.js"></script>
		<script src="/include/fullcalendar/dayGrid/main.min.js"></script>
		<link href="/include/fullcalendar/main.css" rel="stylesheet"/>
		<link href="https://unpkg.com/@fullcalendar/daygrid@4.4.0/main.min.css" rel="stylesheet"/>	
		
<!-- 풀캘린더  api -->
<%--<link href='/include/fullcalendar-4.4.0/packages/core/main.css' rel='stylesheet' />
<link href='/include/fullcalendar-4.4.0/packages/daygrid/main.css' rel='stylesheet' />
<link href='/include/fullcalendar-4.4.0/packages/timegrid/main.css' rel='stylesheet' />
<link href='/include/fullcalendar-4.4.0/packages/list/main.css' rel='stylesheet' />
<script src='/include/fullcalendar-4.4.0/packages/core/main.js'></script>
<script src='/include/fullcalendar-4.4.0/packages/interaction/main.js'></script>
<script src='/include/fullcalendar-4.4.0/packages/daygrid/main.js'></script>
<script src='/include/fullcalendar-4.4.0/packages/timegrid/main.js'></script>
<script src='/include/fullcalendar-4.4.0/packages/list/main.js'></script>

<!-- 비팝업  -->
<script src="/include/fullcalendar-4.4.0/packages/jquery.bpopup.min.js"></script>

<!-- 제이쿼리 -->
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js?"></script>

 --%>
<script>
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
</script>
<script>


document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
       left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listMonth'
      },
      locale: 'ko',
      defaultDate: '2020-03-12',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      buttonText :{
          today : '오늘',
          next : '다음달',
          prev : '이전달'
       },
      allday:true,// allow "more" link when too many events
      events: {
         url: '/schedulnotice/snlistajax.ssm',
         contentType: 'charset=UTF-8',
         error:function(){
           alert("연결 실패");
         }
      },
      eventClick: function(){
         detailSchedule()
            
      },
      dateClick: function(info) {
           addSchedule(info.dateStr)
      }
    });

    calendar.render();
  });

  function addSchedule(dateStr){
     var htmlsContents="";
     htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%;float:left; padding-left:30px'>일정 제목</div><div style='width:60%;float:right'><input type='text'id='snTitle' name='snTitle'></div></div>";
     htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%;float:left; padding-left:30px'>시작 날짜</div><div style='width:60%;float:right'><input type='text'id='snStartdate' value="+dateStr+" style='width:80px'></div></div>";
     htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%;float:left; padding-left:30px'>마침 날짜</div><div style='width:60%;float:right'><input type='text'id='snEnddate'  style='width:80px'></div></div>";
     htmlsContents += "<div style='width:100%; height:30px; text-align:center; margin-bottom:15px; margin-top:10px'><button onclick=\"javascript:saveSchedule();\">일정 등록</button></div>";
     openPopup("일정등록",htmlsContents,400);
     datepicker();
  }
  
  function detailSchedule(){
     var htmlsContents="";
     htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%;float:left; padding-left:30px'>일정 제목</div><div style='width:60%;float:right'><input type='text'id='snTitle' value=''></div></div>";
     htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%;float:left; padding-left:30px'>시작 날짜</div><div style='width:60%;float:right'><input type='text'id='snStartdate'  style='width:80px'></div></div>";
     htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%;float:left; padding-left:30px'>마침 날짜</div><div style='width:60%;float:right'><input type='text'id='snEnddate'  style='width:80px'></div></div>";
     htmlsContents += "<div style='width:100%; height:30px; text-align:center; margin-bottom:15px; margin-top:10px'><button onclick=\"javascript:saveSchedule();\">일정 수정</button><button onclick=\"javascript:deleteSchedule();\">일정 삭제</button></div>";
     openPopup("일정 변경",htmlsContents,400);
     datepicker();
  }
  
  function datepicker(){
     $( "#snStartdate" ).datepicker({
          dateFormat: 'yy.mm.dd',
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
     $( "#snEnddate" ).datepicker({
        dateFormat: 'yy.mm.dd',
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
  }
  
  function openPopup(subject,contents,widths){
     $("#alert_subject").html(subject);
     $("#alert_contents").html(contents);
     openMessage('winAlert',widths)
  }
  
  function saveSchedule(){
     var snTitle = $("#snTitle").val();
     var snStartdate = $("#snStartdate").val();
     var snEnddate = $("#snEnddate").val();
     alert(snTitle);
     if(!snTitle){
        alert("일정 제목을 입력하세요!");
        return false;
     }
     if(!snStartdate){
        alert("시작 날짜를 입력하세요!");
        return false;
     }
     if(!snEnddate){
        alert("마침 날짜를 입력하세요!");
        return false;
     }
     
     $.ajax({
        type   :   'POST',
        url    :   "/schedulnotice/snwirteajax.ssm",
        data   :   {"snTitle" : snTitle, "snStartdate" : snStartdate, "snEnddate" : snEnddate},
        headers: {
              'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
          },
        cache :   false,
        async :    false
     })
    .done(function(result){
       if(result == "OK"){
         closeMessage("winAlert");
         calendar.refetchEvents (); // 난 이거 안됨
       }
    });
  }
  
  function deleteSchedule(){
     var snTitle = $("#snTitle").val();
     var snStartdate = $("#snStartdate").val();
     var snEnddate = $("#snEnddate").val();
     var snFile = $("#snFile").val();
   
     $.ajax({
        type   :   'POST',
        url    :   "/schedulnotice/snwirteajax.ssm",
        data   :   {snTitle : snTitle, snStartdate : snStartdate, snEnddate : snEnddate, snFile: snFile},
        cache :   false,
        async :    false
     })
    .done(function(result){
       alert("result>>>:"+ result);
       if(result == "OK"){
         closeMessage("winAlert");
         calendar.render(); //새로고침 안됨
       }
    });
  }
  
  function openMessage(IDS,widths){
     $('#'+IDS).css("width",widths+"px");
     $('#'+IDS).bPopup();
  }
  
  function closeMessage(IDS){
     $('#'+IDS).bPopup().close();
  }
  
  
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px; 
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  .fc-row {
     height : 108px;
  }
  .fc-widget-header {
     height : 22px;
     
  }
</style>
</head>
<body>
  <div style ="max-width:900px; margin:0 auto; height:30px">
     <div style="float:right">
        <button onclick="javascript:addSchedule();">일정 등록</button>
     </div>
  </div>
  <div id='calendar'></div>

  <div class="box box-success" style="width:500px; display:none; background-color:white" id="winAlert">
     <div class="box-header with-border" style="background-color:white; padding-left:15px">
        <h3 class="box-title" id="alert_subject" style="background-color:white"></h3>
     </div>
     <div class="box-body" id="alert_contents" style="font-size:15px;background-color:white">
     </div>
  </div>

</body>
</html>