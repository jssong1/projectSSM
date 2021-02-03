<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%@ page import="ssm.np.vo.Non_CenterVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%
   Object obj1 = request.getAttribute("ncList"); 
      String result="";
      
      ArrayList<Non_CenterVO> aList = (ArrayList<Non_CenterVO>) obj1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진로진학센터</title>
<script src="/include/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="/common/ssmCss/default.css">
<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
<link rel="stylesheet" href="/common/ssmCss/s_base.css">
<link rel="stylesheet" href="/common/ssmCss/s_content.css">
<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
<script src="/common/ssmJs/index.js"></script>
<script src="/include/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8da6b2781270c75565f674a8526d670&libraries=services"></script>
<script type="text/javascript">
   $(function(){
      var tab = "tab1";
      val(tab);
   });
   function val(data){
      $(".tab1").hide();
      $(".tab2").hide();
      $(".tab3").hide();
      $("."+data).show();
   }
</script>
<style type="text/css">

/* Tag Definition */
* {font-style:normal /* em, dfn, var, cite, address */;
 /*font-family:"나눔고딕", "NanumGothic" , "돋움", dotum, sans-serif; */
 font-family: "NanumSquare", "NanumGothic" , "돋움", dotum, sans-serif;
 margin:0; padding:0;}
 
 
 
table.infowindo {
   font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
   border: 1px solid #52A4E6;
   min-width: 300px;
   text-align: center;
   border-collapse: collapse;
}

table.infowindo td {
   width: 80px;
   border: 0px solid #AAAAAA;
   padding: 3px 2px;
     background:#53888b91 80%;
   text-align:left;
    font-weight: bold;
    color:#3b413b;
   
}
table.infowindo th {
   width: 80px;
   border: 0px solid #AAAAAA;
   padding: 3px 2px;
      background:cadetblue;
   
}
table.infowindo tbody td {
   font-size: 13px;
}

table.infowindo thead {
   background: #1C6EA4;
   background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
   background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
   background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
}

table.infowindo thead th {
   font-size: 15px;
   font-weight: bold;
   color: #FFFFFF;
   text-align: center;
}

table.infowindo tfoot {
   font-size: 10px;
   font-weight: bold;
   border-top: 1px solid #444444;
   /*
   background: #1C6EA4;
   background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
   background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
   background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
*/
}

table.infowindo tfoot td {
background:cadetblue;
   font-size: 10px;
}

table.infowindo tfoot .links {
   text-align: left;
}

table.infowindo tfoot .links a {
   display: inline-block;
   background: #81C581;
   color: #FFFFFF;
   padding: 2px 8px;
   border-radius: 5px;
}

.left-box {
   float: left;
   width: 50%;
   height: 100%;
   margin-bottom : 10px;
}

.right-box {
   float: right;
   width: 50%;
   height: 100%
}

