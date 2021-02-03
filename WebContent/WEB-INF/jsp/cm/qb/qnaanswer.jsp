<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="ssm.cm.vo.QnABoardVO" %>
<%@ page import="ssm.common.utils.UserSession" %>  

<%  String sessionAU = UserSession.getSessionAU(request);%>      
<%  String sessionNO = UserSession.getSessionNO(request);%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>qnaanswer(답글페이지)</title>
            <script src="/include/js/jquery-1.11.3.min.js"></script>
      <link rel="stylesheet" href="/common/ssmCss/default.css">
      <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
      
      <link rel="stylesheet" href="/common/ssmCss/s_base.css">
      <link rel="stylesheet" href="/common/ssmCss/s_content.css">
      <link rel="stylesheet" href="/common/ssmCss/s_layout.css">
       <script src="/common/ssmJs/index.js"></script>
        <script type="text/javascript">
        <%
        QnABoardVO qvo =(QnABoardVO)request.getAttribute("qbdetail");
        String qbNo=qvo.getQbNo();
        
        
        %>
        
        
        $(function(){
           
           //학생권한이면 댓글쓰기버튼을 숨겨라
           var sessionAU="<%=sessionAU%>";
            if(sessionAU==1){
               $("#replywritediv").hide();
            }
           
              //기본 댓글 목록 불러오기
              var qbNo = "<%=qvo.getQbNo()%>";
              listAll(qbNo); // 댓글 리스트 요청함수
              
              $('#qnaanswerContainer').hide();
 
              if(true){//교사세션이 있으면 
                 $('#qnaanswerContainer').show();
              }
              
              // 댓글 내용 저장 이벤트
              $('#qaInsert').click(function(){
                 
               var insertUrl = "/qnaanswer/qaInsert.ssm";
               //글 저장을 위한 POST 방식의 Ajax 연동 처리
               $.ajax({
                  url : insertUrl, // 전송 URL
                  type : "post",
                  headers : {
                        "Content-Type":"application/json",
                        "X-HTTP-Method-Override":"POST"},
                  dataType : "text",
                  data : JSON.stringify({
                     qbNo : qbNo,
                     ttNo : $("#ttNo").val(),
                     qaContents : $("#qaContents").val()
                  }),
                  success : function(resultData){
                     if(resultData == "SUCCESS"){
                        alert("댓글이 등록되었습니다!");
                        dataReset(); // input 태그들에 대한 초기화 함수
                        listAll(qbNo); // 리스트 요청 함수
                     }
                  },
                  error : function(){
                     alert("시스템 오류! ");
                  }
                  
                  
               });
                 
                 
              });
              
              
              // 수정버튼 클릭시 수정폼 출력
              $(document).on("click","#updatebutton",function(){
                 $(".reset_btn").click();
                 
                 var conText = $(this).parents("li").children().eq(1).html();
                 console.log("conText >>> : "+conText);
                 $(this).parents("li").find("input[type='button']").hide();
                 $(this).parents("li").children().eq(0).html();
                 var conArea = $(this).parents("li").children().eq(1);
                 
                 conArea.html("");
                 var data = "<textarea name='content' id='content'>"+conText+"</textarea>";//텍스트박스생성
                 data += "<input type='button' class='update_btn' value='수정완료'>";//수정버튼생성
                 data += "<input type='button' class='reset_btn' value='수정취소'>";//수정취소버튼생성
                 conArea.html(data);
              });
              
              
              //초기화 버튼
              $(document).on("click",".reset_btn",function(){//수정취소누를때
                 var conText = $(this).parents("li").find("textarea").html();
                 $(this).parents("li").find("input[type=button]").show();
                 var conArea = $(this).parents("li").children().eq(1);
                 conArea.html(conText);
              });
              
              
              //글 수정을 위한 Ajax 연동 처리
              $(document).on("click",".update_btn",function(){//수정완료 누를때
                 alert("버튼이 눌리니 안눌리니");
                 var qaNo = $(this).parents("li").attr("data-num");
                 var qaContents = $("#content").val();
                 
                  $.ajax({
                     url : "/qnaanswer/"+qaNo+".ssm",
                     type : 'put',
                     headers : {
                              "Content-Type" : "application/json",
                              "X-HTTP-Method-Override":"PUT"},
                     data : JSON.stringify({
                        qaContents:qaContents}),
                     dataType : "text",
                     success : function(result){
                        console.log("result >>> : "+result);
                        if(result == "SUCCESS"){
                           alert("수정완료!");
                           listAll(qbNo);
                        }
                     },
                     error : function(){
                        alert("error");
                     }
                  })
                 
              });
              
              
              // 글 삭제를 위한 Ajax 연동 처리
              $(document).on("click","#deletebutton",function(){
                 
                 var qaNo = $(this).parents("li").attr("data-num");
                 console.log("qaNo >>> : "+qaNo);
                 
                 if(confirm("선택하신 댓글을 삭제 하시겠습니까?")){
                    $.ajax({
                       type : "patch",
                       url : "/qnaanswer/delete/"+qaNo+".ssm",
                       headers : {
                          "Content-Type" : "application/json",
                          "X-HTTP-Method-Override" : "PATCH"
                       },
                       dataType : "text",
                       success : function(result){
                          console.log("result >>> : "+result);
                          if(result == "SUCCESS"){
                             alert("삭제완료!");
                             listAll(qbNo);
                          }
                       },
                       error : function(){
                          alert("error");
                       }
                    });
                 }
                 
              });
              
           });
        
           function listAll(qbNo){
              $("#comment_list").html("");
              var url = "/qnaanswer/all/"+qbNo+".ssm";
              $.getJSON(url,function(data){
                 console.log(data.length);
                 
                 $(data).each(function(){
                    var qaNo = this.qaNo;
                    var ttNo = this.ttNo;
                    var ttImage = this.ttImage;
                    var ttName = this.ttName;
                    var qaContents = this.qaContents;
                    var qaInsertdate = this.qaInsertdate;
                    var qaUpdatedate = this.qaUpdatedate;
                    addNewItem(qaNo,ttNo,ttImage,ttName,qaContents,qaInsertdate,qaUpdatedate);
                 });
              }).fail(function(){
                 alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도 해주세요!.");
              });
           }
           
           // 새로운 글을 화면에 추가하기 위한 함수
           function addNewItem(qaNo,ttNo,ttImage,ttName,qaContents,qaInsertdate,qaUpdatedate){
              
              // 새로운 글이 추가될 li태그 객체
              var new_li = $("<table cellspacing='0' cellpadding='0' class='commentlist_box' width='100%;'>");
              new_li.attr("data-num",qaNo);
              new_li.addClass("comment_item");
              
              // 작성자 정보가 지정될 <p>태그
              var writer_p = $("<tr>");
              writer_p.addClass("writer");
              
              // 작성자의 이미지
              var image_span = $("<td align='left' width='15%'>");
              image_span.addClass("image");
              image_span.html("<img id='ttImg' style=width:30px; heigth:30px;  src='/file/"+ttImage+".png'>");
              
              // 작성자의 이름
              var name_span = $("<td  align='left'>");
              name_span.addClass("name");
              name_span.html(ttName+" 선생님");
              
              //작성일시, 수정일시
              var date_span = $("<td  align='right'>");
              date_span.html("   "+qaInsertdate+" ");
              
              //내용
              var content_p = $("<td class='com' colspan='3' >");
              content_p.addClass("con");
              content_p.html("<div class='combox'>"+qaContents+"</div>");
              
              //조립하기
              writer_p.append(image_span).append(name_span).append(date_span);
              new_li.append(writer_p).append(content_p);
              $("#comment_list").append(new_li);
              
              /* buttonsHide(ttNo); */
           }
           
           // INPUT 태그들에 대한 초기화 함수
           function dataReset(){
              $("#qaContents").val("");
              
           }
           
          <%--  //세션의로 값넣기
            function buttonsHide(ttNo){
               var myttno= "<%=sessionNO%>";
                 if(myttno!=ttNo){
                    $(".buttons").hide();
                 }
           } --%>
           
        </script>
        <style type="text/css">
           li {
           list-style: none;
              overflow: hidden;
           }
           
           textarea {
           		width : 90%;
           		height : 70px;
           		margin : 0 auto;
           }
           
           #qaInsert {
           	margin : 10px 0;
           }
        </style>
   </head>
   <body>
      <div class="clear_div"></div>
      <div id="content">
       <div class="comm_titmin mt_30">
       <hr style="margin-bottom:20px;">
         <span>답변 :</span>
      </div>
      <div class="container" id="qnaanswerContainer" >
         <div id="qnawrite">
            <div id="comment_list">
               <!-- 여기에 동적 생성 요소가 들어가게 됩니당. -->
            </div>
            <form id="qnaform" name="qnaform">
               <input type="hidden" name="ttNo" id="ttNo" value="<%=sessionNO%>">
               <div id="replywritediv">
                  <!--  세션값 벨류 넣기 -->
<!--                   <label for="qaContents">내용</label> -->
                  <textarea name="qaContents" id="qaContents"></textarea>
                  <br><br><span class="bt_search" id="qaInsert">저장하기</span>
               </div>
            </form>
         </div>
      </div>
      </div>
   </body>
</html>