function val_check(val,i){
   if(i == 46){
      return true;
   }else{
      if(val == "" || val == null || val == "직업을 선택해 주세요"){
         alert(i+"번 문항을 확인해 주세요.");
         return false;
      }else{
         return true;
      }
   }
   
}