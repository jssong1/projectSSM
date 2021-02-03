function goLogin(){
	
	 if($("input[name='userAuthority']:checked").val()==null){
		 Swal.fire('로그인 권한을 선택하시오')
		 return;
	 } else {
        $("#loginForm")
        .attr("action","/user/loginCheck.ssm")
        .submit();
	 }
 }

function goLogout(){
	 Swal.fire('로그아웃합니다') 
	 $("#userForm")
     .attr("action","/user/logout.ssm")
     .submit();
}

function goJoin(){
	location.href = "/user/joinCheckForm.ssm";
}
