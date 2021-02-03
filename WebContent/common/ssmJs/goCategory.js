function goCareerDesign(sessionAU){
   if(sessionAU == "1"){
      location.href = "/test/goMainPage.ssm";
   }else if(sessionAU == "2"|| sessionAU == "3"){
      location.href = "/testTeacher/listStudent.ssm";
   }else if(sessionAU == ""){
	  location.href = "/test/goMainPage.ssm";
   }   
}

function goCounseling(sessionAU){
   if(sessionAU == "1"){
      location.href = "/onlineApplication/cgMain.ssm";
   }else if(sessionAU == "2"|| sessionAU == "3"){
      location.href = "/eduSchedule/eduRsvList.ssm";
   }else if(sessionAU == ""){
	  location.href = "/onlineApplication/cgMain.ssm";
   }
}

function goBigyogwaRecommend(you){
	location.href = "/nonprogram/np_Main.ssm";
}

function goEportfolio(sessionAU, you){
   if(sessionAU ==1){
      location.href = "/eportfolio/student.ssm";
   }
   if(sessionAU==2){
      location.href = "/eportfolio/teacher.ssm";
   }else if(sessionAU == ""){
	  location.href = "/eportfolio/student.ssm"; 
   }   
}

function goCommunity(){
   location.href = "/noticeboard/nblist.ssm";
}