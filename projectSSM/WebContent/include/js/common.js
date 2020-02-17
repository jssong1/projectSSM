/**chkSubmit(validation) */

function chkSubmit(v_item,v_msg){
	if(v_item.val().replace(/\s/g,"")==""){
		alert(v_msg+" 입력하시오");
		v_item.val("");
		v_item.focus();
		return false;
	}else{
		return true;
	}	
}