.centerDiv {
   font-size : 20px;
   font-weight : bold;
   margin : 10px 0;
}
</style>
</head>
<body>
   <div id="wrap">
      <%@include file="/common/ssmMain/header_.jsp"%>
      <div class="subWrap">
       <%
      if(sessionAU.equals("1")){%>
         <nav include-html="/common/ssmMain/ssmCategory/brSsideNav.html"></nav>
   
      <%
         }else if(sessionAU.equals("2") || sessionAU.equals("3")){%>
            <nav include-html="/common/ssmMain/ssmCategory/brTsideNav.html"></nav>
      <%
         }
      %>
         <section>
          <div id="tit">
             <h1>우리지역 진로체험지원센터</h1>
             <p>
                <a href="#">홈</a> > <a href="co01.asp">비교과프로그램</a> > <a
                   href="co03.asp" class="on">진로체험지원센터</a>
             </p>
          </div>
          <div class="container"    style="    height: 600px;"  >
            <div id="content">
            

               <!--게시판-->

            
               <div class='left-box'>
                  <div class="centerDiv">
                  <span>우리지역센터</span>
                  </div>

               <p>진로체험지원센터 정보를 제공합니다</p>
                  <table class="view_box mt_10" style="width: 80%; margin: auto;">
                     <colgroup>
                        <col width="40%">
                        <col width="60%">
                     </colgroup>
                     <thead>
                        <tr>
                           <th scope="col" class="first">진로체험지원센터</th>
                           <th scope="col" class="last">전화번호</th>
                        </tr>
                     </thead>

                     <tbody id="oprInstList">
                        <%
                           for(int i =0; i<aList.size(); i++){  
                                                                                                Non_CenterVO ncVo = aList.get(i);
                              if(i > 0 && i <= 10){
                        %>
                        <tr class="tab1">
                           <th scope="row" style="border-left: 0;"><%=ncVo.getNcName()%>
                              <a href="#">
                                 <button onclick="abc('<%=i%>','<%=ncVo.getNcAddress()%>')">위치</button>
                           </a></th>
                           <td style="border-right: 0;"><%=ncVo.getNcTel()%></td>
                        </tr>
                        <%       
                              }else if(i > 10 && i <= 20){
                                 %>
                                 <tr class="tab2">
                                    <th scope="row" style="border-left: 0;"><%=ncVo.getNcName()%>
                                       <a href="#">
                                          <button onclick="abc('<%=i%>','<%=ncVo.getNcAddress()%>')">위치</button>
                                    </a></th>
                                    <td style="border-right: 0;"><%=ncVo.getNcTel()%></td>
                                 </tr>
                                 <%          
                              }else{
                                 %>
                                 <tr class="tab3">
                                    <th scope="row" style="border-left: 0;"><%=ncVo.getNcName()%>
                                       <a href="#">
                                          <button onclick="abc('<%=i%>','<%=ncVo.getNcAddress()%>')">위치</button>
                                    </a></th>
                                    <td style="border-right: 0;"><%=ncVo.getNcTel()%></td>
                                 </tr>
                                 <%          
                              }                                                                  
                        %>
                        
                        <%
                           }
                        %>
                        <tr>
                           <a href="#">
                              <button onclick="val('tab1')" class="pageNo2">1</button>
                           </a>
                           <a href="#">
                              <button onclick="val('tab2')" class="pageNo2">2</button>
                           </a>
                           <a href="#">
                              <button onclick="val('tab3')" class="pageNo2">3</button>
                           </a>
                        </tr>
                     </tbody>
                  </table>
               </div>


               <div class='right-box'>
                  <div id="map"
                     style="width: 100%; height: 500px; margin-top: 50px;"
                     class="right"></div>
               </div>
               <script>
              
               var mapContainer = document.getElementById('map');
               var mapOption = {
                   center: new daum.maps.LatLng(37.504985, 127.024737),
                   level: 7
               };  
         
               var map = new daum.maps.Map(mapContainer, mapOption); 
               
               
               
               // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
               var mapTypeControl = new kakao.maps.MapTypeControl();
         
               // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
               // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
               map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
         
               // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
               var zoomControl = new kakao.maps.ZoomControl();
               map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
               
               //주소->위도경도
               var geocoder = new daum.maps.services.Geocoder();
         
               //넣을 데이터 배열로 
               var listData = [
               <%for(int i =0; i<aList.size(); i++){  
                     Non_CenterVO ncVo = aList.get(i);
                     System.out.println("getNcName >> : " + ncVo.getNcName());%>           
                               {
                                  ind: '<%=i%>',
                                  name: '<%=ncVo.getNcName()%>'
                                  ,group : '<%=ncVo.getNcPosition()%>'
                                  ,phone : '<%=ncVo.getNcTel()%>'
                                  ,email : '<%=ncVo.getNcEmail()%>'
                                 ,address:'<%=ncVo.getNcAddress()%>'
                                 ,homePage :'<%=ncVo.getNcHomepage()%>'
                               },
                               
                             <%} //for끝%>   
               ]
               
                  var markers=[]; //마커들 배열로 관리 
                  var infos = [];   //infowindow창 배열로관리            
                  var bounds = new kakao.maps.LatLngBounds(); 
                  var level = map.getLevel();
                  
                  function abc(index,address) {
                      
                      geocoder.addressSearch(address, function(result, status){
                          if (status === daum.maps.services.Status.OK) {
                              var coords = new daum.maps.LatLng(result[0].y, result[0].x),
                              selectedMarker = null;
                              
                             
                              //지도에 표시되고 있는 기존마커와 인포창 제거
                               removeMarker();
                               closeInfoWindow();
                               
                               bounds.extend(coords);
                               //지도범위재설정
                               setBounds();
                           
                              
                              
                              //해당 좌표로 중심 이동
                               map.panTo(coords);
                            
                              //마커표시
                              var marker = new daum.maps.Marker({
                                 title: listData[index].ind,
                                  map: map,
                                  position: coords
                                  , clickable: true
                              });
                              marker.setMap(map); // 지도 위에 마커를 표출합니다
                            markers.push(marker);  // 배열에 생성된 마커를 추가합니다
                            
                            //인포창표시
                              var infowindow = new daum.maps.InfoWindow({
                                 title: listData[index].ind,
                                  content: '<table class="infowindo"><thead><tr><th colspan="2">'+listData[index].name
                                     +'</th></tr></thead><tbody><tr><td width="20px">소속</td><td>'+
                                     listData[index].group+'</td></tr><tr><td>연락처</td><td>'
                                     +listData[index].phone+'</td></tr><tr><td>담당자 이메일</td><td>'
                                     +listData[index].email+'</td></tr><tr><td>주소</td><td>'
                                     +listData[index].address+'</td></tr></tbody><tfoot><tr><td colspan="2"><div class="links"><a class="active" href="'
                                     +listData[index].homePage+'">홈페이지</a></div></td></tr></tfoot></table>'   
    
                                  ,removable : true   //닫기표시
                              });
                              infos.push(infowindow);
                              marker.setZIndex(index);                    
            
                                       infowindow.open(map, marker);  
                            
      
                          }//if
                          
                      });
                     
                  }//listData
                  
                  // 디폴트값으로 학교위치표시 
                  var markerPosition  = new kakao.maps.LatLng(37.503079, 127.024285); 
                  
                  //학교마커이미지 
                  var imageSrc = '/file/bitlogo.PNG', // 마커이미지의 주소입니다    
                   imageSize = new kakao.maps.Size(80, 77), // 마커이미지의 크기입니다
                   imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                     
                  // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                  var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
                  
                  // 마커를 생성합니다
                  var marker0 = new kakao.maps.Marker({
                      position: markerPosition,
                      image: markerImage
                  });
                  // 마커가 지도 위에 표시되도록 설정합니다
                  marker0.setMap(map);
                  
                  
                  function move(aaa){
                     alert(aaa +" : "+ listData[aaa].name);
                     var position = marker[aaa].title;
                     alert(position);
                     map.setCenter(position);
                  }
   
                  function setBounds() {
                      // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
                      // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
                       //지도 레벨 다시 세팅
                      map.setLevel(6);
                  }
                  
                  // 지도 위에 표시되고 있는 마커를 모두 제거합니다
                  function removeMarker() {
                      for ( var i = 0; i < markers.length; i++ ) {
                          markers[i].setMap(null);
                      }   
                      markers = [];
                  }
                  function closeInfoWindow() {
                      for ( var i = 0; i < infos.length; i++ ) {
                          infos[i].setMap(null);
                      }   
                      infos = [];
                  }
                  
            </script>
            </div>
            </div>
         </section>
      </div>
      <footer include-html="/common/ssmMain/footer.html"></footer>
   </div>
   <script>
      includeHTML();
   </script>
</body>

</html>