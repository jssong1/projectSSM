<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "ssm.mi.vo.SMemberVO"%>
<% 
	SMemberVO smvo     = (SMemberVO)request.getAttribute("data");
	String    ssNo     = smvo.getSsNo();         // 학번
	String    ssBirth  = smvo.getSsBirth();      // 생년월일
	String    ssPn     = smvo.getSsPn();         // 휴대폰번호
	String    ssName   = smvo.getSsName();
	String    ssGender = smvo.getSsGender();
	
	String yy = ssBirth.substring(0, 4);
	String mm = ssBirth.substring(4,6);
	String dd = ssBirth.substring(6);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
      <title>학생 가입폼</title>
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
      <script type="text/javascript" src= "/include/js/common.js"></script>
      <script type = "text/javascript">   
         $(document).ready(function(){
            var idc =0; //아이디 중복 체크여부를 확인하는 변수
            var pwc =0; //비밀번호 체크여부를 확인하는 변수
            var ssGender= "<%=ssGender%>";
            if(ssGender="7"){$('input:radio[name="ssGender"][value="7"]').prop('checked', true);}
                        else{$('input:radio[name="ssGender"][value="8"]').prop('checked', true);}
            
             
            $("#ssPwCheck").click(function(){
               var ssPwVal = $("#ssPw").val();
               var ssPwCVal = $("#ssPwC").val();
               
               //비번 입력검사
               if (! ssPwVal){
                  console.log("(log)pw없음 >>> : " + ! ttPwVal);
                  alert("비밀번호를 입력하세요");
                  $("#ssPw").focus();
                  return false;               
               }//ssPwVal if 끝
               if(!ssPwCVal){
                  console.log("(log)pwC없음 >>> "+ !ssPwCVal);
                  alert("비밀번호 확인란을 입력하세요");
                  $("#ssPwC").focus();
                  return false; 
               }//if ssPwCVal끝
               
               if(ssPwVal == ssPwCVal){
                  alert("비밀번호가 확인되었습니다");
                  $("#ssPw").attr("readonly",true);
                  $("#ssPwC").attr("readonly",true);
                  pwc=Number(1);
               }else{
                  alert("비밀번호 불일치 : 다시 확인하세요");
                  $("#ssPw").val('');
                  $("#ssPwC").val('');
                  $("#ssPw").focus();
                  return false;
               }
            });//ssPwCheck clickfunction끝
            //이메일 입력방식 선택
             $('#selectEmail').change(function(){ 
                $("#selectEmail option:selected").each(function () { 
                   if($(this).val()== 'etc'){//직접입력일 경우
                      $("#ssEmail02").val(''); //값 초기화 
                      $("#ssEmail02").attr("disabled",false); //활성화
                   }else{ //직접입력이 아닐경우 
                      $("#ssEmail02").val($(this).text()); //선택값 입력 
                      $("#ssEmail02").attr("disabled",true); //비활성화
                  } 
                }); 
            });
            //아이디 중복체크
            $("#ssIdCheck").click(function(){
            	var ssIdVal = $("#ssId").val();
            	//아이디 입력검사
                if (!ssIdVal){
                   console.log("(log)id없음 >>> : " + ! ssIdVal);
                   alert("아이디를 입력하세요");
                   $("#ssId").focus();
                   return false;               
                }
            	$.ajax({
            		url : "/smember/ajaxIdCheck.ssm",
            		type : "get",
            		data : {ssId : ssIdVal},
            		success : function(data){
            			console.log(data);
            			var check = eval(data);
            			if(check){
            				 alert("사용 가능한 아이디입니다.");
                             $("#ssId").attr("readonly",true);
                             $("#ssIdCheck").hide();
                             $('#ajaxResData').html("중복체크완료");
                             idc=Number(1);
            			}else{
            				alert("중복된 아이디입니다.");
            				$("#ssId").val('');
            				$("#ssId").focus();
            				idc = Number(0);
            				return false;
            			}
            		},
            		error : function(){
            			console.log("error");
            		}
            	});
            	
            });//ssIdCheck clickfunction끝
            //가입버튼
            $("#insertData").click(function(){
               console.log("insertData_click >>> ");
               //입력값체크
               var ssEmail = $("#ssEmail01").val()+"@"+$("#ssEmail02").val();
               $("#ssEmail").val(ssEmail);
               
               if (!chkSubmit($('#ssId'),"아이디를")) return;
               else if (!chkSubmit($('#ssPw'),"패스워드를")) return;
               else if (!chkSubmit($('#ssPwC'),"패스워드 확인을")) return;
               else if (idc==0) return alert("아이디 중복체크를 확인해주세요.");
               else if (pwc==0) return alert("패스워드 확인을 체크하시오"); 
               else if (!chkSubmit($('#grGrade'),"학년을")) return;
               else if (!chkSubmit($('#grClass'),"반을")) return;
               else if (!chkSubmit($('#grNum'),"번호를")) return;
               else if (!chkSubmit($('#ssEmail01'),"이메일을")) return;
               else if (!chkSubmit($('#ssEmail02'),"이메일을")) return;
               else if (!chkSubmit($('#ssImage'),"사진을")) return;
               else{
                  if(confirm('등록을 진행할까요?')){
                     $("#joinForm").attr({
                        "method":"POST",
                        "action":"/smember/joinSMember.ssm"});
                     $("#joinForm").submit();
                  }//confirm
               }//else
            });//insertData_click   
         });//document ready
      </script>
      <script type="text/javascript">
      ////////반번호선택
      
      var g_selbox = new Array('1', '2', '3' );
      var c_selbox = new Array();   
         for (var i =0 ; i<3 ;i++){ c_selbox[i] = new Array('1', '2', '3', '4', '5');}
      var n_selbox = new Array();
         for (var i =0; i<5 ; i++){n_selbox[i] = new Array('1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
               '11', '12', '13', '14', '15', '16', '17', '18', '19', '20');}
         
      function init(f){
         console.log(f);
         console.log("init");
         var g_sel = f.grGrade;
         var c_sel = f.grClass;
         var n_sel = f.grNum;
         
         g_sel.options[0] = new Option("학년 선택", "");
         c_sel.options[0] = new Option("반 선택", "");
         n_sel.options[0] = new Option("번호 선택", "");

         for(var i =0; i<g_selbox.length; i++){
            g_sel.options[i+1] = new Option(g_selbox[i], g_selbox[i]);
         }
      }//init(f) onload

      function classIdChange(f){
         var g_sel = f.grGrade;
         var c_sel = f.grClass;
         
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
      
      function numIdChange(f){      
    	 var c_sel = f.grClass;
         var n_sel = f.grNum;
         
         var sel = c_sel.selectedIndex;
         for(var i=n_sel.length; i>=0; i--){
            n_sel.options[i] = null;
         }
         
         n_sel.options[0] = new Option("번호 선택", "");

         if(sel != 0){
            for(var i=0; i<n_selbox[sel-1].length; i++){
               n_sel.options[i+1] = new Option(n_selbox[sel-1][i], n_selbox[sel-1][i]);
            }
         }
      }
      function moveFocus(num,here,next){
          var str = here.value.length;
          if(str == num)
             next.focus();
          }
      </script>
   </head>
   <body onload = "init(this.joinForm);">
      <div align="center">
         <h3>학생 회원정보 입력 화면</h3>
         <form name="joinForm" id="joinForm"   method="POST"   enctype="multipart/form-data">
         <input type="hidden" name="ttPn" id="ttPn" value="<%=ssPn%>">
         
            <table border="1" align="center">
               <tr>
                  <th scope="row" colspan="2" align="center">
                     	학생 정보
                  </th>         
               </tr>
               <tr>
                  <th> 이름 </th>
                  <td><input type = text name="ssName" id="ssName" value="<%=ssName%>" readonly></td>
               </tr>
               <tr>
                  <th scope="row"> 생년월일</th>
                  <td>
                     <input type="text" id="yy"  style="width:80px;" maxlength="4" value ="<%=yy%>" readonly> 년
                     <input type="text" id="mm" name="mm"  style="width:80px;" value="<%=mm%>" readonly> 월                  
                     <input type="text" id="dd" name ="dd" style="width:80px;" value="<%=dd%>" maxlength="2">일   
                  </td>
               </tr>
               <tr>
                  <th scope="row"> 성별 </th>
                  <td>
                     <input type = "radio" name="ssGender" id="ssGenderF" value="7" disabled> 여성
                     <input type = "radio" name="ssGender" id="ssGenderM" value="8" disabled> 남성
                  </td>
               </tr>
               <tr>
                  <th scope="row"> 아이디</th>
                  <td>
                     <input type = text name= "ssId" id="ssId"/>
                     <input type="button" id="ssIdCheck" value="아이디중복체크"/>
                     <div id="ajaxResData">아이디 중복체크하시오</div>                        
                  </td>
               </tr>
               <tr>
                  <th scope="row"> 패스워드 </th>
                  <td> <input type="password"   name="ssPw" id="ssPw" size="21"></td>
               </tr>
               <tr>
                  <th scope="row"> 패스워드 확인</th>
                  <td>
                  <input type="password"   name="ssPwC" id="ssPwC" size="21"/>&nbsp;&nbsp;&nbsp;
                  <input type="button"   name="ssPwCheck" id="ssPwCheck" value="비밀번호확인"/>
                  </td>
               </tr>
              	<tr id="gradeClass" class="gradeClass">
                  <th scope="row"><label>학년/반/번호</label></th>
                  <td>
                     <select id="grGrade" name="grGrade" style="width:80px;" onchange="classIdChange(this.form);" ></select>
                     <label for="grGrade">학년</label>
                     <select id="grClass" name="grClass" style="width:80px;"  onchange="numIdChange(this.form);" ></select>
                     <label for="grClass">반</label>
                     <select id="grNum" name="grNum" style="width:80px;"></select>
                     <label for="grNum">번</label>
                  </td>
               </tr>
               <tr>
                  <th scope="row"> 이메일 </th>
                  <td><input type = hidden name="ssEmail" id="ssEmail">
                      <input type="text" name="ssEmail01" id="ssEmail01" style="width:100px"> 
                  @   <input type="text" name="ssEmail02" id="ssEmail02" style="width:100px;" disabled placeholder="선택해주세요"> 
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
                  <td><input type="file" id= "ssImage" name="ssImage"></td><br>
               </tr>
               <tr>
                  <td colspan="2" align="center">
                     <input type="button" id="insertData" value="가입" />
                     <input type="reset" value="다시"/>                     
                  </td>
               </tr>         
            </table>      
         </form>
      </div>
   </body>
</html>